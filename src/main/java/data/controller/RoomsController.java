package data.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println("memberemail:"+memberemail);
		
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
	

	@GetMapping("/room/delete")
	public String deleteroom(String room_id,HttpSession session) {
		
		List<ImagesDto> imglist=imgservice.imgList(room_id);
		
		  // S3에서 이미지 삭제
	    for (ImagesDto imgdto : imglist) {
	        String imgphoto = imgdto.getImage_photo();
	        String s3Key = extractFilePath(imgphoto);
	        s3service.deleteFile(s3Key);
	    }

		imgservice.deleteImage(room_id);
		service.deleteRoom(room_id);
		
		return "/room/roomlist";
	}
	

	// URL에서 S3 파일 경로를 추출하는 메서드
	private String extractFilePath(String fileUrl) {
	    try {
	        String decodedFileName = URLDecoder.decode(fileUrl, "UTF-8");
	        // "roomphoto/"를 포함하여 반환
	        int index = decodedFileName.indexOf("roomphoto/");
	        return decodedFileName.substring(index);
	    } catch (UnsupportedEncodingException e) {
	        System.out.println("Error while decoding the file URL: " + e.getMessage());
	        return null;
	    }
	}
	

	
	@GetMapping("/room/roomlist")
	public ModelAndView roomlist(HttpSession session) {
		ModelAndView mview=new ModelAndView();
		
		 // 세션에서 member_id 가져오기
        String memberEmail = (String) session.getAttribute("myid");
        Integer memberId = mservice.findByEmail(memberEmail).getMember_id();
		
		
		List<RoomsDto> roomlist=service.getRoomDataByMyid(memberId);
		mview.addObject("roomlist", roomlist);
		mview.addObject("memberId", memberId);
		mview.setViewName("/room/roomlist");
		
		return mview;
		
	}
	
	@GetMapping("/room/myroomlist")
	@ResponseBody
	public List<RoomsDto> roomlistid(HttpSession session){
		
		 // 세션에서 member_id 가져오기
        String memberEmail = (String) session.getAttribute("myid");
        Integer memberId = mservice.findByEmail(memberEmail).getMember_id();
		
		List<RoomsDto> list=service.getRoomDataByMyid(memberId);
		
		return list;
	}

	@PostMapping("/room/update")
	public String update(@ModelAttribute RoomsDto dto, List<MultipartFile> image_upload, HttpSession session,
			HttpServletRequest request) {

		// 방 서비스 배열을 쉼표로 구분된 문자열로 변환
		String[] room_service = request.getParameterValues("room_service[]");
		String roomServiceString = String.join(",", room_service);
		dto.setRoom_service(roomServiceString);
		
		//room_region 추가, room_address의 앞글자만 가져왔음
		String roomaddr=dto.getRoom_address();
		String roomregion=roomaddr.split("\\s+")[0];
		dto.setRoom_region(roomregion);
		
		service.updateRoom(dto);
		
		
		
		try {
			
			List<ImagesDto> oldImageUrl=imgservice.imgList(dto.getRoom_id());
			
				//사진을 수정했을 경우에만 기존의 사진을 s3와 DB 에서 삭제(사진 수정없을 시에는 기존 사진으로 유지)
			    if (image_upload != null && !image_upload.isEmpty() && !image_upload.get(0).isEmpty()) {
			    	
                    for (ImagesDto imgdto : oldImageUrl) {
                        String oldFileName = extractFilePath(imgdto.getImage_photo());
                        s3service.deleteFile(oldFileName);
                        imgservice.deleteImage(dto.getRoom_id());
                    }

                
			    
		        // 그리고 새 이미지 s3 업로드 및 DB 업데이트
		        for (MultipartFile file : image_upload) {
		            if (!file.isEmpty()) {
		                String imageUrl = s3service.upload(file, "roomphoto");
		                ImagesDto imgDto = new ImagesDto();
		                imgDto.setRoom_id(dto.getRoom_id());
		                imgDto.setImage_photo(imageUrl);
		                imgservice.insertImage(imgDto);
		            }
		        }
			 }
	        
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return "redirect:roomlist";

	}
	
	@GetMapping("/room/updateform")
	public String getOneData(String room_id, Model model,HttpSession session) {
		RoomsDto rdto=service.getOneData(room_id);
		model.addAttribute("rdto", rdto);
		
        // 서비스 목록 예시 데이터
        List<String> services = Arrays.asList("와이파이", "TV", "주방", "세탁기", "에어컨", "전자렌지", 
								                "수영장", "바베큐 그릴", "주차장", "반려동물 입장가능", 
								                "셀프체크인", "건조기", "헤어드라이기", "비데", 
								                "식기류", "빔프로젝트", "보드게임", "빅테이블","전기포트","스피커","인덕션");
        model.addAttribute("services", services);
        
        List<ImagesDto> images = imgservice.imgList(room_id);
        model.addAttribute("images", images);
		
		String memberemail=(String)session.getAttribute("myid");
		model.addAttribute("memberemail", memberemail);
		return "/room/roomupdateform";
		
	}
	
	
	
}