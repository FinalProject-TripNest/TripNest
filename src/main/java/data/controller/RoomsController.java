package data.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.MemberService;
import data.service.RoomsService;
import data.service.S3UploaderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class RoomsController {

	@Autowired
	RoomsService service;
	@Autowired
	ImageService imgservice;
	@Autowired
	S3UploaderService s3service;
	@Autowired
	MemberService mservice;

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
	public String insert(@ModelAttribute RoomsDto dto, List<MultipartFile> image_upload, HttpSession session,
			HttpServletRequest request) {

		// 방 서비스 배열을 쉼표로 구분된 문자열로 변환
		String[] room_service = request.getParameterValues("room_service[]");
		String roomServiceString = String.join(",", room_service);
		dto.setRoom_service(roomServiceString);
		
		//room_region 추가, room_address의 앞글자만 가져왔음
		String roomaddr=dto.getRoom_address();
		String roomregion=roomaddr.split("\\s+")[0];
		dto.setRoom_region(roomregion);
		
		//member_id 구해오기
		String memberemail=(String)session.getAttribute("myid");
		int memid=mservice.findByEmail(memberemail).getMember_id();
		dto.setMember_id(memid);
		
		service.insertRoom(dto);
		
		 // 방 정보 삽입 후, room 의 마지막에 등록된 romm_id값을 가져와서 images테이블에 넣어줌.
        int room_id = service.getLastInsertedRoomId(); 
       
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyMMdd");
		for(MultipartFile multi:image_upload) {


			try {

				///roomphohto 는 s3에 등록할 파일명?같은거 path
				String imageUrl = s3service.upload(multi, "roomphoto");

                //images 테이블에 image_id당 하나의 이미지만 들어가게끔

				ImagesDto imgdto=new ImagesDto();
				imgdto.setRoom_id(String.valueOf(room_id));
				imgdto.setImage_photo(imageUrl);
				imgservice.insertImage(imgdto);

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "/room/roominsertsuccess";


	}
	


}