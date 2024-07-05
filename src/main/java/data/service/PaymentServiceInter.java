package data.service;

import data.dto.PaymentDto;
import data.dto.Reservation_successDto;

public interface PaymentServiceInter {
	
	public void insertPayment(PaymentDto paymentDto);
	public Reservation_successDto getSuccessOneData(String merchant_uid);
	public String getImgByRoomId(String room_id);
	public void paymentRefund(String merchant_uid);
	public void RefundChangeTime(String paid_date, String merchant_uid);
}
