package data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.WishlistDto;
import data.service.WishlistService;

@Controller
public class WishlistController {

	@Autowired
	WishlistService service;
	
	@PostMapping("/wishlist/wishinsert")
	public String wishinsert(@ModelAttribute WishlistDto dto) {
		service.insertWishlist(dto);
		return "find/list";
	}
	
	@GetMapping("/wishlist/wishcount")
	public String wishcount(WishlistDto dto, Model model) {
		int count=service.checkWishlist(dto);
		model.addAttribute("count", count);
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
}
