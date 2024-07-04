package data.dto;

import java.sql.Timestamp;
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
	
	

//	private int RESERVATION_ID;
//	private int MEMBER_ID;
//	private int ROOM_ID;
//	private String RESERVATION_CHECKIN;
//	private String RESERVATION_CHECKOUT;
//	private int RESERVATION_CAPACITY;
//	private String RESERVATION_REQUIRE;
//	private int RESERVATION_PRICE;
//	private Timestamp RESERVATION_DATE;
//	private String MERCHANT_UID; // 상점 주문 번호 : 상점에서 관리하는 주문 번호 
//	//payment테이블의 주문번호 생성시 해당 컬럼에도 삽입되게함
	private int reservationId;
	   private int memberId;
	   private int roomId;
	   private String reservationCheckin;
	   private String reservationCheckout;
	   private int reservationCapacity;
	   private String reservationRequire;
	   private int reservationPrice;
	   private Timestamp reservationDate;
	   private String merchantUid;


}
