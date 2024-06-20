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
<style>
/* 각 페이지 스타일 */
#reservation_success #successbox {
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	margin-top: 300px;
	border-radius: 10px;
}

#reservation_success .center {
	padding-bottom: 120px;
}

#reservation_success  div.title {
	border-bottom: 5px solid #000;
	font-size: 18px;
	letter-spacing: 18px;
	font-weight: 700;
	text-transform: uppercase;
	padding: 60px 0;
	text-align: center;
}

#reservation_success  div.content {
	padding: 50px 0;
}

#reservation_success #info {
	max-width: 850px;
	margin: 0 auto;
}

#reservation_success a.hotelimg {
	width: 100%;
	height: 300px;
	margin-top: 40px;
	display: block;
}

#reservation_success a.hotelimg img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#reservation_success  div.hotelname {
	font-size: 30px;
	text-align: center;
	padding-bottom: 40px;
}

#reservation_success .location {
	text-align: center;
	font-size: 20px;
}

#reservation_success .text_box {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

#reservation_success .text_box p {
	display: flex;
	align-items: center;
}

#reservation_success .text_box p  span {
	font-weight: 600;
	width: 84px;
	line-height: 30px;
	display: block;
}

#reservation_success  .complete {
	text-align: center;
	padding-bottom: 40px;
	font-size: 34px;
}

#reservation_success  a.mapconfirm {
    width: 240px;
    height: 40px;
    margin: 0;
    background-color: #000;
    border: 1px solid #000;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
}




/* //각 페이지 스타일 */
</style>
<body>


	<div id="wrap">
		<div id="reservation_success">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="success">
					<div id="successbox" data-aos="flip-left">
						<div id="info">
							<div class="title">Receipt</div>
							<div class="content">
								<div class="complete">예약이 완료되었습니다.</div>
								<div class="hotelname">글림스</div>
								<div class="location">
									<span>구로구 구로동</span>
								</div>
								<a href="javascript:;" class="hotelimg"> <img alt=""
									src="${root }/img/find/room_03.png">
								</a>
								<div class="text_box">
									<div>
										<p>
											<span>예약번호</span> : 1234
										</p>
										<p>
											<span>예약자 성함</span> : 한동규
										</p>
										<p>
											<span>체크인</span> : 2024-06-19 15:00 이후
										</p>
										<p>
											<span>체크아웃</span> : 2024-06-19 11:00 이전
										</p>
										<p>
											<span>결제금액</span> : 10000
										</p>
											<a href="#" class="mapconfirm" style="margin-top: 30px;">숙소 위치 확인</a>
									</div>		
								</div>
							</div>
						</div>
					</div>
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