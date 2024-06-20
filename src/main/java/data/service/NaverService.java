package data.service;

import data.dto.MemberDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Service
public class NaverService implements NaverServiceInter {

    @Value("${naver.client-id}")
    private String clientId;

    @Value("${naver.client-secret}")
    private String clientSecret;

    @Value("${naver.redirect-uri}")
    private String redirectUri;

    @Override
    public String getNaverAccessToken(String code, String state) {
        String url = "https://nid.naver.com/oauth2.0/token";
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("code", code);
        params.add("state", state);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, request, Map.class);

        Map<String, Object> responseBody = response.getBody();
        if (responseBody != null) {
            return (String) responseBody.get("access_token");
        } else {
            throw new RuntimeException("Failed to get access token from Naver");
        }
    }

    @Override
    public MemberDto getNaverUserInfo(String accessToken) {
        String url = "https://openapi.naver.com/v1/nid/me";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
        Map<String, Object> responseBody = response.getBody();

        MemberDto member = new MemberDto();
        if (responseBody != null && responseBody.containsKey("response")) {
            Map<String, Object> responseMap = (Map<String, Object>) responseBody.get("response");
            member.setMember_social_id((String) responseMap.get("id"));
            member.setMember_social_type("naver");
            member.setMember_name((String) responseMap.get("name"));
            member.setMember_useremail((String) responseMap.get("email"));
            member.setMember_phone((String) responseMap.get("mobile"));

            // 생년월일 정보 파싱
            try {
                String birthYear = (String) responseMap.get("birthyear");
                String birthday = (String) responseMap.get("birthday");
                String birthDateString = birthYear + "-" + birthday.replace("-", "-");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date birthDate = dateFormat.parse(birthDateString);
                member.setMember_birth_date(birthDate);
            } catch (ParseException e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to parse birth date from Naver account information");
            }
        }

        return member;
    }

    @Override
    public void logoutNaverUser(String accessToken) {
        String url = "https://nid.naver.com/oauth2.0/token";
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "delete");
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("access_token", accessToken);
        params.add("service_provider", "NAVER");

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        restTemplate.exchange(url, HttpMethod.POST, request, Map.class);
    }
}
