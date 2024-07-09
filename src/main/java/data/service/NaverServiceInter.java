package data.service;

import data.dto.MemberDto;

public interface NaverServiceInter {

    // 네이버 액세스 토큰 획득
    String getNaverAccessToken(String code, String state); // 인가 코드와 상태 값을 사용하여 네이버 액세스 토큰 획득

    // 네이버 사용자 정보 조회
    MemberDto getNaverUserInfo(String accessToken); // 액세스 토큰을 사용하여 네이버 사용자 정보 조회

    // 네이버 사용자 로그아웃
    void logoutNaverUser(String accessToken); // 액세스 토큰을 사용하여 네이버 사용자 로그아웃
}
