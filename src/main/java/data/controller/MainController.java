package data.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import data.service.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.JournalDto;
import data.dto.PromotionDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.JournalService;
import data.service.PromotionService;
import data.service.RoomsService;

@Controller
public class MainController {


	@Autowired
	JournalService journalService;

	@Autowired
	PromotionService promotionService;

	@Autowired
	RoomsService roomsService;

	@Autowired
	ImageService imageService;

	@GetMapping("/")
	public String start() {
		return "redirect:index";
	}

	@GetMapping("index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> journalDto = journalService.dataList();
		List<PromotionDto> promotionDto = promotionService.dataList();
		List<RoomsDto> roomsDto = roomsService.dataList();
		List<ImagesDto> imageDto = imageService.dataList();

		
		double defaultLatitude = 37.5519; double defaultLongitude = 126.9918;
		
		String defaultAddress = "서울";

		// 기본값 설정 (오늘과 내일 날짜)
		Calendar calendar = Calendar.getInstance();
		Date Checkin = calendar.getTime(); // 오늘 날짜

		calendar.add(Calendar.DAY_OF_MONTH, 1); // 하루를 더해 내일 날짜로 설정
		Date Checkout = calendar.getTime();

		// 날짜 포맷 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 포맷팅된 날짜 출력
		String defaultCheckin = sdf.format(Checkin);
		String defaultCheckout = sdf.format(Checkout);
		
		Integer personnelCount = 2;
		
		String defaultDate = defaultCheckin + " ~ " + defaultCheckout;

		model.addObject("journalDto", journalDto);
		model.addObject("promotionDto", promotionDto);
		model.addObject("roomsDto", roomsDto);
		model.addObject("imageDto", imageDto);
		model.addObject("defaultLatitude", defaultLatitude);
		model.addObject("defaultLongitude", defaultLongitude);
		model.addObject("defaultAddress", defaultAddress);
		model.addObject("defaultCheckin", defaultCheckin);
		model.addObject("defaultCheckout", defaultCheckout);
		model.addObject("defaultDate", defaultDate );
		model.addObject("personnelCount", personnelCount);
		model.setViewName("/main/index");
		return model;
	}

}
