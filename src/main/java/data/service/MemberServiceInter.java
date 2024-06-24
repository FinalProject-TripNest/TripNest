package data.service;

import data.dto.MemberDto;

public interface MemberServiceInter {
    void registerMember(MemberDto dto, String token);
    MemberDto findByEmail(String email);
    boolean checkEmailExists(String email);
    
    MemberDto findMemberEmail(int member_id);
    int getTotalMember();
}
