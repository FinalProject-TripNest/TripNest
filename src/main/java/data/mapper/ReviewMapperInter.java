package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ReviewDto;
import data.dto.ReviewJoinDto;

@Mapper
public interface ReviewMapperInter {

	public List<ReviewJoinDto> dataList(String room_id);

    public List<ReviewJoinDto> adminReview();
    
    public void dataDelete(String review_id);

}
