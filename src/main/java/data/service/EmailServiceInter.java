package data.service;

public interface EmailServiceInter {
    
    // 이메일 인증 메일 발송
    void sendEmailVerification(String email); // 이메일 인증 메일 발송
    
    // 이메일 토큰 검증
    boolean verifyEmailToken(String email, String token); // 이메일과 토큰으로 인증 검증
    boolean verifyCode(String email, String code); // 이메일과 코드로 인증 검증 (토큰 검증과 같은 역할)
    
    // 이메일 인증 정보 삭제
    void deleteEmailVerification(String email, String token); // 이메일 인증 정보 삭제
    
    // 비밀번호 재설정 이메일 발송
    void sendResetPasswordEmail(String email); // 비밀번호 재설정 이메일 발송
}
