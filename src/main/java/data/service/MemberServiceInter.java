package data.service;

import java.util.List;

import data.dto.MemberDto;

public interface MemberServiceInter {
    void registerMember(MemberDto dto, String token);
    MemberDto findByEmail(String email);
    boolean checkEmailExists(String email);

    
    MemberDto findMemberEmail(int member_id);
    int getTotalMember();

    public List<MemberDto> dataList();
    public void dataDelete(int member_id);

}
