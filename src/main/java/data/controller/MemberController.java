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
    	// 이메일 중복 체크
        if (memberService.checkEmailExists(email)) {
            return "이미 사용 중인 이메일입니다.";
        }
        // 이메일 인증 요청
        emailService.sendEmailVerification(email);
        return "인증번호가 전송되었습니다.";
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

        if (emailService.verifyEmailToken(member_useremail, token)) {
            try {
                memberService.registerMember(memberDto, token);
                
                // 이메일 인증 정보 삭제
                emailService.deleteEmailVerification(member_useremail, token);
                
                return "redirect:/member/registerSuccess";
            } catch (Exception e) {
                model.addAttribute("error", "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
                return "/member/registerForm";
            }
        } else {
            model.addAttribute("error", "이메일 인증이 완료되지 않았습니다.");
            return "/member/registerForm";
        }
    }

    
    @GetMapping("/registerSuccess")
    public String registerSuccess() {
        return "/member/registerSuccess";
    }

}
