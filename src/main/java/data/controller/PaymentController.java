package data.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import com.siot.IamportRestClient.IamportClient;
import data.dto.RequestData;
import data.dto.ReservationDto;
import data.dto.coupon.UseCouponReq;
import data.service.RefundService;
import data.service.ReservationTransactionManager;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.PaymentDto;
import data.dto.Reservation_successDto;
import data.dto.RoomsDto;
import data.service.PaymentService;
import data.service.RoomsService;
import jakarta.servlet.http.HttpSession;

@Controller
@Slf4j
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	@Autowired
	RoomsService roomsService;
	@Autowired
	ReservationTransactionManager reservationTransactionManager;
	@Autowired
	RefundService refundService;

	@Value("${imp.api.key}")
	private String apiKey;

	@Value("${imp.api.secretkey}")
	private String secretKey;

	private IamportClient iamportClient;
	@PostConstruct
	public void init() {
		this.iamportClient = new IamportClient(apiKey, secretKey);
	}

	
	@GetMapping("/find/reservation_success")
	public ModelAndView success_page(@RequestParam String merchant_uid) 
	{
		ModelAndView model = new ModelAndView();
		
		Reservation_successDto successDto=paymentService.getSuccessOneData(merchant_uid);
		
		int room_id=successDto.getROOM_ID();
		String room_id_str = String.valueOf(room_id);
		
		RoomsDto roomsDto=roomsService.getOneData(room_id_str);
		String roomimage=paymentService.getImgByRoomId(room_id_str);
		
		model.addObject("roomimage",roomimage);
		model.addObject("successDto",successDto);
		model.addObject("roomsDto",roomsDto);
		
		
		model.setViewName("/find/reservation_success");
		return model;
	}

	@PostMapping("/payment/complete")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> paymentComplete(@RequestBody RequestData requestData, HttpSession session) throws IOException {
	    
	    Map<String, Object> response = new HashMap<>();
	    
	    PaymentDto paymentDto = requestData.getPaymentDto();
	    ReservationDto reservationDto = requestData.getReservationDto();
	    UseCouponReq useCouponReq = requestData.getUseCouponReq();


	    log.info("paymentDto : {}", paymentDto);
	    log.info("reservationDto : {}", reservationDto);
	    log.info("useCouponReq : {}", useCouponReq);

	    try {
	        // 세션에서 member_id를 가져옴
	        Integer memberId = (Integer) session.getAttribute("member_id");

	        // PaymentDto에 memberId 설정, UseCouponReq에 memberId 설정
	        if (memberId != null) {
	            paymentDto.setMember_id(memberId);
	            useCouponReq.setMemberId(memberId.toString());
	        } else {
	            throw new IllegalArgumentException("member_id not found in session.");
	        }

	        reservationTransactionManager.processBookingTransaction(useCouponReq, paymentDto, reservationDto);

	        log.info("결제 성공 : 주문 번호 {}", paymentDto.getMerchant_uid());
	        
	        // merchant_uid를 URL 인코딩하여 응답 데이터에 포함
	        String encodedMerchantUid = URLEncoder.encode(paymentDto.getMerchant_uid(), StandardCharsets.UTF_8);
	        response.put("success", true);
	        response.put("redirectUrl", "/find/reservation_success?merchant_uid=" + encodedMerchantUid);
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {

			String token = refundService.getToken(apiKey, secretKey);
			refundService.refundRequest(token, paymentDto.getMerchant_uid(), e.getMessage());

	        response.put("success", false);
	        response.put("message", "결제 처리 중 오류가 발생했습니다.\n" + e.getMessage());
			response.put("redirectUrl", "/find/list/detail?room_id="+reservationDto.getRoomId());

	        return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	//환불로직
	 @PostMapping("/payment/cancel")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> cancelBooking(@RequestBody Map<String, Object> requestData, HttpSession session) {
	        Map<String, Object> response = new HashMap<>();

	        String merchant_uid = (String) requestData.get("merchant_uid");

	        try {
	            // 세션에서 member_id를 가져옴
	            Integer memberId = (Integer) session.getAttribute("member_id");

	            String token = refundService.getToken(apiKey, secretKey);
				refundService.refundRequest1(token, merchant_uid, "전액환불");
	            
	            
	            // 예약 및 결제 취소 트랜잭션 실행
	            reservationTransactionManager.cancelBookingTransaction(merchant_uid);

	            response.put("success", true);
	            response.put("message", "예약 및 결제가 취소되었습니다.");
	            return ResponseEntity.ok(response);
	        } catch (Exception e) {
	            response.put("success", false);
	            response.put("message", "예약 및 결제 취소 중 오류가 발생했습니다.\n" + e.getMessage());
	            return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body(response);
	        }
	    }



}
