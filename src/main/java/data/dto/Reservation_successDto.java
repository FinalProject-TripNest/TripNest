package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Reservation_successDto")
public class Reservation_successDto {
	
	//payment 테이블과 reservation 테이블 조인 => 예약완료화면에 출력
    private String member_id;
    private String buyer_name;
    private int paid_amount;
    private String merchant_uid;
    private String RESERVATION_CHECKIN;
    private String RESERVATION_CHECKOUT;
    private int RESERVATION_CAPACITY;
    private int ROOM_ID;
	
}
