package data.service;

import data.dto.MemberDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
public class KakaoService implements KakaoServiceInter {

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    @Override
    public String getKakaoAccessToken(String code) {
        String url = "https://kauth.kakao.com/oauth/token";
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("redirect_uri", redirectUri);
        params.add("code", code);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, request, Map.class);

        Map<String, Object> responseBody = response.getBody();
        if (responseBody != null) {
            return (String) responseBody.get("access_token");
        } else {
            throw new RuntimeException("Failed to get access token from Kakao");
        }
    }

    @Override
    public MemberDto getKakaoUserInfo(String accessToken) {
        String url = "https://kapi.kakao.com/v2/user/me";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
        Map<String, Object> responseBody = response.getBody();

        MemberDto member = new MemberDto();
        if (responseBody != null) {
            member.setMember_social_id(String.valueOf(responseBody.get("id")));
            member.setMember_social_type("kakao");

            Map<String, Object> properties = (Map<String, Object>) responseBody.get("properties");
            member.setMember_name((String) properties.get("nickname"));

            Map<String, Object> kakaoAccount = (Map<String, Object>) responseBody.get("kakao_account");
            if (kakaoAccount != null && kakaoAccount.containsKey("email")) {
                member.setMember_useremail((String) kakaoAccount.get("email"));
            } else {
                // 이메일이 없는 경우 가상 이메일 생성
                member.setMember_useremail("kakao_" + responseBody.get("id") + "@temp.com");
            }
        }

        return member;
    }
    
    @Override
    public void logoutKakaoUser(String accessToken) {
        String url = "https://kapi.kakao.com/v1/user/unlink";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);
    }
}
