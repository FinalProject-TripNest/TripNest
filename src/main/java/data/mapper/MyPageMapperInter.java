package data.mapper;

import java.util.List;

import data.dto.MyPageReservationDto;

public interface MyPageMapperInter {

    // 회원 ID로 예약 내역 조회
    List<MyPageReservationDto> getReservationsByMemberId(int member_Id);

    // 회원 ID로 취소 내역 조회
    List<MyPageReservationDto> getCancellationsByMemberId(int member_id);
}
