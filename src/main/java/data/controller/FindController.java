package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Value("${kakao-api-key}")
	private String apikey;

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
	public ModelAndView detail(@RequestParam("room_id") String room_id) {
		ModelAndView detailModel = new ModelAndView();
		RoomsDto detailDto = roomsService.getOneData(room_id);
		List<ImagesDto> imageDto = imageService.imgList(room_id); // 이미지 서비스에서 String으로 전달
		detailModel.addObject("detailDto", detailDto); // 변수명 수정
		detailModel.addObject("imageDto", imageDto); // 변수명 수정
		detailModel.setViewName("find/detail");

		detailModel.addObject("apikey",apikey);

		return detailModel;
	}

}