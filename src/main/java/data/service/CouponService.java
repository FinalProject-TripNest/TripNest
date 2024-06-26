package data.service;

import data.dto.coupon.CouponDto;
import data.dto.coupon.CreateCouponReq;
import data.dto.coupon.NewEventDto;
import data.dto.coupon.UseCouponReq;
import data.mapper.CouponMapperInter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class CouponService {

    private static final int EXPIRATION_DURATION_MONTHS = 3;
    private static final int UN_USED = 0;

    private final CouponMapperInter mapper;
    public void getCoupons() {
        // 전체 쿠폰 조회 로직

    }
    public void createNewEvent(NewEventDto newEventDto) {
        // 이벤트 생성 로직
        mapper.insertCouponGroup(newEventDto);
    }

    public void assignCoupon(CreateCouponReq createCouponReq) {
        // 쿠폰 발급 로직


        //TODO : 쿠폰 수량 체크 로직 추가
        //TODO : 계정당 쿠폰은 하나만 생성할 수 있다.


//        if(true){
//            throw new RuntimeException("====================== test error ======================");
//        }


        /**
         *
         */

        //쿠폰 id를 uuid 로 생성
        UUID uuid = UUID.randomUUID();
        log.info("CouponService.assignCoupon - uuid : {}", uuid);

        Date issueDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(issueDate);
        cal.add(Calendar.MONTH, EXPIRATION_DURATION_MONTHS); // 쿠폰 만료 기간 설정
        Date expireDate = cal.getTime();

        CouponDto couponDto = CouponDto.builder()
                .couponNumber(uuid.toString())
                .couponGroupId(createCouponReq.getCouponGroupId())
                .memberId(createCouponReq.getMemberId())
                .issuedDate(issueDate)
                .expireDate(expireDate)
                .isUsed(UN_USED) // 초기값: 사용안함
                .build();

        mapper.insertCoupon(couponDto);
    }

    public void useCoupon(UseCouponReq useCouponReq) {
        // 1. 쿠폰 사용 여부, 만료 여부 체크
        boolean validCoupon = mapper.isValidCoupon(useCouponReq.getCouponId());
        log.info("CouponService.useCoupon - validCoupon : {}", validCoupon);
        if(!validCoupon){
            throw new RuntimeException("이미 사용되었거나 만료된 쿠폰입니다.");
        }
        // 2. 쿠폰 사용 처리
        mapper.updateCouponStatus(useCouponReq.getCouponId());
        log.info("CouponService.useCoupon - 쿠폰(coupon_id:{}) 사용 완료", useCouponReq.getCouponId());
    }


    public List<CouponDto> getMemberCoupons(String memberId) {
        // 사용자의 "유효한" 쿠폰 조회
        return mapper.getCouponByMemberId(memberId);
    }
}
