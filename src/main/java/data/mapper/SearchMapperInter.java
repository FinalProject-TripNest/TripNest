package data.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import data.dto.ReservationDto;
import data.dto.RoomsDto;

@Mapper
public interface SearchMapperInter {

	public List<RoomsDto> findHotelsNearby(@Param("minLatitude") double minLatitude,
            @Param("maxLatitude") double maxLatitude,
            @Param("minLongitude") double minLongitude,
            @Param("maxLongitude") double maxLongitude,
            @Param("checkin") String checkin,
            @Param("checkout") String checkout,
            @Param("personnel") Integer personnel);
	
	public List<ReservationDto> getReservationsByRoomId(@Param("room_id") String room_id);
	
}
