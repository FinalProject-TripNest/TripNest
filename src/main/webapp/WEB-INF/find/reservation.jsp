<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<title>TRIP NEST</title>
<style>
/* 각 페이지 스타일 */
#reservation .title {
	font-size: 18px;
	letter-spacing: 14px;
	color: #000;
	font-weight: bold;
	padding: 70px 0px;
}

#reservation .titlebox {
	text-align: center;
}

#reservation .titlebox1 {
	padding-top: 10px;
	border-bottom: 2px solid #ddd;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 60px;
}

#reservation .titlebox1 .name, #reservation .titlebox1 .price {
	font-size: 26px;
	font-weight: 400;
	color: #000;
}

#reservation .titlebox1 .day {
	font-size: 17px;
	color: #000;
	cursor: pointer;
	padding: 0 23px 0 0;
	/*     background: #fff url(/web/images/arw_select.png) no-repeat 100% 50%; */
	/*     background-size: 20px 20px; */
}

#reservation .titlebox1 .day span {
	margin-left: 7px;
	padding-left: 7px;
	border-left: 1px solid #ddd;
	font-size: 16px;
}

#reservation .detailbox {
	margin-top: 50px;
	border: 1px solid #e0e0e0;
	padding: 100px 20px 60px;
}

#reservation .detailbox .bookingfrm {
	max-width: 850px;
	margin: 0 auto;
}

#reservation .detailbox .bookingfrm .frm_tit {
	border-bottom: 5px solid #000;
	font-size: 18px;
	letter-spacing: 18px;
	font-weight: 700;
	text-transform: uppercase;
	padding-bottom: 50px;
	text-align: center;
	font-family: Abel;
}

#reservation .stay_list>li {
	border-bottom: 1px solid #e6e6e6;
	display: flex;
	-ms-flex-align: center;
	-ms-flex-pack: justify;
	padding: 20px 0;
	line-height: 16px;
}

#reservation .stay_list>li>div:first-child {
	min-width: 40%;
}

#reservation .stay_list>li .tit {
	font-size: 12px;
	padding-top: 2px;
	display: flex; /* Flexbox를 사용하여 수직 가운데 정렬을 설정합니다. */
	align-items: center; /* 수직 가운데 정렬을 수행합니다. */
}

#reservation .stay_list>li .cont {
	width: 62%;
	font-size: 16px;
	position: relative;
}

#reservation .stay_list .input-width {
	width: 300px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #e5e5e5;
	background-color: #f2f2f2;
	color: gray;
}

#reservation input[type="text"] {
	padding-block: 10px;
	padding-inline: 10px;
}

#reservation input[type="email"] {
	padding-block: 10px;
	padding-inline: 10px;
}

#reservation .detailbox .bookingfrm .stay_list>li .cont.day span {
	margin-left: 7px;
	padding-left: 7px;
	border-left: 1px solid #ddd;
	font-size: 16px;
}

#reservation .stay_list>li .cont .phone {
	display: flex;
	align-items: center;
	gap: 20px;
	width: 300px;
	justify-content: space-between;
	font-size: 14px;
}

#reservation .stay_list .cont.member .select {
	display: inline-block;
	margin: -10px 15px -10px 0;
	font-size: 14px;
}

#reservation .stay_list select {
	height: 38px;
	border: 1px solid #e5e5e5;
	border-radius: 5px;
	font-size: #bbb;
	/*     background: url(/web/images/arw_selectbox.png) no-repeat 100% 50%; */
	/*     background-size: 30px 20px; */
	padding: 0 5px 0 5px;
	margin-left: 10px;
}

#reservation .stay_list .member_txt {
	position: absolute;
	right: 0;
	top: -8px;
	font-size: 12px;
	color: #999;
	line-height: 1.5;
}

#reservation .stay_list .option_select .tit {
	font-size: 16px;
	color: #000;
	margin: 0 0 15px;
}

#reservation .stay_list .option_select .txt {
	font-size: 14px;
	color: #333;
	line-height: 1.7;
}

#reservation .stay_list .sel_option {
	margin-top: 20px;
	float: left;
}

#reservation .stay_list .cont .sel_option>.desc {
	font-size: 14px;
	color: #000;
	display: inline-block;
	margin: 6px 20px 0 0;
}

