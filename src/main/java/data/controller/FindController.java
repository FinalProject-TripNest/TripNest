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

}
