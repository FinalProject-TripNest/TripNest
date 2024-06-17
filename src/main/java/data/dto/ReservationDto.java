package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReservationDto")
public class ReservationDto {
	
	private int reservation_id;
	private int member_id;
	private int room_id;
	private String reservation_checkin;
	private String reservation_checkout;
	private String reservation_status;
	private int reservation_price;
	
	
}
