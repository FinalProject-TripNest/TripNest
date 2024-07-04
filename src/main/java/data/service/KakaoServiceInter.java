package data.service;

import data.dto.MemberDto;

public interface KakaoServiceInter {
    String getKakaoAccessToken(String code);
    MemberDto getKakaoUserInfo(String accessToken);
    void logoutKakaoUser(String accessToken);
}
