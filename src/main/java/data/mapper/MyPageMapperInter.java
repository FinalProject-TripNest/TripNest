package data.mapper;

import java.util.List;

import data.dto.MyPageReservationDto;

public interface MyPageMapperInter {
	List<MyPageReservationDto> getReservationsByMemberId(int member_Id);
	List<MyPageReservationDto> getCancellationsByMemberId(int member_id);
}
