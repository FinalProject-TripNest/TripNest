package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {



	@GetMapping("/")
	public String start() {
		return "redirect:index";
	}

	@GetMapping("index")
	public String index() {
		return "room/roominsertform2";
	}

}
