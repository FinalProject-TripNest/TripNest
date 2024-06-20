package data.service;

import java.util.List;

import data.dto.PromotionDto;

public interface PromotionServiceInter {

	public List<PromotionDto> dataList();
	
	public PromotionDto getOneData(String Promotion_id);
}
