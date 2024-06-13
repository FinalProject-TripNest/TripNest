package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.JournalDto;
import data.service.JournalService;

@Controller
public class JournalController {

	@Autowired
	JournalService service;

	@GetMapping("journal")
	public ModelAndView journalPage() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> dto = service.dataList();
		model.addObject("dto", dto);
		model.setViewName("/journal/journal");
		System.out.println(dto);
		return model;
	}

}
