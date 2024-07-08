package data.service;

public interface EmailServiceInter {
    void sendEmailVerification(String email);
    boolean verifyEmailToken(String email, String token);
    boolean verifyCode(String email, String code);
    void deleteEmailVerification(String email, String token);
    void sendResetPasswordEmail(String email);
}
