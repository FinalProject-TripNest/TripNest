package data.dto.coupon;

import lombok.Data;

@Data
public class NewEventDto {
    private String promotionId;
    private int discountAmount;
    private int quantity;
}
