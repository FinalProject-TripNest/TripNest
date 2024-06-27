package data.dto;

import data.dto.coupon.UseCouponReq;
import lombok.Data;

@Data
public class RequestData {
    private PaymentDto paymentDto;
    private ReservationDto reservationDto;
    private UseCouponReq useCouponReq;
}
