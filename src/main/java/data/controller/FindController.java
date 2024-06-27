package data.controller;

import java.util.List;

import data.service.redis.RedisService;
import lombok.RequiredArgsConstructor;
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

	@Autowired
	RedisService redisService;

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
		detailDto.setRoomImgList(roomsService.getImgsByRoomId(room_id));
		detailModel.addObject("detailDto", detailDto);
		detailModel.setViewName("find/detail");

		detailModel.addObject("apikey",apikey);

		// detail 페이지 접속시 조회수 1증가
		redisService.addToSortedSet("viewRank", room_id);

		return detailModel;
	}

}