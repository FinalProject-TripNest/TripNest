package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;
import data.mapper.ReservationMapperInter;

@Service
public class ReservationService implements ReservationServiceInter {

	@Autowired
	ReservationMapperInter mapperInter;

	@Override
	public RoomsDto getOneData(int room_id) {
		// TODO Auto-generated method stub
		return mapperInter.getOneData(room_id);
	}

	@Override
	public MemberDto getOneData_member(String member_useremail) {
		// TODO Auto-generated method stub
		return mapperInter.getOneData_member(member_useremail);
	}

	@Override
	public void insertReservation(ReservationDto reservationDto) {
		// TODO Auto-generated method stub
		try{
			mapperInter.insertReservation(reservationDto);
		}catch (Exception e) {
			throw new RuntimeException("[error] 숙소 예약 처리 실패,", e);
		}
	}
	
	
}
