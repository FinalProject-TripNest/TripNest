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
    private final RefundService refundService;

    @Transactional
    public void processBookingTransaction(UseCouponReq useCouponReq, PaymentDto paymentDto, ReservationDto reservationDto) {
        try{
        	// 1. 결제 정보 저장
            paymentService.insertPayment(paymentDto);
            // 2. 예약 정보 저장
            reservationService.insertReservation(reservationDto);
            // 3. 쿠폰 사용
            if(useCouponReq.isSelected())
                couponService.useCoupon(useCouponReq);
        }catch (Exception e) {
            log.error("[error] processBookingTransaction - fail to make reservation", e);
            throw new RuntimeException(e.getMessage(),e);
        }

    }
    
    @Transactional
    public void cancelBookingTransaction(String merchant_uid) {
        try{
        	// 1. 결제 취소
            paymentService.paymentRefund(merchant_uid);
            // 2. 예약 취소
            reservationService.cancelReservation(merchant_uid);
            // 3. 쿠폰 잔여 횟수 복구
//            if(useCouponReq.isSelected())
//                couponService.useCoupon(useCouponReq);
        }catch (Exception e) {
            log.error("[error] cancelBookingTransaction - fail to cancel reservation", e);
            throw new RuntimeException(e.getMessage(),e);
        }
    }

}
