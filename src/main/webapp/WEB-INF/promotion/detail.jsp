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
		<div id="promotion_detail">
			<div class="bg">
				<div class="title">${dto.promotion_title }</div>
				<div class="event">${dto.promotion_content }</div>
				<div class="date">
					<fmt:formatDate value="${dto.promotion_date }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="center">
				<div class="main">
					<div class="img">
						<img alt="" src="${dto.promotion_photo}">
					</div>
					<div class="text">
						<p>${dto.promotion_explanation}</p>
					</div>
					<div class="btn">
						<div>쿠폰 발급</div>
					</div>
				</div>

			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
</body>
</html>