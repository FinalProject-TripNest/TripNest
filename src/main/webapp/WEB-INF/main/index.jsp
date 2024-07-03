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
					<form method="get" action="find/search">
						<div class="input">
							<img alt="" src="../img/main/search.png"> <input
								type="text" placeholder="여행지나 숙소를 등록해보세요." name="search">
						</div>

						<div class="date gray">
							<img alt="" src="../img/main/calendar.png"> <span>text</span>
						</div>
						<div class="personnel gray">
							<img alt="" src="../img/main/personnel.png"> <span>text</span>
						</div>
						<input type="submit" class="btn" value="검색">
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
						<c:forEach items="${roomDtoList}" var="room">
							<a class="block" href="find/list/detail?room_id=${room.room_id}">
								<c:choose>
									<c:when test="${room.image_photo != null}">
										<img alt="" src="${room.image_photo}">
									</c:when>
									<c:otherwise>
										<img alt=""
											src="https://finaltripnest0613.s3.ap-northeast-2.amazonaws.com/roomphoto/noimage.jpg"
											style="border: 1px solid #ddd;">
									</c:otherwise>
								</c:choose>
								 <div class="text_box">
									<span class="title">${room.room_name}</span> <span class="text">${room.city}
										/ ${room.district} / <fmt:formatNumber
											value="${room.room_price}" type="currency" />~
									</span>
								</div> 
							</a>
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
							<a class="block"
								href="/promotion/detail?promotion_id=${promotion.promotion_id}">
								<img alt="" src="${promotion.promotion_photo}">
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

							<a class="block" href="/journal/detail?journal_id=${journal.journal_id}"> <img alt=""
								src="${journal.journal_photo}">
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

	<div class="pop_up search">
		<div class="dimd"></div>
		<div class="main">text</div>
	</div>
	<div class="pop_up date">
		<div class="dimd"></div>
		<div class="main">text</div>
	</div>
	<div class="pop_up personnel ">
		<div class="dimd"></div>
		<div class="main">text</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<script>
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

		$("#index .search form .input input").click(function() {
			$(".pop_up.search").addClass("active");
		});
		$("#index .search form .date").click(function() {
			$(".pop_up.date").addClass("active");
		});
		$("#index .search form .personnel").click(function() {
			$(".pop_up.personnel").addClass("active");
		});
		$(".dimd").click(function() {
			$(".pop_up").removeClass("active");
		});
	</script>
</body>
</html>
