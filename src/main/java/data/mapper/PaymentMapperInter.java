package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.time.LocalDateTime;

import data.dto.PaymentDto;
import data.dto.Reservation_successDto;

@Mapper
public interface PaymentMapperInter {
	
	public void insertPayment(PaymentDto paymentDto);
	public Reservation_successDto getSuccessOneData(String merchant_uid);
	public String getImgByRoomId(String room_id);
	public void paymentRefund(String merchant_uid);
	public void RefundChangeTime(String paid_date, String merchant_uid);
}
