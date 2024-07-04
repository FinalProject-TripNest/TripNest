package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ReservationDto;
import data.mapper.ReservationMapperInter;

@Service
public class ReservationService implements ReservationServiceInter{
	
	@Autowired
	ReservationMapperInter mapperInter;
	
	@Override
	public List<ReservationDto> getReservationsByRoomId(String room_id){
		
		return mapperInter.getReservationsByRoomId(room_id);
	};

}
