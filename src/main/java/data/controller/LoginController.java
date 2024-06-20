package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import data.dto.LoginDto;
import data.dto.MemberDto;
import data.service.LoginServiceInter;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginServiceInter loginService;

    @GetMapping("/loginform")
    public String form(HttpSession session, Model model) {
        // 로그인 여부 확인
        String loginok = (String) session.getAttribute("loginok");

        // 로그인 상태가 아니면 로그인 폼을 보여줌
        if (loginok == null) {
            model.addAttribute("loginDto", new LoginDto());
            return "/login/loginForm"; // 경로 수정
        } else {
            // 로그인 상태이면 인덱스로 리다이렉트
            return "redirect:/index";
        }
    }

    @PostMapping("/loginprocess")
    public String loginprocess(@ModelAttribute LoginDto loginDto, HttpSession session, Model model) {

        MemberDto memberDto = loginService.authenticate(loginDto);

        if (memberDto != null) {
            session.setMaxInactiveInterval(60 * 60 * 8); // 8시간

            session.setAttribute("myid", memberDto.getMember_useremail());
            session.setAttribute("myname", memberDto.getMember_name());
            session.setAttribute("member_id", memberDto.getMember_id());
            session.setAttribute("loginok", "yes");
            session.setAttribute("member", memberDto);

            return "redirect:/index";
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "login/loginForm";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }
}
