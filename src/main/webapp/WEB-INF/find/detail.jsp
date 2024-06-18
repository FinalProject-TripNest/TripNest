<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>TRIP NEST</title>
<body>


	<div id="wrap">
		<div id="findDetail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title" data-aos="fade-up">
					<a class="title2">Room</a>
				</div>
				<div class="head">
					<div class="title">
						<span>${detailDto.room_name }</span>
					</div>
					<div class="data_btn">
						<span>날짜를 선택해주세요.</span> <img alt=""
							src="../../img/main/right_arrow.png">
					</div>
					<a href="../../find/reservation?room_id=${detailDto.room_id}"
						class="payment_btn">결제하기</a>

				</div>
				<div class="main">
					<div class="infomation">
						<div class="info_title">
							<span>ROOM INFORMATION</span>
						</div>
						<div class="title">
							<span>${detailDto.room_name }</span>
						</div>
						<div class="price">
							<span><fmt:formatNumber value="${detailDto.room_price}"
									type="currency" /></span>
						</div>
						<div class="detail">
							<p>${detailDto.room_detail}</p>
						</div>
						<div class="info">
							<p>기준 인원 ${detailDto.room_min_capacity}명 (최대 인원
								${detailDto.room_max_capacity}명)</p>
						</div>
					</div>
					<div class="slide">
						<div class="detail_slide">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<c:forEach items="${imageDto}" var="image">
										<img alt="" src="${image.image_photo}">
									</c:forEach>
								</div>
							</div>
							<div class="swiper_btn">
								<div class="swiper-button-next btn"></div>
								<div class="swiper-button-prev btn"></div>
							</div>

							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
				<div class="amenities">
					<div class="title">AMENITIES</div>
					<div class="text">
						<p>${detailDto.room_service}</p>
					</div>

				</div>

				<div class="map">${detailDto.room_location}</div>

				<!--//각 페이지 작업 코드  -->
			</div>
			<div class="notification">
				<div class="center">
					<ul>
						<li class="title">안내사항</li>
						<li class="btn margin">예약 안내</li>
						<li class="btn">이용 안내</li>
						<li class="btn">환불 규정</li>
					</ul>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
		var swiper = new Swiper(".detail_slide", {
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			autoplay : {
				disableOnInteraction : false,
				waitForTransition : true,
			},

			loop : false, // 슬라이드 반복 여부
			loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 
		});
	</script>

</body>
</html>