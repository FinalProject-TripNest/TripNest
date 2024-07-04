package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import data.dto.MemberDto;
import data.service.MemberServiceInter;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @Autowired
    private MemberServiceInter memberService;

    @GetMapping("/main")
    public String myPage(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        model.addAttribute("memberDto", memberDto);

        return "/mypage/main";
    }

    @GetMapping("/reservation")
    public String reservation() {
        return "/mypage/reservation";
    }

    @GetMapping("/cancel")
    public String cancel() {
        return "/mypage/cancel";
    }

    @GetMapping("/coupon")
    public String coupon() {
        return "/mypage/coupon";
    }

    @GetMapping("/likestay")
    public String likestay() {
        return "/mypage/likestay";
    }

    @GetMapping("/edit")
    public String edit() {
        return "/mypage/edit";
    }

    @GetMapping("/message")
    public String message() {
        return "/mypage/message";
    }
}
