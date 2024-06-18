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

	@GetMapping("/journal/list")
	public ModelAndView journalPage() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> dto = service.dataList();
		model.addObject("dto", dto);
		model.setViewName("/journal/journal");
		return model;
	}
	
	@GetMapping("/journal/addform")
	public String showAddForm()
	{
		
		
		return "journal/journal_addform";
	}

}
