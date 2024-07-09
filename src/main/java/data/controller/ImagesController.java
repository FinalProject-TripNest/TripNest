package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.service.ImageService;

@Controller
public class ImagesController {

	@Autowired
	ImageService service;
	
	@GetMapping("/image/imagephoto")
	public ModelAndView imglist(){
		List<ImagesDto> list=service.getAllRoomPhoto();
		ModelAndView model=new ModelAndView();
		model.addObject("img", list);
		model.setViewName("image/test");
		return model;
	}
}
