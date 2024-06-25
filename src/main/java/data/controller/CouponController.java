package data.controller;

import data.dto.coupon.CouponDto;
import data.dto.coupon.CreateCouponReq;
import data.dto.coupon.NewEventDto;
import data.dto.coupon.UseCouponReq;
import data.service.CouponService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@Slf4j
public class CouponController {

    private final CouponService couponService;

    // 쿠폰 생성 (관리자)
    @PostMapping("/coupons")
    public ResponseEntity<String> createCoupon(@RequestBody NewEventDto newEventDto) {
        couponService.createNewEvent(newEventDto);
        return ResponseEntity.ok().body("쿠폰 이벤트 등록 성공");
    }

    /**
     * 쿠폰 발급
     * @param couponGroupId
     * @param createCouponReq -  memberId만 요청해도됨, couponGroupId는 PathVariable 로 받음
     * @return
     */
    @PostMapping("/coupons/{couponGroupId}/issue")
    public ResponseEntity<String> assignCoupon(@PathVariable String couponGroupId, @RequestBody CreateCouponReq createCouponReq) {
        try{
            createCouponReq.setCouponGroupId(couponGroupId);
            couponService.assignCoupon(createCouponReq);
        }catch (Exception e) {
            log.error("[error] fail to create coupon(coupon_group_id:{}) for user(user_id:{})",
                    couponGroupId,createCouponReq.getMemberId(),e);
            return ResponseEntity.badRequest().body("쿠폰 발급 실패");
        }
        return ResponseEntity.ok().body("쿠폰 발급 성공");
    }

    /**
     * 쿠폰 사용
     * @param couponId
     * @param useCouponReq - memberId만 요청해도됨, couponId는 PathVariable 로 받음
     */
    @PostMapping("/coupons/{couponId}/redeem")
    public ResponseEntity<String> useCoupon(@PathVariable String couponId, @RequestBody UseCouponReq useCouponReq) {
        try{
            useCouponReq.setCouponId(couponId);
            couponService.useCoupon(useCouponReq);
        }catch (Exception e){
            log.error("[error] user(user_id:{}) fail to use coupon(coupon_id:{}) ",
                    useCouponReq.getMemberId(), couponId, e);
            return ResponseEntity.badRequest().body("쿠폰 사용 실패");
        }
        return ResponseEntity.ok().body("쿠폰 사용 성공");
    }


    /**
     * 사용자의 "유효한" 쿠폰 목록 조회
     * @param memberId
     */
    @GetMapping("/users/{memberId}/coupons")
    public List<CouponDto> getMemberCoupons(@PathVariable String memberId) {
        return couponService.getMemberCoupons(memberId);
    }

}