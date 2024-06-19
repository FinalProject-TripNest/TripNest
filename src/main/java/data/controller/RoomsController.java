package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.ImagesDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.RoomsService;
import data.service.S3UploaderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RoomsController {

	@Autowired
	RoomsService service;
	@Autowired
	ImageService imgservice;
	@Autowired
	S3UploaderService s3service;

	@Value("${kakao-api-key}")
	private String apikey;

	@GetMapping("/room/roominsert")
	public ModelAndView roomform() {
		ModelAndView model = new ModelAndView();
		model.addObject("apikey", apikey);
		model.setViewName("/room/roominsertform");
		return model;
	}
	
	@PostMapping("/room/insert")
	public String insert(@ModelAttribute RoomsDto dto,
			List<MultipartFile> image_upload, 
			HttpSession session,
			HttpServletRequest request) {
		
		// 방 서비스 배열을 쉼표로 구분된 문자열로 변환
		String[] room_service = request.getParameterValues("room_service[]");
	    String roomServiceString = String.join(",", room_service);
	    dto.setRoom_service(roomServiceString);
		
		
		service.insertRoom(dto);
		
		 // 방 정보 삽입 후, room 의 마지막에 등록된 romm_id값을 가져와서 images테이블에 넣어줌.
        int room_id = service.getLastInsertedRoomId(); 
        
		String photo="";
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyMMdd");
		for(MultipartFile multi:image_upload) {
			//String newName=sdf.format(new Date())+"_"+multi.getOriginalFilename();
			//photo+=newName+",";
			try {
				
				//roomphohto 는 s3에 등록할 파일명?같은거 path
				String imageUrl = s3service.upload(multi, "roomphoto");
                photo += imageUrl + ",";
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		photo=photo.substring(0, photo.length()-1);
		
		ImagesDto imgdto=new ImagesDto();
		imgdto.setRoom_id(room_id);
		imgdto.setImage_photo(photo);
		
		imgservice.insertImage(imgdto);

		return "redirect:/";

	}

}