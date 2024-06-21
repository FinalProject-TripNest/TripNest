package data.dto.coupon;

import lombok.Data;

@Data
public class CreateCouponReq {
    private String couponGroupId;
    private String memberId;

}
