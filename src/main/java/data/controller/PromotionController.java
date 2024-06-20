package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.JournalDto;
import data.dto.PromotionDto;
import data.service.PromotionService;

@Controller
public class PromotionController {

	@Autowired
	PromotionService service;

	@GetMapping("/promotion/list")
	public ModelAndView promotionPage() {
		ModelAndView model = new ModelAndView();
		List<PromotionDto> dto = service.dataList();
		model.addObject("dto", dto);
		model.setViewName("/promotion/promotion");
		return model;
	}

	@GetMapping("/promotion/detail")
	public ModelAndView promotionDetail(@RequestParam("promotion_id") String promotion_id) {
		ModelAndView model = new ModelAndView();

		PromotionDto dto = service.getOneData(promotion_id);
		model.addObject("dto", dto);
		model.setViewName("/promotion/detail");
		return model;
	}

}
