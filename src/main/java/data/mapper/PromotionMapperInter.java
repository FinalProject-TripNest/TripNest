package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.JournalDto;
import data.dto.PromotionDto;

@Mapper
public interface PromotionMapperInter {

	public List<PromotionDto> dataList();
}
