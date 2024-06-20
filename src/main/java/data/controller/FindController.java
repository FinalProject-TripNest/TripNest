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

		List<RoomsDto> roomDtoList = roomsService.getAllRoomsData();
		model.addObject("roomDtoList", roomDtoList);
		model.setViewName("find/list");
		System.out.println("roomDtoList.size() = " + roomDtoList.size());

		return model;
	}

	@GetMapping("/find/list/detail")
	public ModelAndView detail(@RequestParam("room_id") String room_id) {
		ModelAndView detailModel = new ModelAndView();

		RoomsDto detailDto = roomsService.getRoomsDataByRoomId(room_id);
		detailDto.setRoomImgList(roomsService.getRoomImgByRoomId(room_id));
		detailModel.addObject("detailDto", detailDto);
		detailModel.setViewName("find/detail");

		for(String img : detailDto.getRoomImgList()) {
			System.out.println("img = " + img);
		}


		detailModel.addObject("apikey",apikey);

		return detailModel;
	}

}