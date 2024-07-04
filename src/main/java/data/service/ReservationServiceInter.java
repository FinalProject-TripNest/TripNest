package data.service;

import data.dto.MemberDto;
import data.dto.ReservationDto;
import data.dto.RoomsDto;

public interface ReservationServiceInter {
	
	public RoomsDto getOneData(int room_id);
	public MemberDto getOneData_member(String member_useremail);
	public void insertReservation(ReservationDto reservationDto);
	public void cancelReservation(String MERCHANT_UID);

}
