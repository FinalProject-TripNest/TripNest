package data.service;

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

    @Override
    @Transactional
    public void registerMember(MemberDto memberDto, String token) {
        // 이메일 인증 정보 확인
        EmailDto emailDto = emailMapper.findByEmailToken(token);
        if (emailDto == null || !emailDto.isEmail_verified() || !emailDto.getMember_useremail().equals(memberDto.getMember_useremail())) {
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
	public MemberDto getMemberByEmail(String email) {
		return memberMapper.findByEmail(email);
	}
}
