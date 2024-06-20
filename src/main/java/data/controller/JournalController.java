package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.JournalDto;
import data.service.JournalService;

@Controller
public class JournalController {

	@Autowired
	JournalService service;

	@GetMapping("/journal/list")
	public ModelAndView journalPage() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> dto = service.dataList();
		model.addObject("dto", dto);
		model.setViewName("/journal/journal");
		return model;
	}

	@GetMapping("/journal/detail")
	public ModelAndView journalDetail(@RequestParam("journal_id") String journal_id) {
		ModelAndView model = new ModelAndView();
		JournalDto dto = service.getOneData(journal_id);
		model.addObject("dto", dto);
		model.setViewName("/journal/detail");
		return model;
	}

}
