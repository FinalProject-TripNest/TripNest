package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReservationDto")
public class ReservationDto {


	private int reservationId;
	   private int memberId;
	   private int roomId;
	   private String reservationCheckin;
	   private String reservationCheckout;
	   private int reservationCapacity;
	   private String reservationRequire;
	   private int reservationPrice;
	   private Timestamp reservationDate;
	   private String merchantUid; // 상점 주문 번호 : 상점에서 관리하는 주문 번호 
	   //payment테이블의 주문번호 생성시 해당 컬럼에도 삽입되게함
	   private String RESERVATION_DATE;
	   private String RESERVATION_PRICE;
	   private String RESERVATION_STATUS;
	   private String MERCHANT_UID;
	   private String MEMBER_ID;



}
