package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RoomsDto;
import data.mapper.RoomsMapperInter;

@Service
public class RoomsService implements RoomsServiceInter {

	@Autowired
	RoomsMapperInter roommapper;
	
	@Override
	public void insertRoom(RoomsDto dto) {
		// TODO Auto-generated method stub
		roommapper.insertRoom(dto);
	}

	@Override
	public int getLastInsertedRoomId() {
		// TODO Auto-generated method stub
		return roommapper.getLastInsertedRoomId();
	}

	@Override
	public List<RoomsDto> getAllRooms(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		return roommapper.getAllRooms(map);
	}

	@Override
	public int getTotalRooms() {
		// TODO Auto-generated method stub
		return roommapper.getTotalRooms();
	}

	@Override
	public RoomsDto getDataRoom(String room_id) {
		// TODO Auto-generated method stub
		return roommapper.getDataRoom(room_id);
	}

	@Override
	public void updateRoomAcc(String room_id) {
		// TODO Auto-generated method stub
		roommapper.updateRoomAcc(room_id);
	}

	@Override
	public void updateRoomHold(String room_id) {
		// TODO Auto-generated method stub
		roommapper.updateRoomHold(room_id);
	}



}
