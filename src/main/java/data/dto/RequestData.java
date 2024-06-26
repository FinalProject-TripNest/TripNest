package data.dto;

import lombok.Data;

@Data
public class RequestData {
    private PaymentDto paymentDto;
    private ReservationDto reservationDto;
    private String couponId;
}
