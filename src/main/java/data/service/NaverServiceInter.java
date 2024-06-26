package data.service;

import data.dto.MemberDto;

public interface NaverServiceInter {
    String getNaverAccessToken(String code, String state);
    MemberDto getNaverUserInfo(String accessToken);
    void logoutNaverUser(String accessToken);
}
