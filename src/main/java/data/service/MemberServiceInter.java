package data.service;

import java.util.List;

import data.dto.MemberDto;

public interface MemberServiceInter {
    void registerMember(MemberDto dto, String token);
    MemberDto findByEmail(String email);
    boolean checkEmailExists(String email);
    String findMemberEmailByNameAndPhone(String member_name, String member_phone);
    
    MemberDto findMemberEmail(int member_id);
    int getTotalMember();

    List<MemberDto> dataList();
    void dataDelete(int member_id);
    
    List<MemberDto> getRecentMember();

	MemberDto getMemberByEmail(String email);

	void updateMember(MemberDto memberDto);
	void deleteMember(int member_Id);
	
	boolean resetPassword(String token, String newPassword);
	MemberDto findMemberByToken(String token);
}
