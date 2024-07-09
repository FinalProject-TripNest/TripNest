package data.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import data.service.redis.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.ReservationDto;
import data.dto.ReviewDto;
import data.dto.ReviewJoinDto;

import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.ReviewService;
import data.service.RoomsService;
import data.service.SearchService;

@Controller
public class FindController {

	@Autowired
	RoomsService roomsService;

	@Autowired
	ImageService imageService;
	
	@Autowired
	SearchService searchService;

	@Autowired
	RedisService redisService;

	@Autowired
	ReviewService reviewService;

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
	public ModelAndView detail(@RequestParam("room_id") String room_id,
			@RequestParam(defaultValue = "서울") String address,
			@RequestParam(defaultValue = "37.5519") Double latitude,
			@RequestParam(defaultValue = "126.9918") Double longitude,
			@RequestParam(defaultValue = "2") Integer personnelCount,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkin,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkout ) {
		ModelAndView detailModel = new ModelAndView();

		RoomsDto detailDto = roomsService.getOneData(room_id);
		List<ImagesDto> imageDto = imageService.imgList(room_id); // 이미지 서비스에서 String으로 전달
		List<ReservationDto> reservationDto = searchService.getReservationsByRoomId(room_id);
		
        // 기본값 설정 (오늘과 내일 날짜)
        Calendar calendar = Calendar.getInstance();
        Date defaultCheckin = calendar.getTime(); // 오늘 날짜

        calendar.add(Calendar.DAY_OF_MONTH, 1); // 하루를 더해 내일 날짜로 설정
        Date defaultCheckout = calendar.getTime();
        
        // 실제 사용될 값 설정
        Date Checkin = checkin.orElse(defaultCheckin);
        Date Checkout = checkout.orElse(defaultCheckout);
        
     // 입력 문자열의 포맷터 정의
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
        
        // 문자열을 LocalDateTime으로 변환
        LocalDateTime CheckinTime = LocalDateTime.parse(Checkin.toString(), inputFormatter);
        LocalDateTime CheckoutTime = LocalDateTime.parse(Checkout.toString(), inputFormatter);
		
		 // 출력 문자열의 포맷터 정의
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        // 원하는 형식으로 변환하여 출력
        String CheckinFormatted = CheckinTime.format(outputFormatter);
        String CheckoutFormatted = CheckoutTime.format(outputFormatter);
        
        String defaultDate = CheckinFormatted + " ~ " + CheckoutFormatted;
		
		detailModel.addObject("detailDto", detailDto); // 변수명 수정
		detailModel.addObject("imageDto", imageDto); // 변수명 수정
		detailModel.addObject("reservationDto",reservationDto);
		detailModel.addObject("checkin",CheckinFormatted);
		detailModel.addObject("checkout",CheckoutFormatted);
		detailModel.addObject("defaultDate",defaultDate);
		detailModel.addObject("latitude", latitude);
		detailModel.addObject("longitude", longitude);
		detailModel.addObject("address", address);
		detailModel.addObject("personnelCount", personnelCount);


		RoomsDto searchDto = roomsService.getRoomsDataByRoomId(room_id);
        searchDto.setRoomImgList(roomsService.getImgsByRoomId(room_id));
		detailModel.addObject("detailDto", searchDto);

		detailModel.setViewName("find/detail");
		List<ReviewJoinDto> ReviewJoinDto = reviewService.dataList(room_id);
		detailModel.addObject("ReviewJoinDto", ReviewJoinDto);

		detailModel.addObject("apikey", apikey);

		// detail 페이지 접속시 조회수 1증가
		redisService.addToSortedSet("viewRank", room_id);

		return detailModel;
	}

}