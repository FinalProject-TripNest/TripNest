package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.RoomsService;
import data.service.SearchService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;
    
	@Autowired
	private ImageService imageService;

    @GetMapping("/find/search")
    public ModelAndView searchHotels(@RequestParam Optional<String> address,
                                     @RequestParam Optional<Double> latitude,
                                     @RequestParam Optional<Double> longitude,
                                     @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkin,
                                     @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> checkout,
                                     @RequestParam Optional<Integer> personnelCount) {

        // 경도,위도 범위
        double errorRange = 0.515;

        // 기본값 설정 (지역, 경도, 위도)
        double defaultLatitude = 37.5519; 
        double defaultLongitude = 126.9918; 
        String defaultAddress = "서울"; 
       

        // 기본값 설정 (오늘과 내일 날짜)
        Calendar calendar = Calendar.getInstance();
        Date defaultCheckin = calendar.getTime(); // 오늘 날짜

        calendar.add(Calendar.DAY_OF_MONTH, 1); // 하루를 더해 내일 날짜로 설정
        Date defaultCheckout = calendar.getTime();
        
        // 기본값 설정 (인원 수)
        Integer defaultPersonnel = 1;
        
        // 실제 사용될 값 설정
        double Latitude = latitude.orElse(defaultLatitude);
        double Longitude = longitude.orElse(defaultLongitude);
        String Address = address.orElse(defaultAddress);
        Date Checkin = checkin.orElse(defaultCheckin);
        Date Checkout = checkout.orElse(defaultCheckout);
        Integer Personnel = personnelCount.orElse(defaultPersonnel);

        // HotelService를 통해 오차 범위 내의 호텔을 가져옴
        List<RoomsDto> hotels = searchService.findHotelsNearby(Latitude, Longitude, errorRange, Checkin, Checkout,Personnel);
        
        List<String> roomIds = hotels.stream().map(RoomsDto::getRoom_id).collect(Collectors.toList());
        		
		List<ImagesDto> imagesDto = imageService.hotelNearbyImages(roomIds);
		
		System.out.print(roomIds);
		System.out.print(imagesDto);

        ModelAndView model = new ModelAndView();
        model.addObject("hotels", hotels);
		model.addObject("imagesDto", imagesDto);
        model.addObject("latitude", Latitude);
        model.addObject("longitude", Longitude);
        model.addObject("address", Address);
        model.addObject("checkin",Checkin);
        model.addObject("checkout",Checkout);

        // 뷰 이름 설정
        model.setViewName("/find/search"); // JSP 파일 이름을 반환

        return model;
    }
    
}
