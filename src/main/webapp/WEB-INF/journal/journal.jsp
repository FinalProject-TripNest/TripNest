<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<body>
	<div id="wrap">
		<div id="journal">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title" data-aos="fade-up" data-aos-duration="500">
					<a class="title2">TRAVEL</a>
				</div>

				<div class="list">

					<c:forEach items="${dto}" var="list">

						<c:set var="currentDate" value="<%=new java.util.Date()%>" />
						<c:set var="dateDiff"
							value="${(currentDate.time - list.journal_date.time) / (1000 * 60 * 60 * 24)}" />

						<a href="/journal/detail?journal_id=${list.journal_id}" class="block"> <img alt=""
							src="${list.journal_photo}" class="img1">
							<div class="content"
								style="display: flex; align-items: center; justify-content: space-between;">
								<div style="display: flex; align-items: center;">
									<p class="miniTitle">${list.journal_title}</p>
									<!-- 예시로 추가한 이미지 -->
									<c:if test="${dateDiff <= 15}">
										<img alt="" src="../img/journal/new.png" width="15"
											height="15">
									</c:if>
								</div>
								<p style="font-size: 14px; color: #4D4D4D;">
									<fmt:formatDate value="${list.journal_date }"
										pattern="yyyy-MM-dd" />
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
