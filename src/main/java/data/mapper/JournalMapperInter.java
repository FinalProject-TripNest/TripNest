package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.JournalDto;

@Mapper
public interface JournalMapperInter {

	public List<JournalDto> dataList();

	public JournalDto getOneData(String journal_id);

	public void insertData(JournalDto dto);

	public void deleteData(String journal_id);

	public String photoData(String journal_id);
	
	public void updateData(JournalDto dto);
}
