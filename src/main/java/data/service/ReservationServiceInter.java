package data.service;

import java.util.List;

import data.dto.ReservationDto;

public interface ReservationServiceInter {

	public List<ReservationDto> getReservationsByRoomId(String room_id);
}
