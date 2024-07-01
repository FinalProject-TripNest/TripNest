<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .cancel {
        text-align: center;
    }
    .cancel img {
        width: 400px;
        height: auto;
    }
    .cancel p {
        margin: 20px 0;
    }
    .no-cancel {
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
    .cancellation-list {
        text-align: left;
        margin: 20px;
    }
    .cancellation-item {
        border-bottom: 1px solid #ddd;
        padding: 20px 0;
    }
    .cancellation-item img {
        width: 200px;
        height: auto;
    }
    .cancellation-item h3 {
        margin: 0;
        font-size: 18px;
    }
    .cancellation-item p {
        margin: 5px 0;
    }
</style>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<div class="cancel">
    <c:choose>
        <c:when test="${not empty cancellations}">
            <div class="cancellation-list">
                <c:forEach var="cancellation" items="${cancellations}">
                    <div class="cancellation-item">
                        <img src="${cancellation.image_photo}" alt="${cancellation.room_name}" />
                        <h3>${cancellation.room_name}</h3>
                        <p>${cancellation.reservation_status}</p>
                        <p>${cancellation.reservation_date}</p>
                        <p>₩<fmt:formatNumber value="${cancellation.reservation_price}" /></p>
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
