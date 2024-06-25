<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .reservation {
        text-align: center;
    }
    .tabs {
        justify-content: flex-start;
        list-style: none;
    }
    .tabs ul {
        display: flex;
        padding: 0;
        margin: 0;
    }
    .tabs li {
        margin: 0 10px;
    }
    .tabs li a {
        text-decoration: none;
        color: #333;
        font-size: 18px;
        padding: 10px;
        display: block;
    }
    .tabs li a:hover,
    .tabs li.active a {
        color: #000;
        border-bottom: 1px solid #000;
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
</style>
<body>
<div class="reservation">
    <div class="tabs">
        <ul>
            <li><a href="#" class="active">다가올 예약</a></li>
            <li><a href="#">이용 완료</a></li>
        </ul>
    </div>
    <div class="no-reservation">
        <img alt="" src="../img/mypage/booking-waiting.png">
        <p>아직 예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
        <a href="#" class="btn">FIND STAY</a>
    </div>
</div>
</body>
</html>
