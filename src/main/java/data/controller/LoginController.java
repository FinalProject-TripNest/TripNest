package data.controller;

import data.dto.LoginDto;
import data.dto.MemberDto;
import data.service.KakaoServiceInter;
import data.service.LoginServiceInter;
import data.service.NaverServiceInter;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginServiceInter loginService;

    @Autowired
    private KakaoServiceInter kakaoService;
    
    @Autowired
    private NaverServiceInter naverService;

    @Value("${kakao.client-id}")
    private String kakaoClientId;

    @Value("${kakao.redirect-uri}")
    private String kakaoRedirectUri;
    
    @Value("${naver.client-id}")
    private String naverClientId;

    @Value("${naver.redirect-uri}")
    private String naverRedirectUri;

    @GetMapping("/loginform")
    public String form(HttpSession session, Model model) {
        String loginok = (String) session.getAttribute("loginok");

        if (loginok == null) {
            model.addAttribute("loginDto", new LoginDto());
            model.addAttribute("kakaoClientId", kakaoClientId);
            model.addAttribute("kakaoRedirectUri", kakaoRedirectUri);
            model.addAttribute("naverClientId", naverClientId);
            model.addAttribute("naverRedirectUri", naverRedirectUri);
            return "/login/loginForm";
        } else {
            return "redirect:/index";
        }
    }

    @PostMapping("/loginprocess")
    public String loginprocess(@ModelAttribute LoginDto loginDto, HttpSession session, Model model) {

        try {
            MemberDto memberDto = loginService.authenticate(loginDto);

            if (memberDto != null) {
                session.setMaxInactiveInterval(60 * 60 * 8);

                session.setAttribute("myid", memberDto.getMember_useremail());
                session.setAttribute("myname", memberDto.getMember_name());
                session.setAttribute("member_id", memberDto.getMember_id());
                session.setAttribute("loginok", "yes");
                session.setAttribute("member", memberDto);

                return "redirect:/index";
            } else {
                model.addAttribute("error", "이메일 또는 비밀번호가 잘못되었습니다.\\n로그인 정보를 확인해주세요.");
                return "login/loginForm";
            }
        } catch (Exception e) {
            model.addAttribute("error", "예기치 않은 오류가 발생했습니다. 다시 시도해주세요.");
            return "login/loginForm";
        }
    }

    @GetMapping("/kakao")
    public String kakaoLogin(@RequestParam String code, HttpSession session) {
        try {
            String accessToken = kakaoService.getKakaoAccessToken(code);
            MemberDto kakaoUser = kakaoService.getKakaoUserInfo(accessToken);

            MemberDto existingMember = loginService.authenticateSocialUser(kakaoUser.getMember_social_id(), kakaoUser.getMember_social_type());
            if (existingMember == null) {
                session.setAttribute("kakaoUser", kakaoUser);
                session.setAttribute("accessToken", accessToken);
                return "redirect:/login/kakaoAdditionalInfo";
            }

            session.setMaxInactiveInterval(60 * 60 * 8);
            session.setAttribute("myid", existingMember.getMember_useremail());
            session.setAttribute("myname", existingMember.getMember_name());
            session.setAttribute("member_id", existingMember.getMember_id());
            session.setAttribute("loginok", "yes");
            session.setAttribute("member", existingMember);

            return "redirect:/index";
        } catch (RuntimeException e) {
            session.invalidate();
            throw e;
        }
    }

    @GetMapping("/kakaoAdditionalInfo")
    public String kakaoAdditionalInfoForm(HttpSession session, Model model) {
        MemberDto kakaoUser = (MemberDto) session.getAttribute("kakaoUser");
        if (kakaoUser == null) {
            return "redirect:/login/loginform";
        }

        model.addAttribute("kakaoUser", kakaoUser);
        return "/login/kakaoAdditionalInfo";
    }

    @PostMapping("/kakaoAdditionalInfo")
    public String kakaoAdditionalInfoSubmit(@RequestParam String member_phone, @RequestParam String member_birth_date, HttpSession session) {
        MemberDto kakaoUser = (MemberDto) session.getAttribute("kakaoUser");
        if (kakaoUser == null) {
            return "redirect:/login/loginform";
        }

        kakaoUser.setMember_phone(member_phone);

        // 생년월일 변환
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            kakaoUser.setMember_birth_date(sdf.parse(member_birth_date));
        } catch (ParseException e) {
            e.printStackTrace();
            return "redirect:/login/kakaoAdditionalInfo";
        }

        MemberDto existingMember = loginService.authenticateSocialUser(kakaoUser.getMember_social_id(), kakaoUser.getMember_social_type());
        if (existingMember == null) {
            loginService.registerMember(kakaoUser);
            existingMember = kakaoUser;
        }

        session.setMaxInactiveInterval(60 * 60 * 8);
        session.setAttribute("myid", existingMember.getMember_useremail());
        session.setAttribute("myname", existingMember.getMember_name());
        session.setAttribute("member_id", existingMember.getMember_id());
        session.setAttribute("loginok", "yes");
        session.setAttribute("member", existingMember);

        return "redirect:/index";
    }
    
    @GetMapping("/naver")
    public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session) {
        try {
            String accessToken = naverService.getNaverAccessToken(code, state);
            MemberDto naverUser = naverService.getNaverUserInfo(accessToken);

            MemberDto existingMember = loginService.authenticateSocialUser(naverUser.getMember_social_id(), naverUser.getMember_social_type());
            if (existingMember == null) {
                session.setAttribute("naverUser", naverUser);
                session.setAttribute("accessToken", accessToken);
                return "redirect:/login/naverAdditionalInfo";
            }

            session.setMaxInactiveInterval(60 * 60 * 8);
            session.setAttribute("myid", existingMember.getMember_useremail());
            session.setAttribute("myname", existingMember.getMember_name());
            session.setAttribute("member_id", existingMember.getMember_id());
            session.setAttribute("loginok", "yes");
            session.setAttribute("member", existingMember);

            return "redirect:/index";
        } catch (RuntimeException e) {
            session.invalidate();
            throw e;
        }
    }

    @GetMapping("/naverAdditionalInfo")
    public String naverAdditionalInfoForm(HttpSession session, Model model) {
        MemberDto naverUser = (MemberDto) session.getAttribute("naverUser");
        if (naverUser == null) {
            return "redirect:/login/loginform";
        }

        model.addAttribute("naverUser", naverUser);
        return "/login/naverAdditionalInfo";
    }

    @PostMapping("/naverAdditionalInfo")
    public String naverAdditionalInfoSubmit(@RequestParam String member_phone, @RequestParam String member_birth_date, HttpSession session) {
        MemberDto naverUser = (MemberDto) session.getAttribute("naverUser");
        if (naverUser == null) {
            return "redirect:/login/loginform";
        }

        naverUser.setMember_phone(member_phone);

        // 생년월일 변환
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            naverUser.setMember_birth_date(sdf.parse(member_birth_date));
        } catch (ParseException e) {
            e.printStackTrace();
            return "redirect:/login/naverAdditionalInfo";
        }

        MemberDto existingMember = loginService.authenticateSocialUser(naverUser.getMember_social_id(), naverUser.getMember_social_type());
        if (existingMember == null) {
            loginService.registerMember(naverUser);
            existingMember = naverUser;
        }

        session.setMaxInactiveInterval(60 * 60 * 8);
        session.setAttribute("myid", existingMember.getMember_useremail());
        session.setAttribute("myname", existingMember.getMember_name());
        session.setAttribute("member_id", existingMember.getMember_id());
        session.setAttribute("loginok", "yes");
        session.setAttribute("member", existingMember);

        return "redirect:/index";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");
        String socialType = (String) session.getAttribute("socialType");

        if (accessToken != null) {
            if ("kakao".equals(socialType)) {
                kakaoService.logoutKakaoUser(accessToken);
            } else if ("naver".equals(socialType)) {
                naverService.logoutNaverUser(accessToken);
            }
        }

        session.invalidate();
        return "redirect:/index";
    }
}