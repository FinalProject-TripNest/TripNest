package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import data.dto.ReservationDto;

@Mapper
public interface ReservationMapperInter {

	public List<ReservationDto> getReservationsByRoomId(@Param("room_id") String room_id);
	
}
