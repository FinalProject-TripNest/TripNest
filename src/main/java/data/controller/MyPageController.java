package data.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.InqueryDto;
import data.dto.MemberDto;
import data.dto.MyPageReservationDto;
import data.service.InqueryService;
import data.service.MemberServiceInter;
import data.service.MyPageServiceInter;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @Autowired
    private MemberServiceInter memberService;
    
    @Autowired
    private MyPageServiceInter myPageServiceInter;

    @Autowired
    InqueryService inqueryService;

    @GetMapping("/main")
    public String myPage(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        model.addAttribute("memberDto", memberDto);
        
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년");
        String formattedDate = currentDate.format(formatter);

        int reservationCount = myPageServiceInter.getReservationsByMemberId(memberDto.getMember_id()).size();
        
        model.addAttribute("currentDate", formattedDate);
        model.addAttribute("reservationCount", reservationCount);

        return "/mypage/main";
    }

    @GetMapping("/reservation")
    public String reservation(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        
        List<MyPageReservationDto> reservations = myPageServiceInter.getReservationsByMemberId(memberDto.getMember_id());
        model.addAttribute("reservations", reservations);

        return "/mypage/reservation";
    }
    
    @GetMapping("/cancel")
    public String cancel(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }

        MemberDto memberDto = memberService.getMemberByEmail(userEmail);	
        
        List<MyPageReservationDto> cancellations = myPageServiceInter.getCancellationsByMemberId(memberDto.getMember_id());
        model.addAttribute("cancellations", cancellations);

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
    
    @GetMapping("/myinquery")
    public String myinquery() {
        return "/mypage/myinquery";
    }
    
    @GetMapping("/myinquerylist")
    @ResponseBody
    public List<InqueryDto> myinquerylist(HttpSession session ,Model model) {

        String memberEmail = (String) session.getAttribute("myid");

        MemberDto memberDto = memberService.getMemberByEmail(memberEmail);

        List<InqueryDto> inqueryList = inqueryService.getMyInqueryDatas(memberDto.getMember_id());

        return inqueryList;
    }
}
