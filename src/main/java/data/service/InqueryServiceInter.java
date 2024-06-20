package data.service;

import java.util.List;

import data.dto.InqueryDto;

public interface InqueryServiceInter {

	public void insertInquery(InqueryDto dto);
	public void updateInqueryAnswer(InqueryDto dto);
	public List<InqueryDto> getInqueryList(int start,int perpage);
	public int getTotalInquery();
}
