package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PaymentDto")
public class PaymentDto {
	
	private int idx;
	private String member_useremail; //사용자 회원 아이디
	private String imp_uid; // 결제 고유 ID : 아임포트(IMP)에서 제공하는 고유 결제 ID
	private String merchant_uid; // 상점 주문 번호 : 상점에서 관리하는 주문 번호
	private int paid_amount; // 결제 금액: 실제로 결제된 금액
	private String pg_provider; // PG사(결제 대행사) 제공자 :  결제를 처리하는 PG사(결제 대행사)
	private String pg_tid; // PG사 거래 ID 
	private String buyer_name; // 구매자 이름 :  결제 시 입력된 구매자의 이름
	private String pay_status; // 결제 상태 -> 기본으로 승인처리 나중에 취소할것 대비하여 컬럼 생성했음
	private Timestamp paid_date;  // 결제시간
	
}
