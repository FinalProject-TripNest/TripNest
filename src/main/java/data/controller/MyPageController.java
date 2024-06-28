package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String edit(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        model.addAttribute("memberDto", memberDto);

        return "/mypage/edit";
    }
    
    @PostMapping("/updateProfile")
    public String updateProfile(HttpSession session, @RequestParam String name, 
                                @RequestParam String phone, @RequestParam String birthday, 
                                Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        memberDto.setMember_name(name);
        memberDto.setMember_phone(phone);
        memberDto.setMember_birth_date(java.sql.Date.valueOf(birthday));

        memberService.updateMember(memberDto);

        model.addAttribute("memberDto", memberDto);
        return "redirect:/mypage/main";
    }
    
    @PostMapping("/withdraw")
    public String withdraw(HttpSession session) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail != null) {
            MemberDto memberDto = memberService.getMemberByEmail(userEmail);
            memberService.deleteMember(memberDto.getMember_id());
            session.invalidate();
        }
        return "redirect:/";
    }
    
    @GetMapping("/message")
    public String message() {
        return "/mypage/message";
    }
}
