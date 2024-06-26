<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<body>
	<div id="wrap">
		<div id="promotion">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title" data-aos="fade-up">
					<a class="title2">Event</a>
				</div>
				<div class="list">

					<c:forEach items="${dto}" var="list">
						<a href="/promotion/detail?promotion_id=${list.promotion_id }" class="block"> <img alt=""
							src="../img/promotion/${list.promotion_photo}" class="img1">
							<div class="content"
								style="display: flex; align-items: center; justify-content: space-between;">
								<div style="display: flex; align-items: center;">
									<p class="miniTitle">${list.promotion_title}</p>
								</div>
								<p style="font-size: 14px; color: #4D4D4D;">
									<fmt:formatDate value="${list.promotion_date }"
										pattern="yyyy-MM-dd" />
								</p>
							</div>
							<p class="miniContent">${list.promotion_content}</p>
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
