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
		try{
			mapperInter.insertPayment(paymentDto);
		}catch (Exception e) {
			throw new RuntimeException("[error] 결제 처리 실패,", e);
		}
	}

	@Override
	public Reservation_successDto getSuccessOneData(String merchant_uid) {
		// TODO Auto-generated method stub
		return mapperInter.getSuccessOneData(merchant_uid);
	}

	@Override
	public String getImgByRoomId(String room_id) {
		// TODO Auto-generated method stub
		return mapperInter.getImgByRoomId(room_id);
	}

	
	
	
	
}
