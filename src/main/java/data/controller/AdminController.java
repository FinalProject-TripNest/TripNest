package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.InqueryDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.InqueryService;
import data.service.RoomsService;

@Controller
public class AdminController {

	@Autowired
	RoomsService rservice;
	@Autowired
	ImageService imgservice;
	@Autowired
	InqueryService iqservice;
	
	@GetMapping("/admin/adminmain")
	public String admin() {
		return "/admin/adminpage";
	}
	
	//숙소리스트
	@GetMapping("/admin/roomlist")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//페이징에 필요한 변수
		int totalCount=rservice.getTotalRooms();
		
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 갯수
		int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
		int startPage; //각 블럭에서 보여질 시작페이지
		int endPage; //각 블럭당 보여질 끝 페이지
		int totalPage; //총 페이지 수

		int no; //currentPage당 출력할 시작번호

		//총 페이지수 구하기
		//총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭당 보여질 시작페이지
		//perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
		//현재가 13일 경우 시작페이지:11 끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
		if(endPage>totalPage)
		endPage=totalPage;

		//각 페이지에서 보여질 시작 번호
		//1페이지:0, 2페이지:5 3페이지:10...
		start=(currentPage-1)*perPage;

		//각 페이지당 출력할 시작번호 구하기
		//예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
		no=totalCount-(currentPage-1)*perPage;

		
		List<RoomsDto> list=rservice.getAllRooms(start, perPage);
		
		//리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		//포워드
		mview.setViewName("/admin/adminrooms");
		
		return mview;
	}
	
	//관리자가 보는 숙소 디테일에 사용. 결국 json 형태로 값 넘김
	@GetMapping("/admin/roomdetail")
	@ResponseBody
	public Map<String, Object> roominfo(@RequestParam String room_id) {
		
		Map<String, Object> map=new HashMap<>();
		
		//room에 대한 디테일 정보 담기
		String roomname=rservice.getDataRoom(room_id).getRoom_name();
		int roomprice=rservice.getDataRoom(room_id).getRoom_price();
		String roomaddr=rservice.getDataRoom(room_id).getRoom_address();
		String roomservice=rservice.getDataRoom(room_id).getRoom_service();
		String roommin=rservice.getDataRoom(room_id).getRoom_min_capacity();
		String roommax=rservice.getDataRoom(room_id).getRoom_max_capacity();
		String roomdetail=rservice.getDataRoom(room_id).getRoom_detail();
		String roomid=rservice.getDataRoom(room_id).getRoom_id();
		String roomstatus=rservice.getDataRoom(room_id).getRoom_status();
		
		//images테이블의 photo담기
		String roomimg=imgservice.getDataRoomImg(room_id).getImage_photo();
		
		map.put("roomname", roomname);
		map.put("roomprice", roomprice);
		map.put("roomaddr", roomaddr);
		map.put("roomservice", roomservice);
		map.put("roommin", roommin);
		map.put("roommax", roommax);
		map.put("roomdetail", roomdetail);
		map.put("roomid", roomid);
		map.put("roomimg", roomimg);
		map.put("roomstatus", roomstatus);
		
		return map;
	}
	
	//room_status 미승인을 승인으로 수정
	@PostMapping("/admin/roomacc")
	@ResponseBody
	public void updateacc(String room_id) {
		rservice.updateRoomAcc(room_id);
	}
	//room_status 미승인을 보류로 수정
	@PostMapping("/admin/roomhold")
	@ResponseBody
	public void updatehold(String room_id) {
		rservice.updateRoomHold(room_id);
	}
	
	//1:1문의 리스트
	@GetMapping("/admin/inquerylist")
	public ModelAndView iqlist(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//페이징에 필요한 변수
		int totalCount=iqservice.getTotalInquery();
		
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 갯수
		int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
		int startPage; //각 블럭에서 보여질 시작페이지
		int endPage; //각 블럭당 보여질 끝 페이지
		int totalPage; //총 페이지 수

		int no; //currentPage당 출력할 시작번호

		//총 페이지수 구하기
		//총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭당 보여질 시작페이지
		//perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
		//현재가 13일 경우 시작페이지:11 끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
		if(endPage>totalPage)
		endPage=totalPage;

		//각 페이지에서 보여질 시작 번호
		//1페이지:0, 2페이지:5 3페이지:10...
		start=(currentPage-1)*perPage;

		//각 페이지당 출력할 시작번호 구하기
		//예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
		no=totalCount-(currentPage-1)*perPage;

		
		List<InqueryDto> list=iqservice.getInqueryList(start, perPage);
		
		//리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		//관리자 페이지 완성하면 매핑주소 바꿀것
		mview.setViewName("/admin/admininquery");
		
		return mview;
	}
	
	//관리자 페이지에서 답변달때 사용 하는 매서드
	@PostMapping("/admin/updateanswer")
	public String update(InqueryDto dto, String inquery_id) {
		
		iqservice.updateInqueryAnswer(inquery_id);
		
		return "redirect:/";
	}
	
}