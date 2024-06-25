package data.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
import data.service.PaymentService;
import data.service.ReservationService;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;

	@GetMapping("/find/reservation")
	public ModelAndView booking(@RequestParam int room_id, HttpSession session) {
		ModelAndView model = new ModelAndView();

		RoomsDto roomsDto = reservationService.getOneData(room_id);

		// 세션에서 myid를 가져옴
		String myid = (String) session.getAttribute("myid");

		MemberDto memberDto = reservationService.getOneData_member(myid);

		model.addObject("memberDto", memberDto);
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
		dto.setRESERVATION_CAPACITY(totalCount);
		
		//결제되면서 만들어진 주문번호 reservation 테이블에 넣기
		dto.setMERCHANT_UID(merchant_uid);
		
		reservationService.insertReservation(dto);
		
		// merchant_uid를 URL 인코딩하여 리다이렉트 URL에 포함
	    String encodedMerchantUid = URLEncoder.encode(merchant_uid, StandardCharsets.UTF_8);
	    model.setViewName("redirect:/find/reservation_success?merchant_uid=" + encodedMerchantUid);
	    
		return model;
	}
	
}
