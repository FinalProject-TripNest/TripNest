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

					<c:forEach items="${dto}" var="list">
						<a href="javascript:;" class="block"> <img alt=""
							src="../img/journal/${list.journal_photo}" class="img1">
							<div class="content"
								style="display: flex; align-items: center; justify-content: space-between;">
								<div style="display: flex; align-items: center;">
									<p class="miniTitle">${list.journal_title}</p>
									<!-- 예시로 추가한 이미지 -->
									<img alt="" src="../img/journal/new.png" width="15" height="15">
								</div>
								<p style="font-size: 14px; color: #4D4D4D;">
								<fmt:formatDate value="${list.journal_date }" pattern="yyyy-MM-dd"/>
								</p>
							</div>
							<p class="miniContent">${list.journal_content}</p>
						</a>
					</c:forEach>


				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
