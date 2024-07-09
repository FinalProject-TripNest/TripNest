package data.service;

import data.dto.MemberDto;

public interface KakaoServiceInter {
    
    // 카카오 액세스 토큰 획득
    String getKakaoAccessToken(String code); // 인가 코드를 사용하여 카카오 액세스 토큰 획득
    
    // 카카오 사용자 정보 조회
    MemberDto getKakaoUserInfo(String accessToken); // 액세스 토큰을 사용하여 카카오 사용자 정보 조회
    
    // 카카오 사용자 로그아웃
    void logoutKakaoUser(String accessToken); // 액세스 토큰을 사용하여 카카오 사용자 로그아웃
}
