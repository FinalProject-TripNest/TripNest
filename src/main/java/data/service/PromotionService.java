package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.PromotionDto;
import data.mapper.PromotionMapperInter;

@Service
public class PromotionService implements PromotionServiceInter {

	@Autowired
	PromotionMapperInter mapperInter;

	@Override
	public List<PromotionDto> dataList() {
		// TODO Auto-generated method stub
		return mapperInter.dataList();
	}

	@Override
	public PromotionDto getOneData(String Promotion_id) {
		// TODO Auto-generated method stub
		return mapperInter.getOneData(Promotion_id);
	}

	@Override
	public void insertData(PromotionDto dto) {
		mapperInter.insertData(dto);
		
	}

	@Override
	public void deleteData(String journal_id) {
		mapperInter.deleteData(journal_id);
		
	}

	@Override
	public String photoData(String journal_id) {
		return mapperInter.photoData(journal_id);
	}

	@Override
	public void updateData(PromotionDto dto) {
		mapperInter.updateData(dto);
		
	}

}
