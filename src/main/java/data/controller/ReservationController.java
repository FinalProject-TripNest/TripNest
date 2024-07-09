package data.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;
import data.dto.coupon.CouponDto;
import data.service.CouponService;
import data.service.PaymentService;
import data.service.ReservationService;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;
	
	@Autowired
	CouponService couponService;

	@GetMapping("/find/reservation")
	public ModelAndView booking(@RequestParam String room_id, @RequestParam String checkin, @RequestParam String checkout, HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		// String room_id를 int로 변환
	    int roomIdInt = Integer.parseInt(room_id);
	    
		RoomsDto roomsDto = reservationService.getOneData(roomIdInt);

		// 세션에서 myid를 가져옴
		String myid = (String) session.getAttribute("myid");
				
		 // 세션에서 member_id를 가져와 문자열로 변환
        Integer memberIdInteger = (Integer) session.getAttribute("member_id");
        String member_id = memberIdInteger != null ? memberIdInteger.toString() : null;

		MemberDto memberDto = reservationService.getOneData_member(myid);
		List<CouponDto> couponDto= couponService.getMemberCoupons(member_id);
		
		
		model.addObject("checkin", checkin);	
		model.addObject("checkout", checkout);
		model.addObject("memberDto", memberDto);
		model.addObject("couponDto", couponDto);
		model.addObject("roomsDto", roomsDto);
		model.setViewName("/find/reservation");
		return model;
	}

	@PostMapping("/find/reservationInfo")
	public ModelAndView insert(@ModelAttribute ReservationDto dto, @RequestParam int adultCount,
			@RequestParam int childCount, @RequestParam int babyCount, @RequestParam String merchant_uid) 
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount=adultCount+childCount+babyCount;
		dto.setReservationCapacity(totalCount);
		
		//결제되면서 만들어진 주문번호 reservation 테이블에 넣기
		dto.setMerchantUid(merchant_uid);
		
		reservationService.insertReservation(dto);
		
		model.addObject("merchant_uid", merchant_uid);
		
		
		// merchant_uid를 URL 인코딩하여 리다이렉트 URL에 포함
	    String encodedMerchantUid = URLEncoder.encode(merchant_uid, StandardCharsets.UTF_8);
	    model.setViewName("redirect:/find/reservation_success?merchant_uid=" + encodedMerchantUid);
	    
		return model;
	}
	
}
