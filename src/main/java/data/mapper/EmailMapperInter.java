package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import data.dto.EmailDto;

@Mapper
public interface EmailMapperInter {
	// 이메일 인증 정보 삽입
	void insertEmailVerification(EmailDto dto);
	// 이메일 토큰으로 인증 정보 조회
    EmailDto findByEmailToken(@Param("token") String token);
    // 이메일과 토큰으로 인증 정보 조회
    EmailDto findByUserEmailAndToken(@Param("email") String email, @Param("token") String token);
    // 이메일 인증 정보 업데이트
    void updateEmailVerification(EmailDto dto);
    // 이메일 토큰으로 인증 정보 삭제
    void deleteEmailVerification(@Param("email") String email, @Param("token") String token);
}
