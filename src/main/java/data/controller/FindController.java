package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.RoomsService;

@Controller
public class FindController {

	@Autowired
	RoomsService roomsService;

	@Autowired
	ImageService imageService;

	@GetMapping("/find/list")
	public ModelAndView journalPage() {
		ModelAndView model = new ModelAndView();
		List<RoomsDto> roomsDto = roomsService.dataList();
		List<ImagesDto> imageDto = imageService.dataList();
		model.addObject("roomsDto", roomsDto);
		model.addObject("imageDto", imageDto);
		model.setViewName("/find/list");
		return model;
	}

	@GetMapping("/find/list/detail")
	public ModelAndView detail() {
		ModelAndView model2 = new ModelAndView();
		List<RoomsDto> roomsDto2 = roomsService.dataList();
		List<ImagesDto> imageDto2 = imageService.dataList();
		model2.addObject("roomsDto2", roomsDto2);
		model2.addObject("imageDto2", imageDto2);
		model2.setViewName("find/datail");
		return model2;
	}

}