package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Reservation_successDto")
public class Reservation_successDto {

    private String member_id;
    private String buyer_name;
    private int paid_amount;
    private String merchant_uid;
    private String RESERVATION_CHECKIN;
    private String RESERVATION_CHECKOUT;
    private int RESERVATION_CAPACITY;
    private int ROOM_ID;
	
}
