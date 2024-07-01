<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
</style>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<div class="cancel">
    <div class="no-cancel">
        <img alt="" src="../img/mypage/booking-waiting.png">
        <p>아직 예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
        <a href="${root }/find/list" class="btn">FIND NEST</a>
    </div>
</div>
</body>
