package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MemberDto;
import data.dto.ReviewDto;
import data.dto.ReviewJoinDto;
import data.mapper.ReviewMapperInter;

@Service
public class ReviewService implements ReviewServiceInter {

	@Autowired
	private ReviewMapperInter reviewMapper;

	@Override
	public List<ReviewJoinDto> dataList(String room_id) {
		// TODO Auto-generated method stub
		return reviewMapper.dataList(room_id);
	}

	@Override
	public List<ReviewJoinDto> adminReview() {
		// TODO Auto-generated method stub
		return reviewMapper.adminReview();
	}

	@Override
	public void dataDelete(String review_id) {
		reviewMapper.dataDelete(review_id);

	}

}
