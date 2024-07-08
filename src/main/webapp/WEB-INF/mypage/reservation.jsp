<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<div class="reservation">
    <c:if test="${not empty reservations}">
        <div class="reservation-list">
            <c:forEach var="reservation" items="${reservations}">
	            <a href="${root}/find/reservation_success?merchant_uid=${reservation.merchant_uid}">
	                <div class="reservation-item">
	                    <div class="image-container">
	                        <p class="reservation-status">
	                            ${reservation.reservation_status}
	                        </p>
	                        <img src="${reservation.image_photo}" alt="${reservation.room_name}" />
	                    </div>
	                    <div class="reservation-info">
	                        <h3>${reservation.room_name}</h3>
	                        <p>${reservation.reservation_checkin} ~ ${reservation.reservation_checkout}</p>
	                        <p>${reservation.reservation_capacity} 명</p>
	                    </div>
	                    <div class="reservation-price">
	                        ₩ <fmt:formatNumber value="${reservation.paid_amount}" type="currency" currencySymbol="" />
	                    </div>
	                </div>
	            </a>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty reservations}">
        <div class="no-reservation">
            <img alt="" src="${root}/img/mypage/booking-waiting.png">
            <p>아직 예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
            <a href="${root}/find/list" class="btn">FIND NEST</a>
        </div>
    </c:if>
</div>
</body>