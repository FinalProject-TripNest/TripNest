package data.controller;

import data.dto.LoginDto;
import data.dto.MemberDto;
import data.service.KakaoServiceInter;
import data.service.LoginServiceInter;
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

    @Value("${kakao.client-id}")
    private String kakaoClientId;

    @Value("${kakao.redirect-uri}")
    private String kakaoRedirectUri;

    @GetMapping("/loginform")
    public String form(HttpSession session, Model model) {
        String loginok = (String) session.getAttribute("loginok");

        if (loginok == null) {
            model.addAttribute("loginDto", new LoginDto());
            model.addAttribute("kakaoClientId", kakaoClientId);
            model.addAttribute("kakaoRedirectUri", kakaoRedirectUri);
            return "/login/loginForm";
        } else {
            return "redirect:/index";
        }
    }

    @PostMapping("/loginprocess")
    public String loginprocess(@ModelAttribute LoginDto loginDto, HttpSession session, Model model) {

        MemberDto memberDto = loginService.authenticate(loginDto);

        if (memberDto != null) {
            session.setMaxInactiveInterval(60 * 60 * 8);

            session.setAttribute("myid", memberDto.getMember_useremail());
            session.setAttribute("myname", memberDto.getMember_name());
            session.setAttribute("loginok", "yes");
            session.setAttribute("member", memberDto);

            return "redirect:/index";
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "login/loginForm";
        }
    }

    @GetMapping("/kakao")
    public String kakaoLogin(@RequestParam String code, HttpSession session) {
        try {
            String accessToken = kakaoService.getKakaoAccessToken(code);
            MemberDto kakaoUser = kakaoService.getKakaoUserInfo(accessToken);

            if (kakaoUser.getMember_useremail() == null) {
                throw new RuntimeException("Kakao user email is null");
            }

            MemberDto memberDto = loginService.authenticateSocialUser(kakaoUser.getMember_social_id(), kakaoUser.getMember_social_type());
            if (memberDto == null) {
                loginService.registerMember(kakaoUser);
                memberDto = kakaoUser;
            }

            session.setMaxInactiveInterval(60 * 60 * 8);
            session.setAttribute("myid", memberDto.getMember_useremail());
            session.setAttribute("myname", memberDto.getMember_name());
            session.setAttribute("loginok", "yes");
            session.setAttribute("member", memberDto);
            session.setAttribute("accessToken", accessToken);

            return "redirect:/index";
        } catch (RuntimeException e) {
            session.invalidate();
            throw e;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");
        if (accessToken != null) {
            kakaoService.logoutKakaoUser(accessToken);
        }
        session.invalidate();
        return "redirect:/index";
    }
}
