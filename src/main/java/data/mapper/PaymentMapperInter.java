package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.PaymentDto;

@Mapper
public interface PaymentMapperInter {
	
	public void savePayment(PaymentDto paymentDto);
}
