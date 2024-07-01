package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MyPageReservationDto")
public class MyPageReservationDto {
    private int reservation_id;
    private int member_id;
    private int room_id;
    private String reservation_checkin;
    private String reservation_checkout;
    private int reservation_capacity;
    private String reservation_status;
    private int reservation_price;
    private Timestamp reservation_date;
    private String merchant_uid;
    private String room_name;
    private String image_photo;
    private int paid_amount;
}
