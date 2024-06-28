package data.service;

import java.util.List;

import data.dto.JournalDto;
import data.dto.PromotionDto;

public interface JournalServiceInter {

	public List<JournalDto> dataList();

	public JournalDto getOneData(String journal_id);

	public void insertData(JournalDto dto);
	
	public void deleteData(String journal_id);
}
