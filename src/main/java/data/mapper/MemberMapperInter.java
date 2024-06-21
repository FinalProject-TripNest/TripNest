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

	public List<MemberDto> dataList();

	public void dataDelete(String member_id);
}
