package data.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.PaymentDto;
import data.service.PaymentService;
import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@PostMapping("/payment/complete")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> paymentComplete(@RequestBody PaymentDto paymentDto, HttpSession session) {

		Map<String, Object> response = new HashMap<>();
		
		try {
			// 세션에서 member_id를 가져옴
            Integer memberId = (Integer) session.getAttribute("member_id");
			
            // PaymentDto에 memberId 설정
            if (memberId != null) {
                paymentDto.setMember_id(memberId);
            } else {
                throw new IllegalArgumentException("member_id not found in session.");
            }
			
			// PaymentDto를 데이터베이스에 저장하는 로직
			paymentService.savePayment(paymentDto);

			response.put("success", true);
			response.put("message", "결제 정보가 성공적으로 저장되었습니다.");
			return ResponseEntity.ok(response);

		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "결제 정보 저장에 실패했습니다.");
			return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body(response);
		}

	}

}