#reservation .stay_list .sel_option .check_skin, .payment_list .sel_option .radio_skin
	{
	margin-top: 5px;
}

#reservation .check_skin {
	display: inline-block;
	position: relative;
	vertical-align: top;
	overflow: hidden;
	cursor: pointer;
	margin-right: 20px;
}

#reservation .check_skin input+span {
	display: inline-block;
	padding-bottom: 2px;
	position: relative;
	padding-left: 10px;
	font-size: 14px;
	line-height: 16px;
	z-index: 3;
}

#reservation .stay_list .option_select {
	margin-bottom: 70px;
}

#reservation #labelSize {
	display: flex;
	border-radius: 5px;
	background: #fafafa;
	border: 1px solid #e6e6e6;
	align-items: flex-start;
	padding: 20px;
	cursor: pointer;
	margin-right: 0;
	flex-direction: column;
	width: 100%;
}

#reservation .option_select.agree_each .tit .txt {
	color: #777;
	margin-top: 20px;
}

#reservation .stay_list textarea {
	border: 1px solid #e5e5e5;
	width: 100%;
	height: 150px;
	border-radius: 5px;
}

#reservation textarea {
	font-size: 15px;
	color: #000;
	line-height: 1.4;
	padding: 15px;
	resize: none;
	font-family: SpoqaHanSans;
}

#reservation .stay_list textarea::placeholder {
	color: #d3d3d3;
	font-weight: 300;
	font-family: SpoqaHanSans;
	font-size: 13px;
}

#reservation .stay_list>li .cont dl {
	font-size: 13px;
	color: #999;
	overflow: hidden;
}

#reservation .stay_list>li #payType {
	font-size: 13px;
	line-height: 26px;
}

#reservation .stay_list>li #payType .Generalpay label {
	display: flex;
	align-items: center;
}

#reservation .stay_list>li #payType .Generalpay label input {
	margin-right: 4px;
}

#reservation .stay_list>li .cont dt {
	clear: both;
	float: left;
	padding: 4px 0;
}

#reservation .stay_list>li .cont dd {
	float: right;
	text-align: right;
	padding: 4px 0;
}

#reservation .css-1ayjtrs {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
}

#reservation .stay_list>li .cont dt.total {
	color: #000;
	margin-top: 20px;
}

#reservation .stay_list>li .cont dd.total {
	color: #000;
	font-size: 24px;
	font-weight: 500;
	margin-top: 15px;
}

#reservation .stay_list>li .cont dt .plus_option {
	color: #000;
	display: inline-block;
	margin-left: 10px;
	word-break: break-word;
}

#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_trigger__jzPQT
	{
	position: absolute;
	width: 100%;
	height: 100%;
}

#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E
	{
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: #333;
	font-size: 14px;
	padding: 8px 12px;
	border-radius: 5px;
	border: 1px solid #e5e5e5;
	max-width: calc(( 100vw - 40px)* .75);
	margin: -14px 0 0;
	width: 280px;
	height: 40px;
	cursor: pointer;
}

#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E ._bookings-new_coupon_title__PlGl_
	{
	display: flex;
	align-items: center;
	gap: 5px;
}

#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E ._bookings-new_title__HZVPb._bookings-new_full__Ee2PM
	{
	max-width: 235px;
}

#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E ._bookings-new_title__HZVPb
	{
	max-width: 178px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: normal;
}

#reservation img {
	vertical-align: middle;
	border: 0;
	height: 12px;
	width: 12px;
}

#reservation .agree_box .agree_tit {
	font-size: 20px;
	font-weight: 500;
	color: #363636;
	text-align: center;
	padding: 80px 0 40px;
}

#reservation .agree_box .board_fold li.agree_all {
	background: #f5f5f5;
	border: none;
	height: 55px;
	display: flex;
	align-items: center;
}

#reservation .agree_box .board_fold li {
	padding: 0 0 0 20px;
	border-bottom: 1px solid #ddd;
	display: flex;
	align-items: center;
	cursor: pointer;
	position: relative;
}

#reservation .agree_box .board_fold li img.arrow_btn {
	width: 12px;
	position: absolute;
	right: 20px;
	transition: all 0.3s ease-in-out;
}

#reservation .agree_box .board_fold li img.arrow_btn.active {
	transform: rotate(180deg);
}

#reservation .agree_box .board_fold li.active {
	
}

