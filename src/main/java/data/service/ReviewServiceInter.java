package data.service;

import java.util.List;

import data.dto.ReviewDto;
import data.dto.ReviewJoinDto;

public interface ReviewServiceInter {
	public List<ReviewJoinDto> dataList(String room_id);
}
