package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.PaymentDto;
import data.dto.Reservation_successDto;
import data.mapper.PaymentMapperInter;

@Service
public class PaymentService implements PaymentServiceInter {

	@Autowired
	PaymentMapperInter mapperInter;

	@Override
	public void insertPayment(PaymentDto paymentDto) {
		// TODO Auto-generated method stub
		mapperInter.insertPayment(paymentDto);
	}

	@Override
	public Reservation_successDto getSuccessOneData(String merchant_uid) {
		// TODO Auto-generated method stub
		return mapperInter.getSuccessOneData(merchant_uid);
	}

	
	
	
	
}
