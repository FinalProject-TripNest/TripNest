<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .reservation {
        text-align: center;
    }
    .reservation img {
        width: 400px;
        height: auto;
    }
    .reservation p {
        margin: 20px 0;
    }
    .no-reservation {
    	margin: 0 0 100px;
    	border-bottom: 1px solid #ddd;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        margin-top: 20px;
        margin-bottom: 40px;
    }
    .btn:hover {
        background-color: #000;
    }
    .reservation-list {
        text-align: left;
        margin: 20px;
    }
    .reservation-item {
        border-bottom: 1px solid #ddd;
        padding: 20px 0;
    }
    .reservation-item img {
        width: 200px;
        height: auto;
    }
    .reservation-item h3 {
        margin: 0;
        font-size: 18px;
    }
    .reservation-item p {
        margin: 5px 0;
    }
</style>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<div class="reservation">
    <c:if test="${not empty reservations}">
        <div class="reservation-list">
            <c:forEach var="reservation" items="${reservations}">
                <div class="reservation-item">
                    <img src="${reservation.image_photo}" alt="${reservation.room_name}" />
                    <h3>${reservation.room_name}</h3>
                    <p>${reservation.reservation_status}</p>
                    <p>${reservation.reservation_checkin} ~ ${reservation.reservation_checkout}</p>
                    <p>${reservation.reservation_capacity}명</p>
                    <p>₩<fmt:formatNumber value="${reservation.paid_amount}" /></p>
                </div>
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
