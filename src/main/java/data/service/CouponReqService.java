package data.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import data.dto.coupon.CreateCouponReq;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class CouponReqService {
    private final RabbitTemplate rabbitTemplate;
    private final ObjectMapper objectMapper;
    private final CouponService couponService;

    public String  couponReqSender (CreateCouponReq createCouponReq){
        String couponReqRes = null;
        try {
            log.info("[쿠폰 발급 요청 전송] => " + createCouponReq.toString());
            String message = objectMapper.writeValueAsString(createCouponReq);
            couponReqRes = (String) rabbitTemplate.convertSendAndReceive("time", "my-key", message);
        } catch (Exception e) {
            log.error("[메세지큐 발신 오류] ", e);
            couponReqRes = "[error] " + e.getMessage();
        }
        return couponReqRes;
    }

    @RabbitListener(bindings = @QueueBinding(
            exchange = @Exchange(name="time",type= ExchangeTypes.TOPIC),
            value=@Queue(name="coupon-request-queue"),
            key = "my-key")
    )
    public String couponReqReceiver(@Payload String msg){
        String couponReqRes = null;
        try{
            CreateCouponReq createCouponReq = objectMapper.readValue(msg, CreateCouponReq.class);
            log.info("[쿠폰 발급 요청 수신] <= " + createCouponReq.toString());
            couponService.assignCoupon(createCouponReq);
            couponReqRes = "[success] 쿠폰 발급 성공";
        }
        catch (Exception e){
            log.error("[메세지큐 수신 오류]",e);
            couponReqRes = "[error] " + e.getMessage();
        }
        return couponReqRes;
    }

}
