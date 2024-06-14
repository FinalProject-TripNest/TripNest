package data.service;

import data.dto.RoomsDto;

public interface RoomsServiceInter {

	public void insertRoom(RoomsDto dto);
	public int getLastInsertedRoomId();

}
