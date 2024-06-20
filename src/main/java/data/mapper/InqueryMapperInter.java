package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.InqueryDto;

@Mapper
public interface InqueryMapperInter {

	public void insertInquery(InqueryDto dto);
	public void updateInqueryAnswer(InqueryDto dto);
	public List<InqueryDto> getInqueryList(HashMap<String, Integer> map);
	public int getTotalInquery();
}
