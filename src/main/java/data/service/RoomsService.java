package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import data.service.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RoomsDto;
import data.mapper.RoomsMapperInter;

@Service
public class RoomsService implements RoomsServiceInter {

	@Autowired
	RoomsMapperInter roommapper;
	@Autowired
	RedisService redisService;

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


	public List<RoomsDto> getAllRoomsData() {
		return roommapper.getAllRoomsData();
	}
	public RoomsDto getRoomsDataByRoomId(String room_id) {
		return roommapper.getRoomsDataByRoomId(room_id);
	}
	public List<String> getImgsByRoomId(String room_id) {
		return roommapper.getImgsByRoomId(room_id);
	}

	public List<RoomsDto> getTopRoomsId() {

		Set<String> viewRank = redisService.getTopRoomIds("viewRank");

		Map<String, Object> params = new HashMap<>();
		params.put("num", 6 - viewRank.size());
		params.put("excludedIds", viewRank);

		List<String> lackRoomId = roommapper.getLackRoomId(params);

        viewRank.addAll(lackRoomId);

		List<RoomsDto> topRooms = new ArrayList<>();

		// 상위 6개 방 정보 가져오기
		for(String room_id : viewRank) {
			RoomsDto room = roommapper.getSimpleRoomsDataByRoomId(room_id);
			topRooms.add(room);
		}

		//도, 시 정보 추가
		for (RoomsDto room : topRooms) {
			String[] addressParts = room.getRoom_address().split(" ");
			if (addressParts.length >= 2) {
				room.setCity(addressParts[0]);
				room.setDistrict(addressParts[1]);
			}
		}

		return topRooms;
	}

	@Override
	public int getCountNoRoom() {
		// TODO Auto-generated method stub
		return roommapper.getCountNoRoom();
	}

	@Override
	public List<RoomsDto> getRecentRoom() {
		// TODO Auto-generated method stub
		return roommapper.getRecentRoom();
	}


	public RoomsDto getOneData(String room_id) {
		// TODO Auto-generated method stub
		return roommapper.getOneData(room_id);
	}

	@Override
	public void deleteRoom(String room_id) {
		// TODO Auto-generated method stub
	 roommapper.deleteRoom(room_id);
		
	}

	@Override
	public List<RoomsDto> getRoomDataByMyid(int member_id) {
		// TODO Auto-generated method stub
		return roommapper.getRoomDataByMyid(member_id);
	}

	@Override
	public void updateRoom(RoomsDto dto) {
		// TODO Auto-generated method stub
		roommapper.updateRoom(dto);
	}


}