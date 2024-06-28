package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.JournalDto;
import data.mapper.JournalMapperInter;

@Service
public class JournalService implements JournalServiceInter {

	@Autowired
	JournalMapperInter mapperInter;

	@Override
	public List<JournalDto> dataList() {
		// TODO Auto-generated method stub
		return mapperInter.dataList();
	}

	@Override
	public JournalDto getOneData(String journal_id) {
		// TODO Auto-generated method stub
		return mapperInter.getOneData(journal_id);
	}

	@Override
	public void insertData(JournalDto dto) {
		mapperInter.insertData(dto);
		
	}

	@Override
	public void deleteData(String journal_id) {
		mapperInter.deleteData(journal_id);
		
	}
	
	

}
