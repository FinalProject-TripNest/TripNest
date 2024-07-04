package data.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.WishlistDetailDto;
import data.dto.WishlistDto;
import data.service.MemberService;
import data.service.RoomsService;
import data.service.WishlistService;
import jakarta.servlet.http.HttpSession;

@Controller
public class WishlistController {

	@Autowired
	WishlistService service;
	@Autowired
	RoomsService roomservice;
	@Autowired
	MemberService memservice;
	
	@PostMapping("/wishlist/wishinsert")
	public String wishinsert(@ModelAttribute WishlistDto dto) {
		service.insertWishlist(dto);
		return "find/list";
	}
	
	@GetMapping("/wishlist/count")
	@ResponseBody
	public Map<String, Integer> count(WishlistDto dto) {

		int count=service.checkWishlist(dto);
		Map<String, Integer> map=new HashMap<>();
		map.put("count", count);
		
		return map;
		
	}
	
	
	@GetMapping("/wishlist/deletewish")
	public String deletewish(WishlistDto dto) {
		
		service.delectWishlist(dto);
		return "find/list";
	}
	
	
	@GetMapping("/wishlist/mywishlist")
	@ResponseBody
	public Map<String, List<WishlistDetailDto>> mywishlist(HttpSession session, Model model) {
	    String myemail = (String) session.getAttribute("myid");

	    List<WishlistDetailDto> list = service.myWishList(myemail);
	    
	    // 날짜별로 위시리스트를 그룹화하기 위한 Map 생성
	    Map<String, List<WishlistDetailDto>> wishlistByDate = new LinkedHashMap();

	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    // 날짜별로 위시리스트를 그룹화
	    for (WishlistDetailDto dto : list) {
	        String wishlistDate = sdf.format(dto.getWishlist_date()); // 날짜 가져오기
	        if (!wishlistByDate.containsKey(wishlistDate)) {
	            wishlistByDate.put(wishlistDate, new ArrayList<>());
	        }
	        wishlistByDate.get(wishlistDate).add(dto);
	    }

	    return wishlistByDate;

	}	
	@GetMapping("/wishlist/countmywish")
	@ResponseBody
	public Map<String,Object> countmywish(HttpSession session) {
		
		String member_useremail=(String)session.getAttribute("myid");
		int countwish=service.countMywishlist(member_useremail);
		Map<String, Object> map=new HashMap<>();
		map.put("countwish", countwish);
		System.out.println("Wishlist count: " + countwish);
		
		return map;

	}


}