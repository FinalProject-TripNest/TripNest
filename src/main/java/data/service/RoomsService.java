package data.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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



}