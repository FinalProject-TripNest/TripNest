package data.service;

import data.dto.LoginDto;
import data.dto.MemberDto;

public interface LoginServiceInter {

    // 사용자 인증
    MemberDto authenticate(LoginDto loginDto); // 로그인 정보를 사용하여 사용자 인증

    // 소셜 사용자 인증 (카카오,네이버 사용자)
    MemberDto authenticateSocialUser(String socialId, String socialType); // 소셜 ID와 타입을 사용하여 소셜 사용자 인증

    // 회원 등록
    void registerMember(MemberDto memberDto); // 회원 정보를 사용하여 새로운 회원 등록
}
