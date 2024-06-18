package data.service;

import java.util.List;

import data.dto.RoomsDto;

public interface RoomsServiceInter {

	public void insertRoom(RoomsDto dto);
	public int getLastInsertedRoomId();
	public List<RoomsDto> dataList();

}
