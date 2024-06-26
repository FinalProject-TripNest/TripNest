package data.dto.coupon;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class CouponDto {
    private String couponId;
    private String couponNumber;
    private String couponGroupId;
    private String memberId;
    private Date issuedDate;
    private Date expireDate;
    private int isUsed;

    private int discountAmount;
}
