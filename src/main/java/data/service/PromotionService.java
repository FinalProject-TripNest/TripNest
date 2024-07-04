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

	public String getCouponGroupId(String promotion_id) {
		return mapperInter.getCouponGroupId(promotion_id);
	}

}
