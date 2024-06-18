package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.InqueryDto;
import data.service.InqueryService;
import jakarta.servlet.http.HttpSession;

@Controller
public class InqueryController {

	@Autowired
	InqueryService service;
	
	@GetMapping("/inquery/inqueryform")
	public String inqueryform() {
		return "/inquery/inqueryform";
	}
	
	@PostMapping("/inquery/insert")
	public String insert(@ModelAttribute InqueryDto dto,HttpSession session) {
		
		service.insertInquery(dto);
		
		return "/inquery/inquerysuccess";
	}
	
	//이거 내가 보기편하게 만든거. 나중에 삭제할것
	@GetMapping("/inquery/inquerysuccess")
	public String inquerysuccess() {
		return "/inquery/inquerysuccess";
	}
	
	//관리자 페이지에서 답변달때 사용 하는 매서드
	@PostMapping("/inquery/updateanswer")
	public String update(InqueryDto dto, String inquery_id) {
		
		service.updateInqueryAnswer(inquery_id);
		
		return "redirect:/";
	}
	
	//1:1문의 리스트
	@GetMapping("/inquery/inquerylist")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//페이징에 필요한 변수
		int totalCount=service.getTotalInquery();
		
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

		
		List<InqueryDto> list=service.getInqueryList(start, perPage);
		
		//리퀘스에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		//관리자 페이지 완성하면 매핑주소 바꿀것
		mview.setViewName("/inquery/inquerylist");
		
		return mview;
	}
}
