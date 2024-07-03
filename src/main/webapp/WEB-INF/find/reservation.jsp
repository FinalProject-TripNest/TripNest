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
#reservation .center>.title {
	text-align: center;
	padding: 60px 0;
	justify-content: center;
}

#reservation .title2 {
	font-size: 20px;
	line-height: 33px;
	font-weight: 500;
	color: #000;
	border-bottom: 3px solid #000;
	text-transform: uppercase;
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
	margin-bottom: 100px;
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
	position: relative;
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
	padding-left: 20px;
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

#reservation .warning-box {
	display: flex;
	flex-direction: column;
	padding: 20px 0 0 0px;
}

#reservation .warning-icon {
	display: inline-block;
	width: 16px;
	height: 16px;
	line-height: 16px;
	text-align: center;
	font-weight: 700;
	border-radius: 50%;
	background-color: #f08300;
	color: #fff;
	position: relative;
}

#reservation .warning-icon::before {
	content: "!";
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

#reservation .warning-title {
	height: 14px;
	flex-grow: 0;
	margin: 0 0 7px;
	font-family: SpoqaHanSans;
	font-size: 13px;
	line-height: 1.08;
	text-align: left;
	color: #f08300;
}

#reservation .warning-desc {
	padding-top: 5px;
	font-family: SpoqaHanSans;
	font-size: 12px;
	line-height: 1.67;
	text-align: left;
	color: gray;
}

#reservation .select_coupon {
	position: absolute;
	border-radius: 10px;
	background-color: rgb(255, 255, 255);
	box-shadow: rgba(0, 0, 0, 0.25) 0px 0px 16px 0px;
	z-index: 9000;
	top: 60px;
	padding: 20px;
	width: 390px;
	right: 0;
	display: none;
}

#reservation .select_coupon.active {
	display: block;
}

#reservation .select_coupon>div>.title {
	font-size: 18px;
	font-weight: 500;
	text-align: center;
	color: #333;
	padding-bottom: 20px;
}

#reservation .select_coupon .main {
	padding-top: 20px;
	border-top: 1px solid #ddd;
	text-align: center;
}

#reservation .select_coupon .main .on .block {
	text-align: left;
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

#reservation .select_coupon .main .on .block:first-child {
	margin-top: 0
}

#reservation .select_coupon .main .on .block span.btncoupon,
	#reservation .select_coupon .main .on .block span.title, #reservation .select_coupon .main .on .block span.nocount
	{
	border: 1px solid #ddd;
	border-radius: 10px;
	width: 240px;
	padding: 10px;
	color: #333;
}

#reservation .select_coupon .main .on .block span.btncoupon,
	#reservation .select_coupon .main .on .block span.nocount {
	width: 100px;
	text-align: center;
	cursor: pointer;
	background: #000;
	border: 1px solid #000;
	color: #fff;
}

