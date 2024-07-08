package data.service;

import java.util.List;

import data.dto.MemberDto;

public interface MemberServiceInter {
    // 회원 등록
    void registerMember(MemberDto dto, String token); // 회원 등록

    // 회원 정보 조회
    MemberDto findByEmail(String email); // 이메일로 회원 조회
    MemberDto getMemberByEmail(String email); // 이메일로 회원 조회
    MemberDto findMemberByToken(String token); // 토큰으로 회원 조회 (비밀번호 재설정 시 사용)
    String findMemberEmailByNameAndPhone(String member_name, String member_phone); // 이름과 전화번호로 이메일 조회
    MemberDto findMemberEmail(int member_id); // 회원 ID로 이메일 조회

    // 회원 정보 확인
    boolean checkEmailExists(String email); // 이메일 중복 확인

    // 회원 정보 업데이트
    void updateMember(MemberDto memberDto); // 회원 정보 업데이트
    boolean resetPassword(String token, String newPassword); // 비밀번호 재설정

    // 회원 삭제
    void deleteMember(int member_Id); // 회원 ID로 회원 삭제
    void dataDelete(int member_id); // 회원 ID로 회원 삭제

    // 회원 통계 및 목록
    int getTotalMember(); // 전체 회원 수 조회
    List<MemberDto> dataList(); // 모든 회원 정보 조회
    List<MemberDto> getRecentMember(); // 최근 가입한 회원 목록 조회
}
