package data.service;

import java.util.List;

import data.dto.RoomsDto;

public interface RoomsServiceInter {

	public void insertRoom(RoomsDto dto);

	public int getLastInsertedRoomId();

	public List<RoomsDto> dataList();

	public RoomsDto getOneData(String room_id);
	
	public void deleteRoom(String room_id);
	
	public List<RoomsDto> getRoomDataByMyid(int member_id);

	public void updateRoom(RoomsDto dto);
}