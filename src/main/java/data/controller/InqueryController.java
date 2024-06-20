package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.InqueryDto;
import data.service.InqueryService;
import jakarta.servlet.http.HttpSession;

@Controller
public class InqueryController {

	@Autowired
	InqueryService service;
	
	@GetMapping("/inquery/inqueryform")
	public String inqueryform() {
		return "/inquery/inqueryform";
	}
	
	@PostMapping("/inquery/insert")
	public String insert(@ModelAttribute InqueryDto dto,HttpSession session) {
		
		service.insertInquery(dto);
		
		return "/inquery/inquerysuccess";
	}
	
	//이거 내가 보기편하게 만든거. 나중에 삭제할것
	@GetMapping("/inquery/inquerysuccess")
	public String inquerysuccess() {
		return "/inquery/inquerysuccess";
	}
	

	

}
