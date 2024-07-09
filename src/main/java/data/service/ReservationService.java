package data.service;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;
import data.mapper.ReservationMapperInter;

@Service
@Slf4j
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
			log.error("[error] 숙소 예약 처리 실패,", e);
			throw new RuntimeException("숙소 예약을 실패하였습니다.",e);
		}
	}

	@Override
	public void cancelReservation(String MERCHANT_UID) {
		// TODO Auto-generated method stub
		try{
			mapperInter.cancelReservation(MERCHANT_UID);
		}catch (Exception e) {
			log.error("[error] 숙소 예약 취소 처리 실패,", e);
			throw new RuntimeException("숙소 예약 취소에 실패하였습니다.",e);
		}
	}

	@Override
	public List<ReservationDto> recentReservationList() {
		// TODO Auto-generated method stub
		return mapperInter.recentReservationList();
	}
	
	
}
