<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .reservation {
        text-align: center;
    }
    .reservation-list {
        text-align: left;
    }
    .reservation-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 50px;
    }
    .image-container {
        position: relative;
        margin-right: 20px;
    }
    .reservation-item img {
        width: 250px;
        height: auto;
        border-radius: 8px;
    }
    .reservation-status {
    	position: absolute;
        top: -35px;
        display: inline-block;
        font-weight: bold;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 12px;
        background-color: #d1d1d1;
        color: #4a4a4a;
    }
    .reservation-info {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
    }
    .reservation-item h3 {
        margin: 0;
        font-size: 18px;
    }
    .reservation-item p {
        margin: 5px 0;
    }
    .reservation-price {
        margin-left: auto;
        font-size: 16px;
        font-weight: bold;
    }
    .no-reservation {
        margin: 0 0 100px;
        border-bottom: 1px solid #ddd;
    }
    .no-reservation img {
        width: 400px;
        height: auto;
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
</style>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<div class="reservation">
    <c:if test="${not empty reservations}">
        <div class="reservation-list">
            <c:forEach var="reservation" items="${reservations}">
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
