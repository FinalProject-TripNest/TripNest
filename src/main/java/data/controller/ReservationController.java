package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;
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
			@RequestParam int childCount, @RequestParam int babyCount) 
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount=adultCount+childCount+babyCount;
		dto.setRESERVATION_CAPACITY(totalCount);
		
		reservationService.insertReservation(dto);
		
	     
		model.setViewName("/find/reservation_success");
		return model;
	}

}
