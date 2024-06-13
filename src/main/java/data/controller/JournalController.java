package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JournalController {

	@GetMapping("journal")
	public String journalPage() {
		return "journal/journal";
	}

	
}
