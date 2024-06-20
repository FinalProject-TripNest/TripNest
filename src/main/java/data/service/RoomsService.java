package data.service;

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
	public List<RoomsDto> dataList() {
		List<RoomsDto> roomsList = roommapper.dataList();
		for (RoomsDto room : roomsList) {
			String[] addressParts = room.getRoom_address().split(" ");
			if (addressParts.length >= 2) {
				room.setCity(addressParts[0]);
				room.setDistrict(addressParts[1]);
			}
		}
		return roomsList;
	}

	@Override
	public RoomsDto getOneData(String room_id) {
		// TODO Auto-generated method stub
		return roommapper.getOneData(room_id);
	}

	public List<RoomsDto> getAllRoomsData() {
		return roommapper.getAllRoomsData();
	}
	public RoomsDto getRoomsDataByRoomId(String room_id) {
		return roommapper.getRoomsDataByRoomId(room_id);
	}
	public List<RoomsDto> getSixRoomsData() {
		return roommapper.getSixRoomsData();
	}

	public List<String> getRoomImgByRoomId(String room_id) {
		return roommapper.getRoomImgByRoomId(room_id);
	}



}