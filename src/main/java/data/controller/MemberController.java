package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import data.dto.MemberDto;
import data.service.EmailServiceInter;
import data.service.MemberServiceInter;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberServiceInter memberService;

    @Autowired
    private EmailServiceInter emailService;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("memberDto", new MemberDto());
        return "/member/registerForm";
    }

    @PostMapping("/send-verification")
    @ResponseBody
    public String sendVerification(@RequestParam String email) {
        // 이메일 인증 요청
        emailService.sendEmailVerification(email);
        return "Verification email sent";
    }

    @PostMapping("/verify-code")
    @ResponseBody
    public String verifyCode(@RequestParam String email, @RequestParam String code) {
        if (emailService.verifyCode(email, code)) {
            return "true";
        } else {
            return "false";
        }
    }

    @PostMapping("/insert")
    public String registerMember(HttpSession session, @RequestParam String token, 
                                 @RequestParam String member_name, @RequestParam String member_useremail, 
                                 @RequestParam String member_password, @RequestParam String member_phone, 
                                 @RequestParam String member_birth_date, Model model) {
        MemberDto memberDto = new MemberDto();
        memberDto.setMember_name(member_name);
        memberDto.setMember_useremail(member_useremail);
        memberDto.setMember_password(member_password);
        memberDto.setMember_phone(member_phone);
        memberDto.setMember_birth_date(java.sql.Date.valueOf(member_birth_date));

        // 이메일 중복 체크
        if (memberService.checkEmailExists(member_useremail)) {
            model.addAttribute("error", "이미 사용 중인 이메일입니다.");
            return "/member/registerForm"; // 수정된 경로
        }
        
        if (emailService.verifyEmailToken(member_useremail, token)) {

            memberService.registerMember(memberDto, token);
            
            // 이메일 인증 정보 삭제
            emailService.deleteEmailVerification(member_useremail, token);

            return "redirect:/member/registerSuccess"; // 성공 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "이메일 인증이 완료되지 않았습니다.");
            return "/member/registerForm"; // 수정된 경로
        }
    }

    
    @GetMapping("/registerSuccess")
    public String registerSuccess() {
        return "/member/registerSuccess";
    }
    
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("myid");
        if (userEmail == null) {
            return "redirect:/login/loginform";
        }
        
        MemberDto memberDto = memberService.getMemberByEmail(userEmail);
        model.addAttribute("memberDto", memberDto);
        
        return "/member/myPage";
    }

}
