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
    
    @GetMapping("/findId")
    public String showFindIdForm() {
        return "/member/findIdForm";
    }

    @PostMapping("/findId")
    public String findId(@RequestParam String member_name, @RequestParam String member_phone, Model model) {
        String email = memberService.findMemberEmailByNameAndPhone(member_name, member_phone);
        if (email != null) {
            model.addAttribute("email", email);
            return "/member/findIdResult";
        } else {
            model.addAttribute("error", "해당 정보를 가진 회원이 없습니다.");
            return "/member/findIdForm";
        }
    }

    @GetMapping("/findPass")
    public String showFindPassForm() {
        return "/member/findPassForm";
    }

    // 비밀번호 재설정 이메일 요청 처리
    @PostMapping("/findPass")
    public String findPass(@RequestParam String member_useremail, Model model) {
        boolean emailExists = memberService.checkEmailExists(member_useremail);
        if (emailExists) {
            emailService.sendResetPasswordEmail(member_useremail);
            model.addAttribute("message", "비밀번호 재설정 이메일이 전송되었습니다.");
            return "/member/findPassResult";
        } else {
            model.addAttribute("error", "해당 이메일을 가진 회원이 없습니다.");
            return "/member/findPassForm";
        }
    }
    
    @GetMapping("/resetPassword")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        model.addAttribute("token", token);
        return "/member/resetPasswordForm";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam("token") String token, 
                                @RequestParam("new_password") String newPassword, 
                                @RequestParam("confirm_password") String confirmPassword, 
                                Model model) {
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("token", token);
            return "/member/resetPasswordForm";
        }

        MemberDto member = memberService.findMemberByToken(token);
        if (member == null) {
            model.addAttribute("error", "유효하지 않은 토큰입니다.");
            return "/member/resetPasswordForm";
        }

        if (member.getMember_password().equals(newPassword)) {
            model.addAttribute("error", "새 비밀번호는 현재 비밀번호와 다르게 설정해주세요.");
            model.addAttribute("token", token);
            return "/member/resetPasswordForm";
        }

        boolean isResetSuccessful = memberService.resetPassword(token, newPassword);
        if (isResetSuccessful) {
        	model.addAttribute("success", "비밀번호가 성공적으로 변경되었습니다.");
            return "/member/resetPasswordSuccess";
        } else {
            model.addAttribute("error", "비밀번호 재설정에 실패했습니다. 다시 시도해주세요.");
            model.addAttribute("token", token);
            return "/member/resetPasswordForm";
        }
    }

}
