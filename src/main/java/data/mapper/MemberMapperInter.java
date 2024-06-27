package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
    void insertMember(MemberDto dto);
    MemberDto findByEmail(@Param("email") String email);
    MemberDto findBySocialIdAndType(@Param("social_id") String social_id, @Param("social_type") String social_type);
    void updateMember(MemberDto memberDto);
}
