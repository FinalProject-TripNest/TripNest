package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.InqueryDto;
import data.mapper.InqueryMapperInter;

@Service
public class InqueryService implements InqueryServiceInter {

	@Autowired
	InqueryMapperInter mapper;
	@Override
	public void insertInquery(InqueryDto dto) {
		// TODO Auto-generated method stub
		mapper.insertInquery(dto);
		
	}

	@Override
	public List<InqueryDto> getInqueryList(int start,int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage",perpage);
		return mapper.getInqueryList(map);
	}
	@Override
	public int getTotalInquery() {
		// TODO Auto-generated method stub
		return mapper.getTotalInquery();
	}

	@Override
	public void updateInqueryAnswer(InqueryDto dto) {
		// TODO Auto-generated method stub
		mapper.updateInqueryAnswer(dto);
	}

	@Override
	public InqueryDto inqueryAdminAnswerList(String inquery_id) {
		// TODO Auto-generated method stub
		return mapper.inqueryAdminAnswerList(inquery_id);
	}

	@Override
	public int getCountAnswer() {
		// TODO Auto-generated method stub

		return mapper.getCountAnswer();
	}

	@Override
	public List<InqueryDto> getNullInquery() {
		// TODO Auto-generated method stub
		return mapper.getNullInquery();
	}

	@Override
	public List<InqueryDto> getMyInqueryDatas(int member_id) {
		// TODO Auto-generated method stub
		return mapper.getMyInqueryDatas(member_id);
	}

	@Override
	public void deleteInquery(String inquery_id) {
		// TODO Auto-generated method stub
		mapper.deleteInquery(inquery_id);
	}




}
