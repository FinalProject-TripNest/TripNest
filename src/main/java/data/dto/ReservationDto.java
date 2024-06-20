package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReservationDto")
public class ReservationDto {
	
	private int RESERVATION_ID;
	private int MEMBER_ID;
	private int ROOM_ID;
	private String RESERVATION_CHECKIN;
	private String RESERVATION_CHECKOUT;
	private int RESERVATION_CAPACITY;
	private String RESERVATION_REQUIRE;
	private int RESERVATION_PRICE;
	private Timestamp RESERVATION_DATE;
}
