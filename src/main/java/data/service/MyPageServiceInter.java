package data.service;

import data.dto.MyPageReservationDto;

import java.util.List;

public interface MyPageServiceInter {
    List<MyPageReservationDto> getReservationsByMemberId(int member_Id);
    List<MyPageReservationDto> getCancellationsByMemberId(int member_id);
}
