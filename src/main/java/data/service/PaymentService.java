package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.PaymentDto;
import data.mapper.PaymentMapperInter;

@Service
public class PaymentService implements PaymentServiceInter {

	@Autowired
	PaymentMapperInter mapperInter;

	@Override
	public void savePayment(PaymentDto paymentDto) {
		// TODO Auto-generated method stub
		mapperInter.savePayment(paymentDto);
	}
	
	
	
	
}
