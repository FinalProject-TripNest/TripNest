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
	<div id="findList">
		<div class="title" data-aos="fade-up">
			<a class="title2">Find</a>
		</div>
		<div class="list">
			<c:forEach items="${roomDtoList}" var="room">
				<a href="list/detail?room_id=${room.room_id }"
				   class="block">
					<div class="img">
						<c:choose>
							<c:when test="${room.image_photo != null}">
								<img alt="" src="${room.image_photo}">
							</c:when>
							<c:otherwise>
								<!-- 기본 이미지 추가하기 -->
								<img alt="" src="https://finaltripnest0613.s3.ap-northeast-2.amazonaws.com/roomphoto/noimage.jpg">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="text_box">
						<div class="top">
							<p class="title">${room.room_name}</p>
							<p class="rating">
								<img alt="" src="../img/find/star.png"><span>${room.room_rating}</span>
							</p>
						</div>
						<div class="location">
							<span>${room.city} / ${room.district}</span>
						</div>
						<div class="standard">
							<span>기준${room.room_min_capacity }명(최대${room.room_max_capacity}명)</span>
						</div>
						<div class="price">
											<span><fmt:formatNumber value="${room.room_price}"
																	type="currency" /></span>
						</div>
					</div>
				</a>
			</c:forEach>

		</div>
	</div>
</div>




<%@ include file="../include/footer.jsp"%>
</body>
</html>