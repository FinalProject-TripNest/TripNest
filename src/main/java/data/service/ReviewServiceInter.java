package data.service;

import java.util.List;


import data.dto.ReviewJoinDto;

public interface ReviewServiceInter {
	public List<ReviewJoinDto> dataList(String room_id);

    public List<ReviewJoinDto> adminReview();
    
    public void dataDelete(String review_id);
}
