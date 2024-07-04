package data.dto.coupon;

import lombok.Data;

@Data
public class UseCouponReq {
    private String couponId;
    private String memberId;
    private boolean selected;
}
