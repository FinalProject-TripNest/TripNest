package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

    void insertMember(MemberDto dto);
    MemberDto findByEmail(@Param("email") String email);
    MemberDto findBySocialIdAndType(@Param("social_id") String social_id, @Param("social_type") String social_type);
    MemberDto findMemberByNameAndPhone(@Param("member_name") String member_name, @Param("member_phone") String member_phone);
    
    //유지
    MemberDto findMemberEmail(int member_id);
    int getTotalMember();

	 List<MemberDto> dataList();

	 void dataDelete(int member_id);
	 
	 List<MemberDto> getRecentMember();

    void updateMember(MemberDto memberDto);
    void deleteMember(int member_Id);
    
    MemberDto findMemberByEmail(@Param("email") String email);
    void updatePassword(@Param("email") String email, @Param("password") String password);
    
    MemberDto findMemberByToken(@Param("token") String token);
}
