package data.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.JournalDto;

@Controller
public class JournalController {

	@GetMapping("journal")
	public ModelAndView journalPage() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> dto = new ArrayList<>();
		model.addObject("dto", dto);
		model.setViewName("/journal/journal");
		return model;
	}

}
