package data.mapper;

import data.dto.coupon.CouponDto;
import data.dto.coupon.NewEventDto;
import data.dto.coupon.UseCouponReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CouponMapperInter {
    // 전체 쿠폰 조회
    // 특정 쿠폰 조회
    public void insertCouponGroup(NewEventDto newEventDto); // 이벤트 생성
    public void insertCoupon(CouponDto couponDto); // 쿠폰 생성 (사용자)
    public boolean isValidCoupon(String couponId); // 쿠폰 유효성 검사
    public void updateCouponStatus(String couponId); // 쿠폰 사용
    public List<CouponDto> getCouponByMemberId(String memberId); // 사용자의 쿠폰 조회

}
