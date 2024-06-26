package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.PaymentDto;
import data.dto.Reservation_successDto;

@Mapper
public interface PaymentMapperInter {
	
	public void insertPayment(PaymentDto paymentDto);
	public Reservation_successDto getSuccessOneData(String merchant_uid);
}
