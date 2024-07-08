package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

    // 회원 등록
    void insertMember(MemberDto dto); // 회원 등록

    // 회원 정보 조회
    MemberDto findByEmail(@Param("email") String email); // 이메일로 회원 정보 조회
    MemberDto findMemberByEmail(@Param("email") String email); // 이메일로 회원 정보 조회
    MemberDto findBySocialIdAndType(@Param("social_id") String social_id, @Param("social_type") String social_type); // 소셜 ID와 타입으로 회원 정보 조회
    MemberDto findMemberByNameAndPhone(@Param("member_name") String member_name, @Param("member_phone") String member_phone); // 이름과 전화번호로 회원 이메일 조회
    MemberDto findMemberEmail(int member_id); // 회원 ID로 회원 이메일 조회
    MemberDto findMemberByToken(@Param("token") String token); // 토큰으로 회원 정보 조회 (비밀번호 재설정 시 사용)

    // 회원 정보 업데이트
    void updatePassword(@Param("email") String email, @Param("password") String password); // 이메일로 비밀번호 업데이트
    void updateMember(MemberDto memberDto); // 회원 정보 업데이트

    // 회원 삭제
    void deleteMember(int member_Id); // 회원 ID로 회원 삭제
    void dataDelete(int member_id); // 회원 ID로 회원 삭제

    // 회원 통계 및 목록 조회
    int getTotalMember(); // 전체 회원 수 조회
    List<MemberDto> dataList(); // 모든 회원 정보 조회
    List<MemberDto> getRecentMember(); // 최근 가입한 회원 목록 조회
}
