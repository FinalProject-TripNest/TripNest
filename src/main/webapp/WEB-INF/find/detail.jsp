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
						<span>title</span>
					</div>
					<div class="data_btn">
						<span>날짜를 선택해주세요.</span> <img alt=""
							src="../../img/main/right_arrow.png">
					</div>
					<a href="../../find/reservation?room_id=${roomdto.room_id}"
						class="payment_btn">결제하기</a>

				</div>
				<div class="main">
					<div class="infomation"></div>
					<div></div>
				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
		//각 페이지 자바스크립트

		//각 페이지 자바스크립트
	</script>
</body>
</html>