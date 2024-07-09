package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import data.dto.EmailDto;
import data.mapper.EmailMapperInter;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.UUID;

@Service
public class EmailService implements EmailServiceInter {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private EmailMapperInter emailMapper;

    @Override
    @Transactional
    public void sendEmailVerification(String email) {
        // 이메일 형식 검사
        if (!isValidEmailAddress(email)) {
            throw new IllegalArgumentException("잘못된 이메일 형식입니다.");
        }

        String token = UUID.randomUUID().toString().substring(0, 6); // 6자리 코드 생성
        EmailDto emailDto = new EmailDto();
        emailDto.setEmail_id(UUID.randomUUID().toString());
        emailDto.setMember_useremail(email);
        emailDto.setEmail_token(token);
        emailDto.setEmail_verified(false);
        emailMapper.insertEmailVerification(emailDto);

        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(email);
            helper.setSubject("이메일 인증");
            helper.setText("<p>이메일 인증을 위해 아래 코드를 입력하세요:</p>" +
                    "<p>인증 코드: " + token + "</p>", true);
            mailSender.send(message);
        } catch (Exception e) {
            throw new IllegalStateException("이메일 전송에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void sendResetPasswordEmail(String email) {
        if (!isValidEmailAddress(email)) {
            throw new IllegalArgumentException("잘못된 이메일 형식입니다.");
        }

        String token = UUID.randomUUID().toString().substring(0, 6); // 6자리 코드 생성
        EmailDto emailDto = new EmailDto();
        emailDto.setEmail_id(UUID.randomUUID().toString());
        emailDto.setMember_useremail(email);
        emailDto.setEmail_token(token);
        emailDto.setEmail_verified(false); // 이메일 인증 상태를 false로 설정
        emailMapper.insertEmailVerification(emailDto);
        System.out.println("Token generated: " + token + " for email: " + email); // 디버깅을 위한 로그 추가

        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(email);
            helper.setSubject("비밀번호 재설정");
            helper.setText("<p>비밀번호를 재설정하려면 아래 링크를 클릭하세요:</p>" +
                    "<p><a href=\"http://localhost:8080/member/resetPassword?token=" + token + "\">비밀번호 재설정</a></p>", true);
            mailSender.send(message);
        } catch (Exception e) {
            throw new IllegalStateException("이메일 전송에 실패했습니다.", e);
        }
    }

    @Override
    @Transactional
    public boolean verifyEmailToken(String email, String token) {
        System.out.println("Starting token verification for email: " + email + " and token: " + token);
        
        // 이메일과 토큰을 사용하여 이메일 인증 정보를 조회
        EmailDto emailDto = emailMapper.findByUserEmailAndToken(email, token);
        if (emailDto == null) {
            // 이메일 인증 정보가 존재하지 않으면 로그 출력
            System.out.println("Invalid token: " + token + " for email: " + email);
            return false;
        }

        // 조회된 이메일 인증 정보 출력
        System.out.println("Token found: " + emailDto.getEmail_token() + " for email: " + email);
        System.out.println("Email verified status before update: " + emailDto.isEmail_verified());

        // 이메일 인증 상태를 업데이트
        emailDto.setEmail_verified(true);
        emailMapper.updateEmailVerification(emailDto);
        
        // 업데이트된 이메일 인증 정보 출력
        EmailDto updatedEmailDto = emailMapper.findByUserEmailAndToken(email, token);
        System.out.println("Email verified status after update: " + updatedEmailDto.isEmail_verified());

        return updatedEmailDto.isEmail_verified();
    }
    
    @Override
    public boolean verifyCode(String email, String code) {
        return verifyEmailToken(email, code);
    }
    
    @Override
    @Transactional
    public void deleteEmailVerification(String email, String token) {
        emailMapper.deleteEmailVerification(email, token);
    }

    private boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }
}
