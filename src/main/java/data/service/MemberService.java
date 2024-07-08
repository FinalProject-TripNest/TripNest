package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import data.dto.MemberDto;
import data.dto.EmailDto;
import data.mapper.MemberMapperInter;
import data.mapper.EmailMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	private MemberMapperInter memberMapper;

	@Autowired
	private EmailMapperInter emailMapper;
	
	@Autowired
    private EmailServiceInter emailService;

	@Override
	@Transactional
	public void registerMember(MemberDto memberDto, String token) {
		// 이메일 인증 정보 확인
		EmailDto emailDto = emailMapper.findByEmailToken(token);
		if (emailDto == null || !emailDto.isEmail_verified()
				|| !emailDto.getMember_useremail().equals(memberDto.getMember_useremail())) {
			throw new IllegalArgumentException("이메일 인증이 필요합니다.");
		}
		memberMapper.insertMember(memberDto);
	}

	@Override
	public MemberDto findByEmail(String email) {
		return memberMapper.findByEmail(email);
	}

    @Override
    public boolean checkEmailExists(String email) {
        return memberMapper.findByEmail(email) != null;
    }
    
    @Override
    public String findMemberEmailByNameAndPhone(String member_name, String member_phone) {
        MemberDto member = memberMapper.findMemberByNameAndPhone(member_name, member_phone);
        return member != null ? member.getMember_useremail() : null;
    }
    
	@Override
	public MemberDto findMemberEmail(int member_id) {
		// TODO Auto-generated method stub
		return memberMapper.findMemberEmail(member_id);
	}

	@Override
	public int getTotalMember() {
		// TODO Auto-generated method stub
		return memberMapper.getTotalMember();

	}
	@Override
	public List<MemberDto> dataList() {
		// TODO Auto-generated method stub
		return memberMapper.dataList();
	}

	@Override
	public void dataDelete(int member_id) {
		memberMapper.dataDelete(member_id);

	}

	@Override
	public List<MemberDto> getRecentMember() {
		// TODO Auto-generated method stub
		return memberMapper.getRecentMember();
	}
	@Override
	public MemberDto getMemberByEmail(String email) {
		return memberMapper.findByEmail(email);
	}

	@Override
	public void updateMember(MemberDto memberDto) {
		memberMapper.updateMember(memberDto);
	}
	
	@Override
    public void deleteMember(int member_Id) {
        memberMapper.deleteMember(member_Id);
    }
	
	@Override
	@Transactional
	public boolean resetPassword(String token, String newPassword) {
	    System.out.println("Starting resetPassword for token: " + token);

	    // 토큰을 사용하여 이메일 인증 정보를 조회
	    EmailDto emailDto = emailMapper.findByEmailToken(token);
	    if (emailDto == null) {
	        System.out.println("Invalid token: " + token);
	        return false;
	    }

	    // 이메일 토큰을 검증
	    boolean isVerified = emailService.verifyEmailToken(emailDto.getMember_useremail(), token);
	    if (!isVerified) {
	        System.out.println("Email not verified for token: " + token);
	        return false;
	    }

	    // 이메일 인증이 완료되었으면 로그 출력
	    System.out.println("Email verified for token: " + token);
	    MemberDto member = memberMapper.findByEmail(emailDto.getMember_useremail());
	    if (member == null) {
	        System.out.println("No member found for email: " + emailDto.getMember_useremail());
	        return false;
	    }

	    // 회원 정보가 존재하면 로그 출력
	    System.out.println("Member found: " + member.getMember_useremail());
	    memberMapper.updatePassword(member.getMember_useremail(), newPassword);

	    // 이메일 인증 정보를 삭제
	    emailMapper.deleteEmailVerification(emailDto.getMember_useremail(), token);
	    System.out.println("Password reset successfully for email: " + emailDto.getMember_useremail());
	    return true;
	}
	
	@Override
    public MemberDto findMemberByToken(String token) {
        return memberMapper.findMemberByToken(token);
    }

}