#reservation .select_coupon .main .off {
	color: #333;
}
/* //각 페이지 스타일 */
</style>
<body>


	<div id="wrap">
		<div id="reservation">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title" data-aos="fade-up">
					<a class="title2">BOOKING</a>
				</div>

				<div class="titlebox1">
					<div class="name">${roomsDto.room_name }</div>
					<div class="day" role="presentation">
						<!-- 						<div class="btn_select ">날짜를 선택해주세요. -->
						<!-- 						</div> -->
						${checkin } ~ ${checkout } <span id="numNights"></span>
					</div>
					<div class="price">
						<fmt:formatNumber value="${roomsDto.room_price}" type="currency"
							currencySymbol="₩ " groupingUsed="true" />
					</div>




				</div>

				<div class="detailbox">
					<form action="reservationInfo" method="post" class="bookingfrm">
						<input type="hidden" name="MEMBER_ID" id="MEMBER_ID"
							value="${memberDto.member_id }"> <input type="hidden"
							name="ROOM_ID" id="ROOM_ID" value="${roomsDto.room_id }">
						<input type="hidden" id="merchant_uid" name="merchant_uid"
							value="">
						<div class="frm_tit">Reservations</div>
						<ul class="stay_list">
							<li><div class="tit">예약 스테이</div>
								<div class="cont">${roomsDto.room_name }</div></li>
							<li><div class="tit">예약일</div>
								<div class="cont day">
									<input type="hidden" name="RESERVATION_CHECKIN"
										id="RESERVATION_CHECKIN" value="${checkin }"> <input
										type="hidden" name="RESERVATION_CHECKOUT"
										id="RESERVATION_CHECKOUT" value="${checkout }">
									${checkin } ~ ${checkout } <span id="numNight"></span>
								</div></li>
							<li><div class="tit">이름</div>
								<div class="cont">
									<div class="inpt_inner">
										<input type="text" id="name" class="input-width"
											placeholder="이름" readonly="" value="${memberDto.member_name}">
									</div>
								</div></li>
							<li><div class="tit">휴대전화</div>
								<div class="cont">
									<div class="phone">${memberDto.member_phone}</div>
								</div></li>
							<li><div class="tit">이메일</div>
								<div class="cont">
									<div class="inpt_inner">
										<input type="email" id="email" class="input-width"
											placeholder="이메일" readonly=""
											value="${memberDto.member_useremail}">
									</div>
								</div></li>
							<li><div class="tit">인원</div>
								<div class="cont member ">
									<div class="select">
										<span>성인</span><select class="adult-select" name="adultCount"><option
												value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option>
											<option value="5">5명</option>
											<option value="6">6명</option></select>
									</div>
									<div class="select">
										<span>아동</span><select class="child-select" name="childCount"><option
												value="0">0명</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option></select>
									</div>
									<div class="select">
										<span>영아</span><select class="baby-select" name="babyCount"><option
												value="0">0명</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option></select>
									</div>
									<span>(최대 ${roomsDto.room_max_capacity }명)</span> <span
										class="member_txt"> 아동: 24개월~12세 &nbsp; <br>영아:
										24개월 미만
									</span>
								</div></li>

							<li><div class="tit">이용안내</div>
								<div class="cont">
									<div class="guide">
										<span>숙소 이용규칙</span><br> <br> <span
											style="color: #777; font-size: 14px; line-height: 1.4;">
											트립네스트 숙소는 다른 사람이 실제로 거주하는 집인 경우가 많으므로,<br> 숙소 시설을 소중히
											다뤄주세요.
										</span><br> <br> <br> <span>체크인 및 체크아웃</span><br>
										<br> <span
											style="color: #777; font-size: 14px; line-height: 1.4; display: block;">
											체크인: 오후 3:00 이후<br> 체크아웃: 오전 11:00 전까지<br> 셀프 체크인:
											키패드
										</span>
									</div>
								</div></li>

							<li class="booking-room-options"><div class="tit">동의사항</div>
								<div class="cont">
									<div class="option_select agree_all">
										<div class="tit">
											<label class="check_skin" id="labelSize">
												<div style="display: flex;">
													<input type="checkbox" id="sub_Allagree"
														name="sub_Allagree"> <span class="check-agree-btn"
														style="font-size: 16px;">전체 동의 (필수)</span>
												</div> <br>
												<div class="txt" style="color: #777;">아래 모든 항목에 대한 내용을
													확인했으며, 모두 동의합니다.</div>
											</label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree1"> <input
												type="checkbox" id="sub_agree" name="sub_agree1"> <span
												class="check-agree-btn">인원 규정 (필수)</span>
												<div class="txt">
													예약 인원 초과 입실 및 방문자 출입은 불가합니다. <br> 위반시 환불 없이 즉각 퇴실조치 됨을
													알려드립니다
												</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree2"> <input
												type="checkbox" id="sub_agree" name="sub_agree2"> <span
												class="check-agree-btn">금연 안내 (필수)</span>
												<div class="txt">
													숙소 건물과 숙소 내부에서는 흡연이 금지되어 있습니다. <br> 위반 시 환불 없이 즉각
													퇴실조치됨을 알려드립니다.
												</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree3"> <input
												type="checkbox" id="sub_agree" name="sub_agree3"> <span
												class="check-agree-btn">변상 규정 (필수)</span>
												<div class="txt">숙소 내 가구 및 소품이 파손, 분실, 손상 되었을 경우 해당
													제품의 구매가로 변상비를 청구합니다.</div></label>
										</div>
									</div>
									<div class="option_select agree_each">
										<div class="tit">
											<label class="check_skin" for="sub_agree4"><input
												type="checkbox" id="sub_agree" name="sub_agree4"><span
												class="check-agree-btn">안전 사고 규정 (필수)</span>
												<div class="txt">
													스테이를 이용하며 발생하는 안전사고에 대한 책임은 사용자(보호자)에게 있습니다.<br>숙소 측으로
													민사, 형사상 책임을 제기할 수 없습니다.
												</div></label>
										</div>
									</div>
								</div></li>
							<li><div class="tit">요청사항</div>
								<div class="cont">
									<textarea
										placeholder="사전에 협의되지 않은 상업 목적의 사진/영상 촬영(광고, 쇼핑몰, SNS 마켓 등)과 드론 촬영은 불가합니다. "
										name="RESERVATION_REQUIRE" id="RESERVATION_REQUIRE"></textarea>
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
																		class="_bookings-new_title__HZVPb _bookings-new_full__Ee2PM"
																		id="couponname">사용안함</p>
																</div>
																<img src="../img/reservation/righticon.png"
																	alt="arrow-next">
															</div>
														</div>
													</div>
												</div>
												<div class="select_coupon">
													<div>
														<div class="title">쿠폰</div>
														<div class="main">
															<c:choose>
																<c:when test="${not empty couponDto}">
																	<div class="on">
																		<c:forEach var="coupon" items="${couponDto}">
																			<div class="block">
																				<input type="hidden" name="coupon_id"
																					value="${coupon.couponId}"> <input
																					type="hidden" name="coupon_group_id"
																					value="${coupon.couponGroupId}"> <input
																					type="hidden" name="member_id"
																					value="${coupon.memberId}"> <span
																					class="title"> <span class="discountmoney">${coupon.discountAmount}</span>원
																					쿠폰 <fmt:formatDate value="${coupon.expireDate}"
																						pattern="(~MM/dd)" />
																				</span> <span class="btncoupon" id="applycoupon">적용</span>
																			</div>
																		</c:forEach>
																		<div class="block">
																			<span class="title">쿠폰 사용 안함</span> <span
																				class="nocount" id="applycoupon">적용</span>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="off">
																		<p>사용 가능한 쿠폰이 없습니다.</p>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
										</dd>
									</dl>
									<dl style="overflow: unset;">
										<dt class="total">총 할인 금액</dt>
										<dd class="total">
											<span style="font-size: 20px;" id="discount1">-</span>
										</dd>
									</dl>
								</div></li>
							<li class="total-price-list-wrapper"><div class="tit">예상
									결제 금액</div>
								<div class="cont">
									<dl>
										<dt>
											객실 요금<span class="plus_option"> <fmt:formatNumber
													value="${roomsDto.room_price}" type="currency"
													currencySymbol="₩ " groupingUsed="true" /> * <span
												id="numNightcal"></span>
											</span>
										</dt>
										<dd>
											<span id="totalprice1"></span>
										</dd>
										<dt>할인 금액</dt>
										<dd>
											<span id="discount2">-</span>
										</dd>
										<dt class="total"></dt>
										<dd class="total">
											<input type="hidden" name="RESERVATION_PRICE"
												id="RESERVATION_PRICE" value=""> <span id="pgmoney"></span>
										</dd>
									</dl>
								</div></li>
							<li class="payment-method add-desc-wrapper"><div class="tit"
									id="payType">결제방법 선택</div>
								<div class="cont" id="payType">
									<div class="paymethod_radio Generalpay">
										<label class="radio_skin" for="Generalpay"> <input
											id="Generalpay" type="radio" name="payRadio"
											value="Generalpay" checked="checked"><span>카드
												결제</span>
										</label> <span style="color: #777;">할부는 최대 6개월까지 가능하며, <br>무이자
											할부 조건은 카드사별로 다릅니다.<br>
										</span>
										<div class="warning-box">
											<div class="aman-warning">
												<div class="warning-title">
													<span class="warning-icon"></span>&nbsp;정상적인 결제가 가능한 카드인지 꼭
													확인해 주세요.
												</div>
												<div class="warning-desc">유효기간 만료, 사용한도 초과, 잔액 부족,
													도난/분실 신청, 거래 거절 등의 이유로 결제 불가 시 예약이 취소될 수 있습니다.</div>
												<br>
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
									(주)트립네스트는 예약 시스템 제공 과정에서 예약자 동의 하에 서비스 이용을 위한 예약자 개인정보를 수집하며,
									수집된 개인정보는 제휴 판매자(숙소)에게 제공됩니다.
									<!-- -->
									<br> 정보 주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스
									예약이 제한됩니다.
									<!-- -->
									<br>
									<!-- -->
									<br> - 제공 받는 자 : ${roomsDto.room_name }
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

								</div>
								<li><label class="check_skin" id="booking-agree-check-skin"
									for="refundAgree"><input type="checkbox"
										id="refundAgree" name="chk" class="agree_check"><span>${roomsDto.room_name }<!-- -->
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
			<div class="notification">
				<div class="center">
					<div class="flex">
						<div class="li_title">안내사항</div>
						<ul class="list">
							<li class="btn margin active">예약 안내</li>
							<li class="btn">이용 안내</li>
							<li class="btn">환불 규정</li>
						</ul>
					</div>


					<div class="container">
						<div class="fixed_title">
							<span> 숙소 이용에 대한 상세한 안내를 확인해 보세요.</span>
						</div>
						<div class="tab_view active">
							<div class="tit">예약 안내</div>
							<div class="cont">
								<dl>
									<dt>
										요금 기준
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<table>
											<thead>
												<tr>
													<th>숙소</th>
													<th>인원(기준/최대)</th>
													<th>요금</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${roomsDto.room_name }</td>
													<td>${roomsDto.room_min_capacity }/${roomsDto.room_max_capacity }</td>
													<td><fmt:formatNumber value="${roomsDto.room_price }"
															type="currency" />~</td>
												</tr>
											</tbody>
										</table>
										<ul>
											<li>기준인원 ${roomsDto.room_min_capacity}인이며, 최대인원
												${roomsDto.room_max_capacity}인(영유아 포함)까지 이용 가능한 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										반려 동물
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>반려 동물 동반이 불가한 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										문의하기
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>예약과 이용 문의 ${roomsDto.room_hp }</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>

						<div class="tab_view">
							<div class="tit">이용 안내</div>
							<div class="cont">
								<dl>
									<dt>
										이용 규칙
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>체크인 시간은 오후 3시, 체크아웃 시간은 오전 11시입니다.</li>
											<li>예약하신 당일 오전에, 체크인 안내 문자를 보내드립니다.</li>
											<li>최대인원을 초과하는 인원은 입실이 불가합니다.</li>
											<li>예약인원 외 방문객의 출입을 엄격히 제한합니다.</li>
											<li>미성년자의 경우 보호자(법정대리인)의 동행 없이 투숙이 불가합니다.</li>
											<li>모든 공간에서 절대 금연입니다. 위반 시 특수청소비가 청구됩니다.</li>
											<li>취사 가능한 숙소이나, 연기와 냄새가 나는 음식(고기, 해산물 등)의 조리를 금지합니다.</li>
											<li>침구나 비품, 시설 등에 오염, 파손 및 분실이 발생한 경우 변상비가 청구됩니다.</li>
											<li>협의되지 않은 상업 사진 및 영상 촬영(광고용, 제품사진, 쇼핑몰, SNS마켓 포함), 드론
												촬영은 불가합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										노천탕,
										<!-- -->
										<div class="line-break"></div>
										실내욕조
										<!-- -->
									</dt>
									<dd>
										<ul>
											<li>이용시간 제한 없이 이용하실 수 있습니다.</li>
											<li>동절기(12-3월)에는 날씨에 따라 이용이 어려울 수 있습니다.</li>
											<li>액체, 분말, 거품류의 입욕제 사용이 가능합니다.</li>
											<li>배수의 문제가 발생할 수 있는 입욕 용품(각종 꽃잎, 포프리, 약초 등)의 사용을 제한합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										CCTV
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>안전과 방범을 위해 외부에 CCTV가 설치되어 있는 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										주차
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>건물 뒤편에 ${roomsDto.room_name } 전용 주차장이 마련되어 있습니다.
												주중(월-금) 1대, 주말(토-일) 2대까지 주차 가능합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>
						<div class="tab_view">
							<div class="tit">환불 규정</div>
							<div class="cont">
								<dl>
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
													<td>체크인 10일전까지</td>
													<td>총 결제금액의 100% 환불</td>
												</tr>
												<tr>
													<td>체크인 9일전까지</td>
													<td>총 결제금액의 90% 환불</td>
												</tr>
												<tr>
													<td>체크인 8일전까지</td>
													<td>총 결제금액의 80% 환불</td>
												</tr>
												<tr>
													<td>체크인 7일전까지</td>
													<td>총 결제금액의 70% 환불</td>
												</tr>
												<tr>
													<td>체크인 6일전까지</td>
													<td>총 결제금액의 60% 환불</td>
												</tr>
												<tr>
													<td>체크인 5일전까지</td>
													<td>총 결제금액의 50% 환불</td>
												</tr>
												<tr>
													<td>체크인 4일전까지</td>
													<td>총 결제금액의 40% 환불</td>
												</tr>
												<tr>
													<td>체크인 3일전부터</td>
													<td>변경 / 환불 불가</td>
												</tr>
											</tbody>
										</table>
									</dd>
									<dt>
										숙박권
										<!-- -->
										<div class="line-break"></div>
										양도
										<!-- -->
									</dt>
									<dd>
										<ul>
											<li>숙박권의 재판매를 비롯하여 양도, 양수, 교환을 금지합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
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
		var isChecked = $(this).is(":checked");
		$("input[name^='sub_agree']").prop("checked", isChecked);
	});

	// 개별 동의 체크박스를 클릭했을 때 전체 동의 체크박스의 상태를 변경합니다.
	$("input[name^='sub_agree']")
			.click(
					function() {
						var allChecked = $("input[name^='sub_agree']:checked").length === $("input[name^='sub_agree']").length;
						$("#sub_Allagree").prop("checked", allChecked);
					});

	/*******************************
	 결제 하기
	 ********************************/
	var totalCount;

	$("#money-btn").click(function(e) {
		e.preventDefault(); // 폼 제출 방지
		
		// 전체 동의 체크 여부
		var allAgreeChecked = $("#allAgree").prop("checked");

		// 개별 동의 체크 여부
		var subAllAgreeChecked = $("#sub_Allagree").prop("checked");

		// 성인, 아동, 영아 선택된 인원 수 확인
		var adultCount = parseInt($(".adult-select").val());
		var childCount = parseInt($(".child-select").val());
		var babyCount = parseInt($(".baby-select").val());
		totalCount = adultCount + childCount + babyCount;

		// 조건 확인
		if (allAgreeChecked && subAllAgreeChecked) {
			// 모든 체크박스가 선택된 경우
			if (totalCount > ${roomsDto.room_max_capacity }) {
				// 최대인원 초과인 경우
				alert("최대 인원을 초과하였습니다.");
			} else {
				// 최대인원 이하인 경우
				// 결과를 hidden input에 설정
				reservationPrice = $("#RESERVATION_PRICE").val();
				if(reservationPrice === "0"){
					//alert(reservationPrice);
 					if (confirm("결제하시겠습니까?")) {
					var memberId = $("#MEMBER_ID").val();
					var roomId = $("#ROOM_ID").val();
					var reservationCheckin = $("#RESERVATION_CHECKIN").val();
					var reservationCheckout = $("#RESERVATION_CHECKOUT").val();
					var reservationCapacity = totalCount; // totalCount는 다른 곳에서 정의된 변수로 가정
					var reservationRequire = $("#RESERVATION_REQUIRE").val();
					var memberName=$("#name").val();
					// 고유한 merchantUid 생성
		            var merchantUid = memberName + new Date().getTime();
					$.ajax({
						type: "POST",
						url: "/payment/complete", // 서버의 결제 정보 처리 URL
						contentType: "application/json", // Content-Type 명시
						data: JSON.stringify({
							paymentDto : {
								imp_uid: "", // 빈 값 설정
		                        merchant_uid: merchantUid,
		                        paid_amount: 0,
		                        pg_provider: "",
		                        pg_tid: "",
		                        buyer_name: $("#name").val(),
		                        member_useremail: $("#email").val()
							},
							reservationDto:{
								memberId: memberId,
								roomId: roomId,
								reservationCheckin: reservationCheckin,
								reservationCheckout: reservationCheckout,
								reservationCapacity: reservationCapacity,
								reservationRequire: reservationRequire,
								reservationPrice: totalPrice,
								merchantUid: merchantUid
							},
							//TODO: 쿠폰 id 확인 하기
							useCouponReq: {
								selected: isCouponSelected, //쿠폰 선택여부 전송 boolean
								couponId: selectedCouponId // 선택된 쿠폰 ID 전송
							}
						}),
						success: function(response) {
							// 결제 완료 페이지로 이동
							window.location.href = response.redirectUrl;
						},
						error: function(error) {
							alert(error.responseJSON.message);
							//결제 실패시 디테일 페이지로 이동
							window.location.href = error.responseJSON.redirectUrl;
						}
					});
				
					}	
				} else{
					requestPay(); // 결제 요청 함수 호출
				}
			}
		} else {
			// 어느 하나라도 선택되지 않은 경우
			alert("모든 항목에 동의해주세요.");
		}
	});
	//전역변수 생성
	var selectedCouponId = null;
	var isCouponSelected = false;
	var reservationPrice;
	// 실 결제금액
	var pgMoney;
	//할인 금액
	var discountAmount;
	
	$(document).on('click', '.btncoupon', function() {
        // 부모 요소 .block를 찾고, 그 안의 필요한 요소들을 찾음
        var $block = $(this).closest('.block');
        discountAmount = parseInt($block.find('.discountmoney').text()); // 할인 금액을 정수로 변환하여 가져옴
        var couponId = $block.find('input[name="coupon_id"]').val(); // coupon_id 값

        selectedCouponId = couponId;  // 선택된 쿠폰 ID를 전역 변수에 저장
        isCouponSelected = true;  // 쿠폰이 선택되었음을 표시
        
        //alert(discountAmount + "," + couponId);
        $("#reservation .select_coupon").removeClass("active");
    });

	$(document).on('click', '.nocount', function() {
	    isCouponSelected = false;  // 쿠폰 사용 안함을 선택
	    selectedCouponId = null;  // 선택된 쿠폰 ID를 초기화
	    discountAmount=0;
	    
	    //alert("쿠폰 사용 안함이 선택되었습니다.");
	    $("#reservation .select_coupon").removeClass("active");
	    
	});
	
	$(document).on('click', '#applycoupon', function() {
	    var couponTitle = $(this).closest('.block').find('.title').text();
	    $("#couponname").text(couponTitle);
	    
		 // 클릭된 쿠폰 블록을 찾음
	    var $block = $(this).closest('.block');
		 
		 
		 
	 // 할인 금액이 0이면 '-'을 표시하도록 처리
	    if (discountAmount === 0) {
	        discountAmount = '-';
	        pgMoney=totalPrice;
	    } else {
	    	pgMoney=totalPrice-discountAmount;
	    	
	    	// pgMoney가 0보다 작으면 0으로 설정
	        if (pgMoney < 0) {
	            pgMoney = 0;
	        }
	        // 숫자로 변환 후 포맷팅
	        discountAmount = discountAmount.toLocaleString('ko-KR', {
	            style: 'currency',
	            currency: 'KRW'
	        });
	    }
	    $('#RESERVATION_PRICE').val(pgMoney);
	    
	    pgMoney = pgMoney.toLocaleString('ko-KR', {
            style: 'currency',
            currency: 'KRW'
        });
	    
	    $('#discount1').text(discountAmount); // #discount1에 할인 금액 표시
	    $('#discount2').text(discountAmount); // #discount2에 할인 금액 표시
	    $('#pgmoney').text(pgMoney);

	});
	
	function requestPay() {

		var memberId = $("#MEMBER_ID").val();
		var roomId = $("#ROOM_ID").val();
		var reservationCheckin = $("#RESERVATION_CHECKIN").val();
		var reservationCheckout = $("#RESERVATION_CHECKOUT").val();
		var reservationCapacity = totalCount; // totalCount는 다른 곳에서 정의된 변수로 가정
		var reservationRequire = $("#RESERVATION_REQUIRE").val();
		var merchantUid = $("#merchant_uid").val();
		
		//IMP.request_pay(param, callback) // 결제창 호출
		IMP.init("imp16144603");
		IMP.request_pay({ // param
			pg : "nice",
			pay_method : "card",
			merchant_uid : $("#name").val() + new Date().getTime(),
			name : $(".name").text(),
			amount : $("#RESERVATION_PRICE").val(),
			buyer_email : $("#email").val(),
			buyer_name : $("#name").val(),
			buyer_tel : $(".phone").text().trim(),
			buyer_addr : "",
			buyer_postcode : "",
			display : {
				card_quota : [ 3, 4, 5, 6 ]
				// 3개월, 4개월, 5개월, 6개월 할부 옵션 추가
			}
		}, function(rsp) { // callback
			if (rsp.success) { // 결제 성공 시 로직
				// 결제 성공 시 결제 정보 서버로 전송
				$.ajax({
					type: "POST",
					url: "/payment/complete", // 서버의 결제 정보 처리 URL
					contentType: "application/json", // Content-Type 명시
					data: JSON.stringify({
						paymentDto : {
							imp_uid: rsp.imp_uid,
							merchant_uid: rsp.merchant_uid,
							paid_amount: rsp.paid_amount,
							pg_provider: rsp.pg_provider,
							pg_tid: rsp.pg_tid,
							buyer_name: rsp.buyer_name,
							member_useremail: rsp.buyer_email
						},
						reservationDto:{
							memberId: memberId,
							roomId: roomId,
							reservationCheckin: reservationCheckin,
							reservationCheckout: reservationCheckout,
							reservationCapacity: reservationCapacity,
							reservationRequire: reservationRequire,
							reservationPrice: totalPrice,
							merchantUid: rsp.merchant_uid
						},
						//TODO: 쿠폰 id 확인 하기
						useCouponReq: {
							selected: isCouponSelected, //쿠폰 선택여부 전송 boolean
							couponId: selectedCouponId // 선택된 쿠폰 ID 전송
						}
					}),
					success: function(response) {
						// 결제 완료 페이지로 이동
						window.location.href = response.redirectUrl;
					},
					error: function(error) {
						alert(error.responseJSON.message);
						//결제 실패시 디테일 페이지로 이동
						window.location.href = error.responseJSON.redirectUrl;
					}
				});
			} else { // 결제 실패 시
				console.log(rsp);
				alert("결제를 취소했습니다.");
			}
		});
	}

	$(".notification .center ul li.btn").click(
			function() {
				$(".notification .center ul li.btn")
						.removeClass("active");
				$(this).addClass("active");

				var idx = $(this).index();
				console.log(idx);
				$(this).closest(".center").find(".container .tab_view")
						.removeClass("active");
				$(this).closest(".center").find(".container .tab_view").eq(
						idx).addClass("active");
			});

	$("#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E").click(function(){
		$("#reservation .select_coupon").toggleClass("active");
	});


	$(document).click(function(event) {
		var $target = $(event.target);
		if (!$target.closest('#reservation .select_coupon').length && !$target.closest('#reservation ._bookings-new_coupon_trigger_wrapper__J9j8p ._bookings-new_selector__DJU6E').length) {
			$("#reservation .select_coupon").removeClass("active");
		}
	});

	//String으로 받아온 체크인, 체크아웃 날짜를 윤년을 고려하여 계산하고 몇박인지 출력해줌
	// 체크인과 체크아웃 날짜 문자열
	var checkinString = "${checkin}"; // 예: "2024-06-25"
	var checkoutString = "${checkout}"; // 예: "2024-06-27"

	// 문자열을 Date 객체로 변환
	var checkinDate = new Date(checkinString);
	var checkoutDate = new Date(checkoutString);

	// 윤년 여부 판별 함수
	function isLeapYear(year) {
		return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
	}

	// 날짜 차이 계산 (박수 계산)
	function getNightCount(checkin, checkout) {
		var oneDay = 24 * 60 * 60 * 1000; // 하루를 밀리초로 계산
		var diffDays = Math.round(Math.abs((checkout - checkin) / oneDay));

		// 체크인 날짜의 연도와 체크아웃 날짜의 연도가 다를 경우
		var checkinYear = checkin.getFullYear();
		var checkoutYear = checkout.getFullYear();

		if (checkoutYear > checkinYear) {
			// 체크인 연도의 2월 일 수 계산
			var febDays = isLeapYear(checkinYear) ? 29 : 28; // 윤년 여부에 따른 2월 일 수

			// 체크인 연도의 2월 일수가 diffDays보다 작으면 하루를 빼서 박수를 계산
			if (checkout.getMonth() === 1 && checkout.getDate() === 29) {
				diffDays--;
			}
		}

		return diffDays;
	}


	// 결과를 HTML에 출력
	var diffDays = getNightCount(checkinDate, checkoutDate);
	$("#numNights").text(diffDays+ " 박");
	$("#numNight").text(diffDays+ " 박");
	$("#numNightcal").text(diffDays+ " 박");

	// 서버에서 받아온 객실 요금
	var roomPrice = ${roomsDto.room_price};

	// 총 요금 계산
	var totalPrice = roomPrice * diffDays;

	// 총 요금을 화폐 단위로 포맷하여 HTML에 출력
	var formattedTotalPrice = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalPrice);
	$("#totalprice1").text(formattedTotalPrice);
	$("#pgmoney").text(formattedTotalPrice);
	$('#RESERVATION_PRICE').val(totalPrice);
	


</script>

</body>
</html>