<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .cancel {
        text-align: center;
    }
    .cancel-list {
        text-align: left;
    }
    .cancel-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 50px;
    }
    .cancel-image-container {
        position: relative;
        margin-right: 20px;
    }
    .cancel-item img {
        width: 250px;
        height: auto;
        border-radius: 8px;
    }
    .cancel-status {
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
    .cancel-info {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
    }
    .cancel-item h3 {
        margin: 0;
        font-size: 18px;
    }
    .cancel-item p {
        margin: 5px 0;
    }
    .cancel-price {
        margin-left: auto;
        font-size: 16px;
        font-weight: bold;
    }
    .no-cancel {
        margin: 0 0 100px;
        border-bottom: 1px solid #ddd;
    }
    .no-cancel img {
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
<div class="cancel">
    <c:choose>
        <c:when test="${not empty cancellations}">
            <div class="cancel-list">
                <c:forEach var="cancellation" items="${cancellations}">
                    <div class="cancel-item">
                        <div class="cancel-image-container">
                        	<p class="cancel-status">
	                            ${cancellation.reservation_status}
	                        </p>
                            <img src="${cancellation.image_photo}" alt="${cancellation.room_name}" />
                        </div>
                        <div class="cancel-info">
                            <h3>${cancellation.room_name}</h3>
                            <p>${cancellation.reservation_checkin} ~ ${cancellation.reservation_checkout}</p>
                            <p>결제취소일 : <fmt:formatDate value="${cancellation.reservation_date}" pattern="yyyy-MM-dd HH:mm" /></p>
                        </div>
                        <div class="cancel-price">
                            ₩ <fmt:formatNumber value="${cancellation.paid_amount}" type="currency" currencySymbol="" />
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-cancel">
                <img alt="" src="${root}/img/mypage/booking-waiting.png">
                <p>아직 취소 내역이 없습니다. 다른 스테이를 찾아보세요.</p>
                <a href="${root}/find/list" class="btn">다른 스테이 찾기</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
