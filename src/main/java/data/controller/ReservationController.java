package data.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.JournalDto;

@Controller
public class ReservationController {
	
	@GetMapping("/find/reservation")
	public ModelAndView booking() {
		ModelAndView model = new ModelAndView();
		
		
		model.setViewName("/find/reservation");
		return model;
	}
	
}
