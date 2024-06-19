package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import data.dto.LoginDto;
import data.dto.MemberDto;
import data.mapper.MemberMapperInter;

@Service
public class LoginService implements LoginServiceInter {

    @Autowired
    private MemberMapperInter memberMapper;

    @Override
    @Transactional
    public MemberDto authenticate(LoginDto loginDto) {
        MemberDto member = memberMapper.findByEmail(loginDto.getEmail());
        if (member != null && member.getMember_password().equals(loginDto.getPassword())) {
            return member;
        }
        return null;
    }

    @Override
    @Transactional
    public MemberDto authenticateSocialUser(String socialId, String socialType) {
        return memberMapper.findBySocialIdAndType(socialId, socialType);
    }

    @Override
    @Transactional
    public void registerMember(MemberDto memberDto) {
        memberMapper.insertMember(memberDto);
    }
}
