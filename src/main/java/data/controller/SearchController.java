package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.RoomsDto;
import data.mapper.RoomsMapperInter;
import data.service.ImageService;
import data.service.RoomsService;
import data.service.SearchService;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;
    
	@Autowired
	private ImageService imageService;

    @GetMapping("/find/search")
    public ModelAndView searchHotels(@RequestParam(defaultValue = "서울") String address,
                                     @RequestParam(defaultValue = "37.5519") Double latitude,
                                     @RequestParam(defaultValue = "126.9918") Double longitude,
                                     @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkin,
                                     @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkout,
                                     @RequestParam(defaultValue = "2") Integer personnelCount) {

        // 경도,위도 범위
        double errorRange = 0.15;

        // 기본값 설정 (오늘과 내일 날짜)
        Calendar calendar = Calendar.getInstance();
        Date defaultCheckin = calendar.getTime(); // 오늘 날짜

        calendar.add(Calendar.DAY_OF_MONTH, 1); // 하루를 더해 내일 날짜로 설정
        Date defaultCheckout = calendar.getTime();
        
        // 실제 사용될 값 설정
        Date beforeCheckin = checkin.orElse(defaultCheckin);
        Date beforeCheckout = checkout.orElse(defaultCheckout);
       
        
        // 입력 문자열의 포맷터 정의
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
        
        // 문자열을 LocalDateTime으로 변환
        LocalDateTime CheckinTime = LocalDateTime.parse(beforeCheckin.toString(), inputFormatter);
        LocalDateTime CheckoutTime = LocalDateTime.parse(beforeCheckout.toString(), inputFormatter);
        
        // 출력 문자열의 포맷터 정의
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        // 원하는 형식으로 변환하여 출력
        String Checkin = CheckinTime.format(outputFormatter);
        String Checkout = CheckoutTime.format(outputFormatter);
        
        String defaultDate = Checkin + " ~ " + Checkout;

        // HotelService를 통해 오차 범위 내의 호텔을 가져옴
        List<RoomsDto> roomsDto = searchService.findHotelsNearby(latitude, longitude, errorRange, Checkin, Checkout, personnelCount);
        for (RoomsDto room : roomsDto) {
			String[] addressParts = room.getRoom_address().split(" ");
			if (addressParts.length >= 2) {
				room.setCity(addressParts[0]);
				room.setDistrict(addressParts[1]);
			}
		}
        
        List<String> roomIds = roomsDto.stream().map(RoomsDto::getRoom_id).collect(Collectors.toList());
        
        List<ImagesDto> imagesDto = new ArrayList<>(); // 초기화
        
        if(roomIds != null && !roomIds.isEmpty()) {
          imagesDto = imageService.hotelNearbyImages(roomIds);
        }
		
		/* System.out.print(hotels); */
        System.out.print(imagesDto);
        System.out.print(roomsDto);
        
        
        ModelAndView model = new ModelAndView();
        model.addObject("roomsDto", roomsDto);
		model.addObject("imagesDto", imagesDto);
        model.addObject("latitude", latitude);
        model.addObject("longitude", longitude);
        model.addObject("address", address);
        model.addObject("checkin",Checkin);
        model.addObject("checkout",Checkout);
        model.addObject("personnelCount", personnelCount);
        model.addObject("defaultDate", defaultDate );

        // 뷰 이름 설정
        model.setViewName("/find/search"); // JSP 파일 이름을 반환

        return model;
    }
    
}
