package data.service;

import java.util.List;

import data.dto.MemberDto;

public interface MemberServiceInter {
    void registerMember(MemberDto dto, String token);
    MemberDto findByEmail(String email);
    boolean checkEmailExists(String email);
    public List<MemberDto> dataList();
    public void dataDelete(String member_id);
}
