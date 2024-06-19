<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
header#header .select {
	display: none;
}
</style>
<body>
	<div id="wrap">
		<div id="index">
			<div class="top_banner">
				<div class="search">
					<form>
						<div class="input">
							<img alt="" src="../img/main/search.png"> <input
								type="text" placeholder="여행지나 숙소를 등록해보세요.">
						</div>

						<div class="date gray">
							<img alt="" src="../img/main/calendar.png"> <span>text</span>
						</div>
						<div class="personnel gray">
							<img alt="" src="../img/main/personnel.png"> <span>text</span>
						</div>
						<div class="btn">검색</div>
					</form>
				</div>
			</div>
			<div class="stay common">
				<div class="center">
					<div class="head">
						<div class="title" data-aos="fade-up">
							<span>오직 트립네스트에서만</span>
						</div>
						<a href="find/list" class="link">전체 보기</a>
					</div>
					<div class="list">
						<c:forEach items="${roomsDto}" var="room" begin="0" end="5">
							<c:set var="firstImage" value="true" />
							<c:forEach items="${imageDto}" var="image">
								<c:if test="${room.room_id eq image.room_id}">
									<c:if test="${firstImage}">
										<a class="block"
											href="find/list/detail?room_id=${room.room_id }"> <img
											alt="" src="${image.image_photo}">
											<div class="text_box">
												<span class="title">${room.room_name}</span> <span
													class="text">${room.city} / ${room.district} / <fmt:formatNumber
														value="${room.room_price}" type="currency" />~
												</span>
											</div>
										</a>
										<c:set var="firstImage" value="false" />
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="promotion common">
				<div class="center">
					<div class="head">
						<div class="title" data-aos="fade-up">
							<span>PROMOTION</span>
						</div>
						<a href="promotion/list" class="link">전체 보기</a>
					</div>
					<div class="list">
						<c:forEach items="${promotionDto}" var="promotion" begin="0"
							end="5">
							<a class="block" href="javascript:;"> <img alt=""
								src="../img/promotion/${promotion.promotion_photo}">
								<div class="text_box">
									<span class="title">${promotion.promotion_title}</span> <span
										class="text">${promotion.promotion_content}</span>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="event">
				<a href="find/list">
					<div>
						<p class="title">Experience Tripnest Daily</p>
						<p class="text">트립네스트에서의 경험을 일상으로</p>
					</div>
				</a>
			</div>
			<div class="journal common">
				<div class="center">
					<div class="head">
						<div class="title" data-aos="fade-up">
							<span>JOURNAL</span>
						</div>
						<a href="journal/list" class="link">전체 보기</a>
					</div>
					<div class="list">
						<c:forEach items="${journalDto}" var="journal" begin="0" end="5">
							<a class="block" href="javascript:;"> <img alt=""
								src="../img/journal/${journal.journal_photo}">
								<div class="text_box">
									<span class="title">${journal.journal_title}</span> <span
										class="text">${journal.journal_content}</span>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<script>
		$("#index .search form .input input").click(function() {
			$(this).addClass("active");
		});
		$("#index .search form .gray").click(function() {
			$(this).addClass("active");
		});

		$(document)
				.click(
						function(event) {
							if (!$(event.target)
									.closest(
											"#index .search form .input input, #index .search form .gray").length) {
								$("#index .search form .input input")
										.removeClass("active");
								$("#index .search form .gray").removeClass(
										"active");
							}
						});
	</script>
</body>
</html>