#reservation .agree_box .board_fold li.active {
	border-bottom: 1px solid #fff;
}

#reservation .agree_box .board_fold  .view {
	padding: 20px;
	background: #fbfbfb;
	font-size: 12px;
	line-height: 24px;
	background: #fbfbfb;
	font-size: 12px;
	font-size: 12px;
}

#reservation .agree_box .board_fold  .view {
	display: none;
}

#reservation .agree_box .board_fold  .view.active {
	display: block;
}

#reservation #booking-agree-check-skin {
	position: absolute;
}

#reservation.agree_box .check_skin {
	top: 0;
	z-index: 1;
	display: inline-block;
}

#reservation .check_skin {
	vertical-align: top;
	overflow: hidden;
	cursor: pointer;
	margin-right: 20px;
}

#reservation .agree_box .board_fold li>.tit {
	height: 55px;
	display: flex;
	align-items: center;
	padding: 0;
}

#reservation .board_fold li>.tit {
	padding: 23px 50px 23px 0;
	cursor: pointer;
	font-size: 16px;
	line-height: 1.4;
	position: relative;
}

#reservation .sales-intermediary {
	color: #333;
	font-size: 14px;
	line-height: 1.67;
	padding: 10px 57px;
	text-align: center;
	letter-spacing: -.1px;
}

#reservation .booking_wrap .bt_btns {
	padding-top: 40px;
}

#reservation .bt_btns {
	display: flex;
	display: -ms-flexbox;
	justify-content: space-between;
	padding: 30px 0;
	width: 420px;
	font-family: Abel, SpoqaHanSans;
	text-align: center;
	margin: 0 auto;
}

#reservation .bt_btns button:first-child {
	margin-left: 0;
}

#reservation .bt_btns button {
	flex: 1 1;
	margin-left: 10px;
	height: 55px;
	font-size: 16px;
	display: block;
}

#reservation .btn_bk {
	background: #000;
	border: 1px solid #000;
	cursor: pointer;
}

#reservation .btn_bk, .btn_bk_display {
	color: #fff;
	display: block;
}

#reservation .agree_box .board_fold .refund {
	display: flex;
}

#reservation .booking_faq .faq_cont .tab_view dl dt {
	width: 10%;
	clear: both;
	float: left;
	font-size: 16px;
	color: #ccc;
	line-height: 28px;
	padding-bottom: 30px;
}

#reservation  table {
	width: 700px;
}

#reservation  table tr, th, td {
	vertical-align: middle;
	text-align: center;
	border: 1px solid #444;
	width: 50%;
	text-align: center;
	height: 36px;
}

#reservation  table td {
	color: #888;
}

