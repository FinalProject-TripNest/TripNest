package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MemberDto;
import data.mapper.ReviewMapperInter;

@Service
public class ReviewService implements ReviewServiceInter {

	@Autowired
	private ReviewMapperInter reviewMapper;

	@Override
	public List<data.dto.ReviewDto> ReviewDto() {
		// TODO Auto-generated method stub
		return null;
	}



}
