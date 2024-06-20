package data.controller;

import data.dto.LoginDto;
import data.dto.MemberDto;
import data.service.KakaoServiceInter;
import data.service.LoginServiceInter;
import data.service.NaverServiceInter;

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

			if (kakaoUser.getMember_useremail() == null) {
				throw new RuntimeException("Kakao user email is null");
			}

			MemberDto memberDto = loginService.authenticateSocialUser(kakaoUser.getMember_social_id(),
					kakaoUser.getMember_social_type());
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

	@GetMapping("/naver")
	public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session) {
		try {
			String accessToken = naverService.getNaverAccessToken(code, state);
			MemberDto naverUser = naverService.getNaverUserInfo(accessToken);

			if (naverUser.getMember_useremail() == null) {
				throw new RuntimeException("Naver user email is null");
			}

			MemberDto memberDto = loginService.authenticateSocialUser(naverUser.getMember_social_id(),
					naverUser.getMember_social_type());
			if (memberDto == null) {
				loginService.registerMember(naverUser);
				memberDto = naverUser;
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
