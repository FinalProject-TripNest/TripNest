<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .mypage_wrap {
        max-width: 1000px;
        margin: 0 auto;
        padding: 20px;
    }
    .mypage_info {
        text-align: center;
        margin-bottom: 20px;
    }
    .mypage_info .title {
        font-size: 24px;
        margin-bottom: 10px;
    }
    .mypage_info .journey-info {
        font-size: 16px;
        color: #999;
    }
    .mypage_menu {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-bottom: 40px;
    }
    .mypage_menu ul {
        display: flex;
        list-style: none;
        padding: 0;
    }
    .mypage_menu li {
        margin: 0 10px;
    }
    .mypage_menu a {
        text-decoration: none;
        color: #333;
        font-size: 16px;
    }
    .mypage_menu a:hover {
        color: #000;
    }
    .mypage_content {
        width: 100%;
        display: flex;
        justify-content: center;
    }
    .tabs {
        list-style: none;
        padding: 0;
        display: flex;
        border-bottom: 2px solid #ddd;
    }
    .tabs li {
        margin-right: 20px;
    }
    .tabs li a {
        text-decoration: none;
        color: #333;
        padding: 10px;
        display: block;
    }
    .tabs li a:hover,
    .tabs li.active a {
        color: #000;
        border-bottom: 2px solid #000;
    }
    .reservation-info {
        width: 100%;
        padding: 40px 20px;
        background-color: #f9f9f9;
        text-align: center;
    }
    .reservation-info p {
        margin: 20px 0;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
    }
    .btn:hover {
        background-color: #000;
    }
</style>
<body>
    <div id="wrap">
        <div id="member_myPage" class="mypage_wrap">
            <div class="mypage_info">
                <div class="title">
                    <p>${sessionScope.myname}님 반가워요!</p>
                </div>
                <div class="journey-info" role="link" tabindex="0">
                    <p>2024년 6월부터 0번의 여행을 했어요.</p>
                </div>
            </div>
            <div class="mypage_menu">
                <ul>
                    <li><a href="/mypage/reservation">다가올 예약</a></li>
                    <li><a href="/mypage/reservation/cancel">취소 내역</a></li>
                    <li><a href="/mypage/offlinepass">보유 쿠폰</a></li>
                    <li><a href="/mypage/likestay">관심 스테이</a></li>
                    <li><a href="/mypage/account/edit">회원 정보 수정</a></li>
                    <li><a href="/chat">메시지</a></li>
                    <li><button type="button">1:1 문의</button></li>
                </ul>
            </div>
            <div class="mypage_content">
                <ul class="tabs">
                    <li class="active"><a id="info" href="#">다가올 예약</a></li>
                    <li><a id="history" href="#">이용 완료</a></li>
                </ul>
            </div>
            <div class="reservation-info">
                <p>아직 예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
                <a href="#" class="btn">FIND STAY</a>
            </div>
        </div>
    </div>

<%@ include file="../include/footer.jsp"%>
    
    <script>
    // JavaScript 코드가 필요한 경우 여기에 추가하십시오.
    </script>
</body>
</html>
