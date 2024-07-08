package data.service;

import java.util.List;

import data.dto.PromotionDto;

public interface PromotionServiceInter {

	public List<PromotionDto> dataList();

	public PromotionDto getOneData(String Promotion_id);

	public void insertData(PromotionDto dto);

	public void deleteData(String journal_id);

	public String photoData(String journal_id);

	public void updateData(PromotionDto dto);
}
