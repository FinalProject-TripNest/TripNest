package data.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


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

	public List<RoomsDto> dataList();
	public RoomsDto getOneData(String room_id);
	public List<RoomsDto> getAllRoomsData();
	public RoomsDto getRoomsDataByRoomId(String room_id);
	public List<String> getImgsByRoomId(String room_id);
	public List<String> getLackRoomId(Map params);
	public RoomsDto getSimpleRoomsDataByRoomId(String room_id);
	

	public int getCountNoRoom();
	public List<RoomsDto> getRecentRoom();
	public void deleteRoom(String room_id);
	public List<RoomsDto> getRoomDataByMyid(int member_id);
	public void updateRoom(RoomsDto dto);


}


