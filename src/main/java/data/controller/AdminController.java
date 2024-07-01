package data.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.InqueryDto;
import data.dto.JournalDto;
import data.dto.MemberDto;
import data.dto.ReviewDto;
import data.dto.ReviewJoinDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.InqueryService;
import data.service.JournalService;
import data.service.MemberService;
import data.service.ReviewService;
import data.service.RoomsService;
import data.service.S3UploaderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	RoomsService rservice;
	@Autowired
	ImageService imgservice;
	@Autowired
	InqueryService iqservice;
	@Autowired
	MemberService memservice;
	@Autowired
	ReviewService reviewservice;
	@Autowired
	JournalService journalservice;
	@Autowired
	S3UploaderService s3service;

	/*
	 * @GetMapping("/admin/adminmain") public String admin() { return
	 * "/admin/adminpage"; }
	 */

	// 숙소리스트
	@GetMapping("/admin/roomlist")
	public ModelAndView list(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String room_id) {

		ModelAndView mview = new ModelAndView();

		// 페이징에 필요한 변수
		int totalCount = rservice.getTotalRooms();

		int perPage = 10; // 한페이지당 보여질 글의 갯수
		int perBlock = 5; // 한블럭당 보여질 페이지 갯수
		int start; // db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
		int startPage; // 각 블럭에서 보여질 시작페이지
		int endPage; // 각 블럭당 보여질 끝 페이지
		int totalPage; // 총 페이지 수

		int no; // currentPage당 출력할 시작번호

		// 총 페이지수 구하기
		// 총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
		// 나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		// 각 블럭당 보여질 시작페이지
		// perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
		// 현재가 13일 경우 시작페이지:11 끝페이지:15
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
		if (endPage > totalPage)
			endPage = totalPage;

		// 각 페이지에서 보여질 시작 번호
		// 1페이지:0, 2페이지:5 3페이지:10...
		start = (currentPage - 1) * perPage;

		// 각 페이지당 출력할 시작번호 구하기
		// 예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
		no = totalCount - (currentPage - 1) * perPage;

		List<RoomsDto> list = rservice.getAllRooms(start, perPage);

		for (RoomsDto roomdto : list) {
			MemberDto memberDto = memservice.findMemberEmail(roomdto.getMember_id());
			if (memberDto != null) {
				String mememail = memberDto.getMember_useremail();
				roomdto.setMememail(mememail);
			} else {
				roomdto.setMememail("탈퇴한 사용자입니다.");
			}
		}

		// 리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);

		// 포워드
		mview.setViewName("/admin/adminrooms");

		return mview;
	}

	// 관리자가 보는 숙소 디테일에 사용. 결국 json 형태로 값 넘김
	@GetMapping("/admin/roomdetail")
	@ResponseBody
	public Map<String, Object> roominfo(@RequestParam String room_id) {

		Map<String, Object> map = new HashMap<>();

		// room에 대한 디테일 정보 담기
		String roomname = rservice.getDataRoom(room_id).getRoom_name();
		int roomprice = rservice.getDataRoom(room_id).getRoom_price();
		String roomaddr = rservice.getDataRoom(room_id).getRoom_address();
		String roomservice = rservice.getDataRoom(room_id).getRoom_service();
		String roommin = rservice.getDataRoom(room_id).getRoom_min_capacity();
		String roommax = rservice.getDataRoom(room_id).getRoom_max_capacity();
		String roomdetail = rservice.getDataRoom(room_id).getRoom_detail();
		String roomid = rservice.getDataRoom(room_id).getRoom_id();
		String roomstatus = rservice.getDataRoom(room_id).getRoom_status();
		String roomhp = rservice.getDataRoom(room_id).getRoom_hp();

		// images테이블의 photo담기
		// String roomimg=imgservice.getDataRoomImg(room_id).getImage_photo();

		List<ImagesDto> imgList = imgservice.getDataRoomImg(room_id);
		List<String> photoList = new ArrayList<>();
		for (ImagesDto imgDto : imgList) {
			photoList.add(imgDto.getImage_photo());
		}
		map.put("photoList", photoList); // 이미지 리스트를 배열로 담아 전달

		map.put("roomname", roomname);
		map.put("roomprice", roomprice);
		map.put("roomaddr", roomaddr);
		map.put("roomservice", roomservice);
		map.put("roommin", roommin);
		map.put("roommax", roommax);
		map.put("roomdetail", roomdetail);
		map.put("roomid", roomid);
		// map.put("roomimg", roomimg);
		map.put("roomstatus", roomstatus);
		map.put("roomhp", roomhp);

		return map;
	}

	// room_status 미승인을 승인으로 수정
	@PostMapping("/admin/roomacc")
	@ResponseBody
	public void updateacc(String room_id) {
		rservice.updateRoomAcc(room_id);
	}

	// room_status 미승인을 보류로 수정
	@PostMapping("/admin/roomhold")
	@ResponseBody
	public void updatehold(String room_id) {
		rservice.updateRoomHold(room_id);
	}

	// 1:1문의 리스트
	@GetMapping("/admin/inquerylist")
	public ModelAndView iqlist(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		ModelAndView mview = new ModelAndView();

		// 페이징에 필요한 변수
		int totalCount = iqservice.getTotalInquery();

		int perPage = 10; // 한페이지당 보여질 글의 갯수
		int perBlock = 5; // 한블럭당 보여질 페이지 갯수
		int start; // db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
		int startPage; // 각 블럭에서 보여질 시작페이지
		int endPage; // 각 블럭당 보여질 끝 페이지
		int totalPage; // 총 페이지 수

		int no; // currentPage당 출력할 시작번호

		// 총 페이지수 구하기
		// 총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
		// 나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		// 각 블럭당 보여질 시작페이지
		// perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
		// 현재가 13일 경우 시작페이지:11 끝페이지:15
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
		if (endPage > totalPage)
			endPage = totalPage;

		// 각 페이지에서 보여질 시작 번호
		// 1페이지:0, 2페이지:5 3페이지:10...
		start = (currentPage - 1) * perPage;

		// 각 페이지당 출력할 시작번호 구하기
		// 예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
		no = totalCount - (currentPage - 1) * perPage;

		List<InqueryDto> list = iqservice.getInqueryList(start, perPage);

		for (InqueryDto inquery : list) {
			MemberDto memberDto = memservice.findMemberEmail(inquery.getMember_id());
			if (memberDto != null) {
				String mememail = memberDto.getMember_useremail();
				inquery.setMememail(mememail);
			} else {
				inquery.setMememail("탈퇴한 사용자입니다.");
			}
		}

		// 리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);

		mview.setViewName("/admin/admininquery");

		return mview;
	}

	// 관리자 페이지에서 답변달때 사용 하는 매서드
	@PostMapping("/admin/updateanswer")
	public String update(InqueryDto dto) {

		iqservice.updateInqueryAnswer(dto);

		return "/admin/admininquery";
	}

	// 회원 관리 페이지
	@GetMapping("/admin/memberList")
	public ModelAndView member() {
		ModelAndView model = new ModelAndView();
		List<MemberDto> dto = memservice.dataList();
		model.addObject("dto", dto);
		model.setViewName("/admin/adminmember");
		return model;
	}

	@GetMapping("/admin/iqlist")
	@ResponseBody
	public InqueryDto iqlist(@RequestParam String inquery_id) {

		return iqservice.inqueryAdminAnswerList(inquery_id);

	}

	@ResponseBody
	@GetMapping("/admin/memberDelete")
	public String memberDelete(@RequestParam("member_id") int member_id) {

		memservice.dataDelete(member_id);
		return "/admin/memberDelete";
	}

	@GetMapping("/admin/adminmain")
	public ModelAndView getcount() {
		ModelAndView mview = new ModelAndView();

		int noiqcount = iqservice.getCountAnswer();
		mview.addObject("noiqcount", noiqcount);
		int totaliqcount = iqservice.getTotalInquery();
		mview.addObject("totaliqcount", totaliqcount);

		List<InqueryDto> iqlist = iqservice.getNullInquery();
		mview.addObject("iqlist", iqlist);

		for (InqueryDto inquery : iqlist) {
			MemberDto memberDto = memservice.findMemberEmail(inquery.getMember_id());
			if (memberDto != null) {
				String mememail = memberDto.getMember_useremail();
				inquery.setMememail(mememail);
			} else {
				inquery.setMememail("탈퇴한 사용자입니다.");
			}
		}
		int noroomcount = rservice.getCountNoRoom();
		mview.addObject("noroomcount", noroomcount);
		List<RoomsDto> roomlist = rservice.getRecentRoom();
		mview.addObject("roomlist", roomlist);

		for (RoomsDto rooms : roomlist) {
			MemberDto memberDto = memservice.findMemberEmail(rooms.getMember_id());
			if (memberDto != null) {
				String mememail = memberDto.getMember_useremail();
				rooms.setMememail(mememail);
			} else {
				rooms.setMememail("탈퇴한 사용자입니다.");
			}
		}

		List<MemberDto> memlist = memservice.getRecentMember();
		mview.addObject("memlist", memlist);

		int memcount = memservice.getTotalMember();
		mview.addObject("memcount", memcount);

		int roomscount = rservice.getTotalRooms();
		mview.addObject("roomscount", roomscount);

		mview.setViewName("/admin/adminpage");
		// System.out.println("Inquiry Count: " + noiqcount);
		return mview;
	}

	@GetMapping("/admin/reviewlist")
	public ModelAndView reviewList() {
		ModelAndView model = new ModelAndView();
		List<ReviewJoinDto> review = reviewservice.adminReview();
		model.addObject("review", review);
		model.setViewName("/admin/adminReview");

		return model;
	}

	@ResponseBody
	@GetMapping("/admin/reviewDelete")
	public String reviewDelete(@RequestParam("review_id") String review_id) {
		reviewservice.dataDelete(review_id);
		return "/admin/reviewDelete";
	}

	@GetMapping("/admin/journalList")
	public ModelAndView journalList() {
		ModelAndView model = new ModelAndView();
		List<JournalDto> journal = journalservice.dataList();
		model.addObject("journal", journal);
		model.setViewName("/admin/adminJournal");
		return model;
	}

	@PostMapping(value = "/admin/adminJournalUpdate", produces = "application/json")
	public ResponseEntity<?> journalOneData(@RequestParam("journal_id") String journal_id) {
		JournalDto journalUpdate = journalservice.getOneData(journal_id);
		if (journalUpdate != null) {
			return ResponseEntity.ok(journalUpdate);
		} else {
			return ResponseEntity.status(HttpStatus.SC_NOT_FOUND).body("Journal not found");
		}
	}

	@ResponseBody
	@PostMapping("/admin/JournalInsert")
	public String journalInsert(@ModelAttribute JournalDto dto, @RequestParam("photo") MultipartFile photo) {
		try {
			String imageUrl = s3service.uploadSingleFile(photo, "journal");
			dto.setJournal_photo(imageUrl);
			journalservice.insertData(dto);
			return "{\"success\": true}";

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			// 예외 처리 로직 추가
			return "{\"success\": false}";
		}
	}

	@ResponseBody
	@GetMapping("/admin/journalDelete")
	public String journalDelete(@RequestParam("journal_id") String journal_id) {
		try {

			// 2. S3에서 해당 journal_id에 해당하는 사진 파일 삭제
			String photoName = journalservice.photoData(journal_id);
			System.out.println(photoName);
			// 1. 데이터베이스에서 해당 journal_id에 해당하는 데이터 삭제
			journalservice.deleteData(journal_id);

			String path = extractFilePath(photoName);

			s3service.deleteFile(path);

			// 성공적으로 처리되었음을 클라이언트에 응답
			return "{\"success\": true}";
		} catch (Exception e) {
			// 예외 발생 시 에러 메시지와 함께 처리 실패 응답을 클라이언트에 반환
			e.printStackTrace();
			return "{\"success\": false, \"error\": \"" + e.getMessage() + "\"}";
		}
	}

	// URL에서 S3 파일 경로를 추출하는 메서드
	private String extractFilePath(String fileUrl) {
		try {
			String decodedFileName = URLDecoder.decode(fileUrl, "UTF-8");
			// "roomphoto/"를 포함하여 반환
			int index = decodedFileName.indexOf("journal/");
			return decodedFileName.substring(index);
		} catch (UnsupportedEncodingException e) {
			System.out.println("Error while decoding the file URL: " + e.getMessage());
			return null;
		}
	}

	@PostMapping("/admin/journalUpdate")
	public String journalUpdate(@ModelAttribute JournalDto dto, @RequestParam("photo") MultipartFile photo) {

		String oldFileName = journalservice.photoData(dto.getJournal_id());
		try {
			String imageUrl = s3service.updateFile(photo, oldFileName, "journal");
			dto.setJournal_photo(imageUrl);
			journalservice.updateData(dto);
			return "{\"success\": true}";

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			// 예외 처리 로직 추가
			return "{\"success\": false}";
		}
	}

}
