package data.service;

import java.util.List;

import data.dto.RoomsDto;

public interface RoomsServiceInter {

	public void insertRoom(RoomsDto dto);

	public int getLastInsertedRoomId();

	public List<RoomsDto> getAllRooms(int start,int perpage);
	public int getTotalRooms();
	public RoomsDto getDataRoom(String room_id);
	public void updateRoomAcc(String room_id);
	public void updateRoomHold(String room_id);


	public List<RoomsDto> dataList();

	public RoomsDto getOneData(String room_id);

	public int getCountNoRoom();
	public List<RoomsDto> getRecentRoom();
}

