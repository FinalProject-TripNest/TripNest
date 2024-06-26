package data.service;

import data.dto.PaymentDto;
import data.dto.ReservationDto;
import data.dto.coupon.UseCouponReq;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReservationTransactionManager {

    private final CouponService couponService;
    private final PaymentService paymentService;
    private final ReservationService reservationService;

    @Transactional
    public void processBookingTransaction(UseCouponReq useCouponReq, PaymentDto paymentDto, ReservationDto reservationDto) {
        try{
        	
        	// 1. 결제 정보 저장
            paymentService.insertPayment(paymentDto);
            // 2. 예약 정보 저장
            reservationService.insertReservation(reservationDto);
            // 3. 쿠폰 사용
            couponService.useCoupon(useCouponReq);
            
        }catch (Exception e) {
            log.error("[error] fail to make reservation", e);
            throw new RuntimeException("[error] fail to make reservation", e);
        }

    }

}
