package data.service;

import data.dto.LoginDto;
import data.dto.MemberDto;

public interface LoginServiceInter {
    MemberDto authenticate(LoginDto loginDto);
    MemberDto authenticateSocialUser(String socialId, String socialType); // 카카오 사용자 인증 메서드
    void registerMember(MemberDto memberDto);
}