/* //각 페이지 스타일 */
</style>
<body>


	<div id="wrap">
		<div id="reservation">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="titlebox">
					<div class="title">BOOKING</div>
				</div>

				<div class="titlebox1">
					<div class="name">서촌영락재</div>
					<div class="day" role="presentation">
						<!-- 						<div class="btn_select ">날짜를 선택해주세요. -->
						<!-- 						</div> -->
						2024. 07. 01 - 2024. 07. 02 <span>1 박</span>
					</div>
					<div class="price">₩350,000</div>




				</div>

				<div class="detailbox">
					<form action="insert" method="post" class="bookingfrm">
						<div class="frm_tit">Reservations</div>
						<ul class="stay_list">
							<li><div class="tit">예약 스테이</div>
								<div class="cont">서촌영락재</div></li>
							<li><div class="tit">예약일</div>
								<div class="cont day">
									2024-07-08 ~ 2024-07-09<span>1 박</span>
								</div></li>
							<li><div class="tit">이름</div>
								<div class="cont">
									<div class="inpt_inner">
										<input type="text" id="name" class="input-width"
											placeholder="이름을 입력해 주세요." readonly="" value="손범수">
									</div>
								</div></li>
							<li><div class="tit">휴대전화</div>
								<div class="cont">
									<div class="phone">
										01053451881
										<!-- 										<button type="button" class="btn_bk btn_new" -->
										<!-- 											style="width: fit-content; white-space: nowrap; padding: 0px 8px; margin: 0px;">변경하기</button> -->
									</div>
								</div></li>
							<li><div class="tit">이메일</div>
								<div class="cont">
									<div class="inpt_inner">
										<input type="email" id="email" class="input-width"
											placeholder="@까지 정확하게 입력하세요." readonly=""
											value="ssoo9271@nate.com">
									</div>
								</div></li>
							<li><div class="tit">인원</div>
								<div class="cont member ">
									<div class="select">
										<span>성인</span><select class="adult-select"><option
												value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option>
											<option value="5">5명</option>
											<option value="6">6명</option></select>
									</div>
									<div class="select">
										<span>아동</span><select class="child-select"><option
												value="0">0명</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option></select>
									</div>
									<div class="select">
										<span>영아</span><select class="baby-select"><option
												value="0">0명</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option></select>
									</div>
									<span>(최대 6명)</span> <span class="member_txt"> 아동:
										24개월~12세 &nbsp; <br>영아: 24개월 미만
									</span>
								</div></li>
							<li class="booking-room-options"><div class="tit">옵션</div>
								<div class="cont">
									<div class="option_select">
										<div class="tit">인원규정</div>
										<div class="txt">예약 인원 초과 입실 및 방문자 출입은 불가합니다. 위반시 환불 없이
											즉각 퇴실조치 됨을 알려드립니다.</div>
										<div class="sel_option">
											<div class="desc">필수</div>
											<label class="check_skin" for="817"><input
												type="checkBox" id="817" value="agree"
												data-gtm-form-interact-field-id="0"><span
												class="check-agree-btn">동의</span></label>
										</div>
									</div>
									<div class="option_select">
										<div class="tit">흡연안내</div>
										<div class="txt">
											누마루와 마당에서 편안하게 흡연을 즐기실 수 있습니다.(사랑방쪽 분합문은 닫아주세요)<br>누마루와
											마당을 제외한 모든 공간에서의 흡연을 절대 금합니다.
										</div>
										<div class="sel_option">
											<div class="desc">필수</div>
											<label class="check_skin" for="818"><input
												type="checkBox" id="818" value="agree"
												data-gtm-form-interact-field-id="1"><span
												class="check-agree-btn">동의</span></label>
										</div>
									</div>
									<div class="option_select">
										<div class="tit">변상안내</div>
										<div class="txt">
											숙소 내 가구 및 비품이 파손, 분실, 손상 되었을 경우 해당 제품의 구매가로 변상비를 청구합니다.<br>
											<br>창호지와 종이장판 손상은 부위당 2만원입니다
										</div>
										<div class="sel_option">
											<div class="desc">필수</div>
											<label class="check_skin" for="819"><input
												type="checkBox" id="819" value="agree"
												data-gtm-form-interact-field-id="2"><span
												class="check-agree-btn">동의</span></label>
										</div>
									</div>
								</div></li>
							<li class="booking-room-options"><div class="tit">동의사항</div>
								<div class="cont">
									<div class="option_select agree_all">
										<div class="tit">
											<label class="check_skin" for="sub_Allagree" id="labelSize">
												<div style="display: flex;">
													<input type="checkbox" id="sub_Allagree"
														name="sub_Allagree" data-gtm-form-interact-field-id="3">
													<span class="check-agree-btn" style="font-size: 16px;">전체
														동의 (필수)</span>
												</div> <br>
												<div class="txt" style="color: #777;">아래 모든 항목에 대한 내용을
													확인했으며, 모두 동의합니다.</div>
											</label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree1"><input
												type="checkbox" id="sub_agree" name="sub_agree1"><span
												class="check-agree-btn">인원 규정 (필수)</span>
												<div class="txt">
													예약인원 외 방문객의 출입을 엄격히 제한합니다. <br> <br>위반 시 환불 없이 즉각
													퇴실 조치됨을 안내드립니다.
												</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree2"><input
												type="checkbox" id="sub_agree" name="sub_agree2"><span
												class="check-agree-btn">흡연 안내 (필수)</span>
												<div class="txt">
													누마루와 마당에서는 흡연이 가능합니다. (단, 사랑방과 연결되는 분합문을 닫은 상태에서 이용해 주시기
													바랍니다.)<br> <br>누마루를 제외한 모든 공간에서의 흡연을 절대 금합니다.
												</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree3"><input
												type="checkbox" id="sub_agree" name="sub_agree3"><span
												class="check-agree-btn">변상 규정 (필수)</span>
												<div class="txt">
													숙소 내 가구 및 소품이 파손, 분실, 손상 되었을 경우 해당 제품의 구매가로 변상비를 청구합니다.<br>
													<br>한옥 특성상 창호지와 종이장판 훼손 및 오염시 부분 복구가 어렵습니다. 창호지와 장판
													훼손(구멍, 찍힘 등) 시에는 각 부분별 20,000원의 파손 비용이 발생하오니 꼭 유념 부탁드립니다.
												</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="room-agree-3209"><input
												type="checkbox" id="room-agree-3209" name="room-agree-3209"><span
												class="check-agree-btn">안전 사고 규정 (필수)</span>
												<div class="txt">
													스테이를 이용하며 발생하는 안전사고에 대한 책임은 사용자(보호자)에게 있습니다.<br> <br>숙소
													측으로 민사, 형사상 책임을 제기할 수 없습니다.
												</div></label>
										</div>
									</div>
								</div></li>
							<li><div class="tit">요청사항</div>
								<div class="cont">
									<textarea
										placeholder="사전에 협의되지 않은 상업 목적의 사진/영상 촬영(광고, 쇼핑몰, SNS 마켓 등)과 드론 촬영은 불가합니다. "
										name="comment"></textarea>
								</div></li>
							<li><div class="tit">할인 혜택</div>
								<div class="cont">
									<dl class="_bookings-new_coupon_trigger_wrapper__J9j8p"
										style="padding-top: 10px;">
										<dt>쿠폰 할인</dt>
										<dd>
											<div>
												<div class="css-1ayjtrs">
													<div class="css-13cz8p3">
														<div class="_bookings-new_coupon_trigger_container__dACyr">

															<div class="_bookings-new_selector__DJU6E">
																<div class="_bookings-new_coupon_title__PlGl_">
																	<p
																		class="_bookings-new_title__HZVPb _bookings-new_full__Ee2PM">사용안함</p>
																</div>
																<img src="../img/reservation/righticon.png"
																	alt="arrow-next">
															</div>
														</div>
													</div>
												</div>
											</div>
										</dd>
									</dl>
									<dl style="overflow: unset;">
										<dt class="total">총 할인 금액</dt>
										<dd class="total">₩30,000</dd>
									</dl>
								</div></li>
							<li class="total-price-list-wrapper"><div class="tit">예상
									결제 금액</div>
								<div class="cont">
									<dl>
										<dt>
											객실 요금<span class="plus_option">서촌영락재
												&nbsp;&nbsp;₩350,000 * 1 박</span>
										</dt>
										<dd>₩350,000</dd>
										<dt>할인 금액</dt>
										<dd>₩30,000</dd>
										<dt class="total"></dt>
										<dd class="total">
											<input type="hidden" name="RESERVATION_PRICE"
												id="RESERVATION_PRICE" value="100">₩320,000
										</dd>
									</dl>
								</div></li>
							<li class="payment-method add-desc-wrapper"><div class="tit"
									id="payType">결제방법 선택</div>
								<div class="cont" id="payType">
									<div class="paymethod_radio Generalpay">
										<label class="radio_skin" for="Generalpay"><input
											id="Generalpay" type="radio" name="payRadio"
											value="Generalpay"><span>일반 결제</span></label>
									</div>
									<div class="generalpay_list">
										<ul>
											<li role="presentation" class="general on"></li>
											<li role="presentation" class="toss"></li>
											<li role="presentation" class="npay"></li>
											<li role="presentation" class="kakaopay"></li>
											<li role="presentation" class="paypal"></li>
										</ul>
										<div class="_bookings-new_event_container__tHdnW">
											<div class="_bookings-new_container__OO9ok">
												<div class="_bookings-new_title__HZVPb">최대 7개월 무이자 할부
													가능</div>
												<div
													class="_bookings-new_title__HZVPb _bookings-new_small__0F24K">(50,000원
													* 7개월)</div>
												<div class="_bookings-new_paymethod_guide__baVu0">
													<div class="_bookings-new_link__lt20h" role="presentation">무이자
														/ 부분 무이자 할부 혜택 안내 &gt;</div>
												</div>
											</div>
										</div>
									</div>
								</div></li>
						</ul>

						<div class="agree_box">
							<div class="agree_tit">사용자 약관 동의</div>
							<ul class="board_fold" id="listFold">
								<li class="agree_all"><label class="check_skin"
									id="booking-agree-check-skin" for="allAgree"> <input
										type="checkbox" id="allAgree"
										data-gtm-form-interact-field-id="0" name="chk"> <span>사용자
											약관 전체 동의</span></label></li>
								<li><label class="check_skin" id="booking-agree-check-skin"
									for="privacyAgree"><input type="checkbox"
										id="privacyAgree" name="chk" class="agree_check"><span>개인정보
											제 3자 제공 동의 (필수)</span></label>
									<div class="tit" role="presentation"></div> <img alt=""
									src="../img/reservation/bottomicon.png" class="arrow_btn">
								</li>
								<div class="view ">
									(주)스테이폴리오는 예약 시스템 제공 과정에서 예약자 동의 하에 서비스 이용을 위한 예약자 개인정보를 수집하며,
									수집된 개인정보는 제휴 판매자(숙소)에게 제공됩니다.
									<!-- -->
									<br> 정보 주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스
									예약이 제한됩니다.
									<!-- -->
									<br>
									<!-- -->
									<br> - 제공 받는 자 : 모여집
									<!-- -->
									<br> - 제공 목적: 제휴 판매자(숙소)와 이용자(회원)의 예약에 대한 서비스 제공, 계약의
									이행(예약확인, 이용자 확인), 민원 처리 등 소비자 분쟁 해결을 위한 기록 보존
									<!-- -->
									<br> - 제공 정보: 예약번호, 아이디, 성명, 휴대전화 번호, 이메일, 인원 정보, 생년월일(필요한
									경우), 동행 투숙객 정보(필요한 경우)
									<!-- -->
									<br> - 보유 및 이용 기간 : 5년
									<!-- -->
									<br>
								</div>
								<li><label class="check_skin" id="booking-agree-check-skin"
									for="teenagerAgree"><input type="checkbox"
										id="teenagerAgree" name="chk" class="agree_check"><span>미성년자(청소년)
											투숙 기준 동의 (필수)</span></label>
									<div class="tit" role="presentation"></div> <img alt=""
									src="../img/reservation/bottomicon.png" class="arrow_btn"></li>
								<div class="view ">
									스테이 소재지 : 대한민국
									<!-- -->
									<br> 1. 만 19세 미만 미성년자(청소년)의 경우 예약 및 투숙이 불가합니다.
									<!-- -->
									<br> 2. 만 19세 미만 미성년자(청소년)가 투숙을 원하는 경우 보호자(법정대리인)가 필수 동행해야
									합니다.
									<!-- -->
									<br> 3. 이용일 당일 미성년자(청소년) 투숙 기준 위반이 확인되는 경우 환불없이 퇴실 조치됩니다.
									<!-- -->
									<br> <br> 스테이 소재지 : 대한민국 외
									<!-- -->
									<br> 1. 스테이가 위치한 국가/지역에 따라 미성년자(청소년)로 간주되는 경우 예약 및 투숙이
									불가합니다.
									<!-- -->
									<br> 2. 미성년자(청소년)가 투숙을 원하는 경우 보호자(법정대리인)가 필수 동행해야 합니다.
									<!-- -->
									<br> 3. 이용일 당일 미성년자(청소년) 투숙 기준 위반이 확인되는 경우 환불없이 퇴실 조치됩니다.
									<!-- -->
									<br>
								</div>
								<li><label class="check_skin" id="booking-agree-check-skin"
									for="refundAgree"><input type="checkbox"
										id="refundAgree" name="chk" class="agree_check"><span>모여집<!-- -->
											- <!-- -->환불규정에 대한 동의 (필수)<!-- --></span></label>
									<div class="tit" role="presentation"></div> <img alt=""
									src="../img/reservation/bottomicon.png" class="arrow_btn"></li>
								<div class="booking_faq view ">
									<div class="faq_cont">
										<div class="tab_view active">
											<div class="cont">
												<dl class="refund">
													<dt>환불 규정</dt>
													<dd>
														<table>
															<thead>
																<tr>
																	<th>기준일</th>
																	<th>환불 금액</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>체크인 10일 전까지</td>
																	<td>총 결제금액의 100% 환불</td>
																</tr>
																<tr>
																	<td>체크인 9일 전까지</td>
																	<td>총 결제금액의 90% 환불</td>
																</tr>
																<tr>
																	<td>체크인 8일 전까지</td>
																	<td>총 결제금액의 80% 환불</td>
																</tr>
																<tr>
																	<td>체크인 7일 전까지</td>
																	<td>총 결제금액의 70% 환불</td>
																</tr>
																<tr>
																	<td>체크인 6일 전까지</td>
																	<td>총 결제금액의 60% 환불</td>
																</tr>
																<tr>
																	<td>체크인 5일 전까지</td>
																	<td>총 결제금액의 50% 환불</td>
																</tr>
																<tr>
																	<td>체크인 4일 전까지</td>
																	<td>총 결제금액의 40% 환불</td>
																</tr>
																<tr>
																	<td>체크인 3일 전부터</td>
																	<td>변경/환불 불가</td>
																</tr>
															</tbody>
														</table>
													</dd>


												</dl>
											</div>
										</div>
									</div>
								</div>
							</ul>
						</div>
						<div class="bt_btns">
							<button type="submit" class="btn_bk" id="money-btn">결제하기</button>
						</div>

						<div class="sales-intermediary">(주) 트립네스트는 통신판매중개업자로서 통신판매의
							당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 호스트에게 있습니다. 예약 전 각 스테이의
							이용규칙, 취소 및 환불 규정을 반드시 확인 하시기 바랍니다.</div>
					</form>
				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
	<script>
		// 클릭할 때마다 active 클래스를 토글합니다.
		$("#reservation .agree_box .board_fold li").click(function(e) {
			// 클릭된 요소가 체크박스가 아닐 때만 실행합니다.
			if (!$(e.target).is("input[type=checkbox]")) {
				$(this).next(".view").toggleClass("active");
				$(this).toggleClass("active");
			}

			$(this).children(".arrow_btn").toggleClass("active");
		});

		// 전체 동의 체크박스를 클릭했을 때 모든 개별 동의 체크박스를 선택 또는 해제합니다.
		$("#allAgree").click(function() {
			if ($(this).is(":checked")) {
				$("input[name=chk]").prop("checked", true);
			} else {
				$("input[name=chk]").prop("checked", false);
			}
		});

		// 개별 동의 체크박스를 클릭했을 때 전체 동의 체크박스의 상태를 변경합니다.
		$(".agree_check").click(function() {
			if ($(".agree_check:checked").length === $(".agree_check").length) {
				$("#allAgree").prop("checked", true);
			} else {
				$("#allAgree").prop("checked", false);
			}
		});
		
		//**********************************************************************
		// 전체 동의 체크박스를 클릭했을 때 모든 개별 동의 체크박스를 선택 또는 해제합니다.
		$("#sub_Allagree").click(function() {
			if ($(this).is(":checked")) {
				$("#sub_agree").prop("checked", true);
			} else {
				$("#sub_agree").prop("checked", false);
			}
		});

		// 개별 동의 체크박스를 클릭했을 때 전체 동의 체크박스의 상태를 변경합니다.
		$("#sub_agree").click(function() {
			if ($("#sub_agree:checked").length === $("#sub_agree").length) {
				$("#sub_Allagree").prop("checked", true);
			} else {
				$("#sub_Allagree").prop("checked", false);
			}
		});
		
		
		/*******************************
		결제 하기
		********************************/
		$("#money-btn").click(function(e){
		    e.preventDefault(); // 폼 제출 방지
		    requestPay();
		});
		
		function requestPay() {
		    //IMP.request_pay(param, callback) // 결제창 호출
		    IMP.init("imp16144603");
		    IMP.request_pay({ // param
		        pg: "html5_inicis",
		        pay_method: "card",
		        merchant_uid: $("#name").val() + new Date().getTime(),
		        name: $(".name").text(),
		        amount: $("#RESERVATION_PRICE").val(),
		        buyer_email: $("#email").val(),
		        buyer_name: $("#name").val(),
		        buyer_tel: $(".phone").text().trim(),
		        buyer_addr: "",
		        buyer_postcode: ""
		    }, function (rsp) { // callback
		        if (rsp.success) { // 결제 성공 시 로직
		        	$(".bookingfrm").submit(); // 폼 제출
		        } else { // 결제 실패 시
		            alert("결제를 취소했습니다.");
		            console.log(rsp);
		            $(".bookingfrm").submit(); // 폼 제출
		        }
		    });
		}

	</script>

</body>
</html>