package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;

@Mapper
public interface ReservationMapperInter {
	
	public RoomsDto getOneData(int room_id);
	public MemberDto getOneData_member(String member_useremail);
	public void insertReservation(ReservationDto reservationDto);
	public void cancelReservation(String MERCHANT_UID);
	public void updateReservationStatus();
}
