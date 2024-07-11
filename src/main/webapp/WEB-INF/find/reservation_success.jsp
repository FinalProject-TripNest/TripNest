<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>TRIP NEST</title>
<style>
/* 각 페이지 스타일 */
#reservation_success #successbox {
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	margin-top: 300px;
	border-radius: 10px;
}

#reservation_success .center {
	padding-bottom: 150px;
}

#reservation_success  div.title {
	border-bottom: 5px solid #000;
	font-size: 18px;
	letter-spacing: 18px;
	font-weight: 700;
	text-transform: uppercase;
	padding: 60px 0;
	text-align: center;
}

#reservation_success  div.content {
	padding: 50px 0;
}

#reservation_success #info {
	max-width: 850px;
	margin: 0 auto;
}

#reservation_success a.hotelimg {
	width: 100%;
	height: 300px;
	margin-top: 40px;
	display: block;
}

#reservation_success a.hotelimg img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#reservation_success  div.hotelname {
	font-size: 30px;
	text-align: center;
	padding-bottom: 40px;
}

#reservation_success .location {
	text-align: center;
	font-size: 20px;
}

#reservation_success .text_box {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

#reservation_success .text_box p {
	display: flex;
	align-items: center;
}

#reservation_success .text_box p  span {
	font-weight: 600;
	width: 84px;
	line-height: 30px;
	display: block;
}

#reservation_success  .complete {
	text-align: center;
	padding-bottom: 40px;
	font-size: 34px;
}

#reservation_success  a.mapconfirm {
    width: 100px;
    height: 40px;
    margin: 0;
    background-color: #000;
    border: 1px solid #000;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
}




/* //각 페이지 스타일 */
</style>
<body>


	<div id="wrap">
		<div id="reservation_success">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="success">
					<div id="successbox" data-aos="flip-left">
						<div id="info">
							<div class="title">Receipt</div>
							<div class="content">
								<div class="complete">예약이 완료되었습니다.</div>
								<div class="hotelname">${roomsDto.room_name}</div>
								<div class="location">
									<span>${roomsDto.room_address}&nbsp;&nbsp;${roomsDto.room_address_detail}</span>
								</div>
								<a href="javascript:;" class="hotelimg"> <img alt=""
									src="${roomimage }">
								</a>
								<div class="text_box">
									<div>
										<p>
											<span>예약번호</span> : ${fn:substring(successDto.merchant_uid, 3, fn:length(successDto.merchant_uid))}
										</p>
										<p>
											<span>예약자 성함</span> : ${successDto.buyer_name}
										</p>
										<p>
											<span>체크인</span> : ${successDto.RESERVATION_CHECKIN} 15:00 이후
										</p>
										<p>
											<span>체크아웃</span> : ${successDto.RESERVATION_CHECKOUT} 11:00 이전
										</p>
										<p>
											<span>결제금액</span> : <fmt:formatNumber value="${successDto.paid_amount}" type="currency"
							currencySymbol="₩ " groupingUsed="true" />
										</p>
										<div style="display: flex; justify-content: center;">
											<a href="${root }/find/list/detail?room_id=${roomsDto.room_id}#amenities" class="mapconfirm" style="margin-top: 30px;">위치 확인</a>
											<a href="javascript:;" id="cancel" class="mapconfirm" style="margin-top: 30px; margin-left: 20px;">예약 취소</a>
											<input type="hidden" id="merchant_uid" value="${param.merchant_uid}">
										</div>
									</div>		
									</div>		
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
		//각 페이지 자바스크립트
		 $(document).ready(function() {
		 	   $("#cancel").click(function() {
		 		   var merchant_uid = $("#merchant_uid").val();
		 		   var paidAmountStr = "${successDto.paid_amount}";
		 		   var paidAmount = parseInt(paidAmountStr, 10);
		 		  
		 		    var currentDate = new Date();
		            var formattedDate = currentDate.toISOString().split('T')[0];
		            
		            // 예약 체크인 날짜
		            var checkinDateStr = "${successDto.RESERVATION_CHECKIN}"; // 예약 체크인 날짜 문자열
		            var checkinDateParts = checkinDateStr.split('-'); // 년, 월, 일 분리
		            var checkinDate = new Date(checkinDateParts[0], checkinDateParts[1] - 1, checkinDateParts[2]); // 월은 0부터 시작하므로 -1

		            // 날짜 차이 계산 (일 단위)
		            var timeDiff = checkinDate.getTime() - currentDate.getTime();
		            var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

		       	  // 환불 비율 계산
		            var refundPercent = 0;
		            if (daysDiff >= 10) {
		                refundPercent = 100;
		            } else if (daysDiff === 9) {
		                refundPercent = 90;
		            } else if (daysDiff === 8) {
		                refundPercent = 80;
		            } else if (daysDiff === 7) {
		                refundPercent = 70;
		            } else if (daysDiff === 6) {
		                refundPercent = 60;
		            } else if (daysDiff === 5) {
		                refundPercent = 50;
		            } else if (daysDiff === 4) {
		                refundPercent = 40;
		            } else {
		                // 3일 전부터는 예약 취소 불가
		                alert("체크인 3일 전부터는 예약 취소가 불가합니다.");
		                return; // 함수 종료
		            }
		            // 환불 금액 계산
		            var refundAmount = (paidAmount * refundPercent) / 100;
		           // 만약 환불 금액이 음수면 0으로 설정
		            if (refundAmount < 0) {
		                refundAmount = 0;
		            }
		           
		            // 환불 금액이 0인 경우와 아닌 경우에 따라 다른 메시지 설정
		            var confirmMessage;
		            if (refundAmount === 0) {
		                confirmMessage = "취소 할 경우 이벤트 쿠폰은 복구되지 않습니다.\n";
		            } else {
		                confirmMessage = "현재 날짜: " + formattedDate + "\n";
		                confirmMessage += "체크인 날짜: " + checkinDateStr + "\n";
		                confirmMessage += "체크인 " + daysDiff + "일 전: " + refundPercent + "% 공제\n";
		                confirmMessage += "환불 금액: " + refundAmount + "원\n";
		            }
		            confirmMessage += "정말로 취소하시겠습니까?";

		 		   if (confirm(confirmMessage)) {
		 		  $.ajax({
						type: "POST",
						url: "/payment/cancel", // 서버의 결제 정보 처리 URL
						contentType: "application/json", // Content-Type 명시
						data: JSON.stringify({
							merchant_uid: merchant_uid, // merchant_uid 전송
							amount: refundAmount
						}),
						success: function(response) {
							// 취소 완료시
							alert("취소가 완료되었습니다.");
							window.location.href = "${root}/index"; // 취소 완료 시 이동할 페이지
						},
						error: function(error) {
							alert(error.responseJSON.message);
						}
					});
		 		   }
		 	   });
    });
		//각 페이지 자바스크립트
	</script>
</body>
</html>