package data.service;

import data.dto.coupon.CouponDto;
import data.dto.coupon.CreateCouponReq;
import data.dto.coupon.NewEventDto;
import data.dto.coupon.UseCouponReq;
import data.mapper.CouponMapperInter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        try{
            // 1. 존재하는 쿠폰 이벤트 인지 확인
            if(!mapper.isValidEvent(createCouponReq.getCouponGroupId())){
                log.error("[error] 쿠폰 발급 실패 - 존재하지 않는 이벤트입니다.");
                throw new RuntimeException("존재하지 않는 이벤트입니다.");
            }
            // 2. 이미 발급 받은 쿠폰인지 확인
            if(mapper.checkCouponExist(createCouponReq)){
                log.error("[error] 쿠폰 발급 실패 - 이미 쿠폰을 발급받으셨습니다.");
                throw new RuntimeException("이미 쿠폰을 발급받으셨습니다.");
            }
            // 3. 쿠폰 수량 확인
            if(mapper.getCouponCount(createCouponReq.getCouponGroupId()) <= 0){
                log.error("[error] 쿠폰 발급 실패 - 쿠폰 수량이 부족합니다.");
                throw new RuntimeException("쿠폰 수량이 부족합니다.");
            }

            // 4. 쿠폰 생성
            CouponDto couponDto = generateCouponDto(createCouponReq);

            // 5. 쿠폰 발급
            issueCoupon(createCouponReq, couponDto);

        }catch (Exception e) {
            log.error("[error] assignCoupon - 쿠폰 발급 실패", e);
            throw new RuntimeException(e.getMessage());
        }
    }

    public void useCoupon(UseCouponReq useCouponReq) {
        try{
            // 1. 쿠폰 사용 여부, 만료 여부 체크
            boolean validCoupon = mapper.isValidCoupon(useCouponReq.getCouponId());
            log.info("CouponService.useCoupon - validCoupon : {}", validCoupon);
            if(!validCoupon){
                throw new RuntimeException("사용이 불가능한 쿠폰입니다.");
            }
            // 2. 쿠폰 사용 처리
            mapper.updateCouponStatus(useCouponReq.getCouponId());
            log.info("CouponService.useCoupon - 쿠폰(coupon_id:{}) 사용 완료", useCouponReq.getCouponId());
        }catch (Exception e) {
            log.error("[error] 쿠폰 사용 처리 실패", e);
            throw new RuntimeException(e.getMessage(),e);
        }
    }

    public List<CouponDto> getMemberCoupons(String memberId) {
        // 사용자의 "유효한" 쿠폰 조회
        return mapper.getCouponByMemberId(memberId);
    }

    private static CouponDto generateCouponDto(CreateCouponReq createCouponReq) {
        UUID uuid = UUID.randomUUID(); //쿠폰 id를 uuid 로 생성
        log.info("CouponService.assignCoupon - uuid : {}", uuid);

        Date issueDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(issueDate);
        cal.add(Calendar.MONTH, EXPIRATION_DURATION_MONTHS); // 쿠폰 만료 기간 설정
        Date expireDate = cal.getTime();

        return CouponDto.builder()
                .couponNumber(uuid.toString())
                .couponGroupId(createCouponReq.getCouponGroupId())
                .memberId(createCouponReq.getMemberId())
                .issuedDate(issueDate)
                .expireDate(expireDate)
                .isUsed(UN_USED) // 초기값: 사용안함
                .build();
    }

    @Transactional
    protected void issueCoupon(CreateCouponReq createCouponReq, CouponDto couponDto) {
        try{
            mapper.decreaseCouponCount(createCouponReq.getCouponGroupId()); // 쿠폰 수량 감소
            mapper.insertCoupon(couponDto); // 유저에게 쿠폰 발급
        }catch (Exception e) {
            log.error("[error] issueCoupon - 쿠폰 발급 실패", e);
            throw new RuntimeException(e.getMessage(),e);
        }
    }
}
