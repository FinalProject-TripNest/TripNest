<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<!-- 외부 CSS 파일 포함 -->
<style>
/* 각 페이지 스타일 */
#promotion_detail .list {
	display: flex;
	flex-wrap: wrap;
	height: auto !important;
	padding-bottom: 60px;
}

#promotion_detail .block {
	width: calc(( 100% - 60px)/3);
	border: 1px solid red;
	position: static !important;
	margin-right: 30px;
	margin-bottom: 60px;
	overflow: hidden;
}

#promotion_detail .block:nth-child(3n) {
	margin-right: 0
}

#promotion_detail .title {
	text-align: center;
	padding: 60px 0;
	justify-content: center;
}

#promotion_detail .title2 {
	font-size: 20px;
	line-height: 33px;
	font-weight: 500;
	color: #000;
	border-bottom: 3px solid #000;
	text-transform: uppercase;
}

#promotion_detail .block .img1 {
	width: 100%;
	height: 410px;
	object-fit: cover;
	display: block;
	margin-bottom: 20px;
}

#promotion_detail .list .content {
	text-align: left;
	font-size: 14px;
	line-height: 1.71;
	color: #4d4d4d;
	margin: 0 0 12px;
}

#promotion_detail .list .content .miniTitle {
	font-size: 20px;
	line-height: 1.8;
	text-align: left;
	color: #333;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 5px;
}

#promotion_detail .list .miniContent {
	color: gray;
	margin-bottom: 20px;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-align: left;
	font-size: 14px;
	line-height: 1.71;
}
/* //각 페이지 스타일 */
</style>
<body>
	<div id="wrap">
		<div id="promotion_detail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title">
					<a class="title2">TRAVEL</a>
				</div>
				
				<div class="list">
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">모두가 만족한 5월 어느 날의 기록. 가족여행을 계획 중이라면 스토너리의 ‘밍글링(Mingling)’ 
						혹은 ‘게더링(Gathering)’ 객실을 강력하게 추천한다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					<a href="javascript:;" class="block"> <img alt=""
						src="../img/journal/test1.png" class="img1">
						<div class="content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div style="display: flex;align-items: center;">
								<p class="miniTitle">푸르른 꿈속 정원</p>
								<img alt="" src="../img/journal/new.png" width="15" height="15">
							</div>

							<p style="font-size: 14px; color: #4D4D4D;">2024.06.13</p>
						</div>
						<p class="miniContent">우리의 기념일을 위한 선물로 예약하게 된 몽중정원, 이곳에서의 하루
							덕분에 우리의 계획도 확실해졌고 다짐과 정돈을 통해 일상을 헤쳐 나가는 원동력이 되었다.</p>

					</a> 
					
					


				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
