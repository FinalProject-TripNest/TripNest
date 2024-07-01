package data.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.MyPageReservationDto;
import data.mapper.MyPageMapperInter;

@Service
public class MyPageService implements MyPageServiceInter {

    @Autowired
    private MyPageMapperInter myPageMapperInter;

    @Override
    public List<MyPageReservationDto> getReservationsByMemberId(int member_id) {
        return myPageMapperInter.getReservationsByMemberId(member_id);
    }
    
    @Override
    public List<MyPageReservationDto> getCancellationsByMemberId(int member_id) {
        return myPageMapperInter.getCancellationsByMemberId(member_id);
    }
}
