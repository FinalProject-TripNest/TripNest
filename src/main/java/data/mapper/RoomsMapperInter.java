package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.RoomsDto;

@Mapper
public interface RoomsMapperInter {

	public void insertRoom(RoomsDto dto);
	public int getLastInsertedRoomId();
	public List<RoomsDto> getAllRooms(HashMap<String, Integer> map);
	public int getTotalRooms();
	public RoomsDto getDataRoom(String room_id);
	public void updateRoomAcc(String room_id);
	public void updateRoomHold(String room_id);
}
