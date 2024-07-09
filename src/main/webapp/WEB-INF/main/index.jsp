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

.flatpickr-calendar {
   /* 부모 요소의 너비에 맞추기 */
    min-width: 0 !important; /* 최소 너비 제한 해제 */
    max-width: none !important; /* 최대 너비 제한 해제 */
    height: 330px;
}

.flatpickr-innerContainer {
    display: flex;
    flex-direction: column;
    align-items: center; /* 내부 요소를 중앙 정렬 */
}

.flatpickr-months {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    align-items: center;
    width: 100%; /* 부모 요소의 너비에 맞추기 */
}

.flatpickr-month {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    width: auto;
}

.flatpickr-weekdays {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    align-items: center;
    width: 100%; /* 부모 요소의 너비에 맞추기 */
}

.flatpickr-days {
    display: grid;
    justify-content: center; /* 중앙 정렬 */
    width: 100%; /* 부모 요소의 너비에 맞추기 */
}

.flatpickr-day {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40px; /* 높이를 고정 크기로 설정 */
}
</style>
<body onload="initAutocomplete()">
	<div id="wrap">
		<div id="index">
			<div class="top_banner">
				<div class="search">
                    <form method="get" action="find/search" id="searchForm">
                        <div id="main_address">
                            <input id="main_address_input" type="text" placeholder="여행 갈 곳을 검색해보세요" name="address" value="${address}">
                        </div>

                        <div id="main_date">
                            <input id="main_checkdate" class="datepicker" placeholder="날짜를 선택하세요" value="${defaultDate}">
                        </div>

                        <div id="main_personnel">
                            <span id="main_personnelinput">2명</span>
                        </div>

                        <input type="hidden" id="main_personnelcount" name="personnelCount"  value="2">
                        <input type="hidden" id="main_checkin" name="checkin" value="${checkin}">
                        <input type="hidden" id="main_checkout" name="checkout" value="${checkout}">
                        <input type="hidden" id="main_latitude" name="latitude" value="${Latitude}">
                        <input type="hidden" id="main_longitude" name="longitude" value="${Longitude}">

                        <input type="submit" class="btn" value="검색">
                    </form>
                </div>
            

				<!-- 인원 모달창 -->
				<div class="main_modal-content">
					<div class="main_counter">
						<label>총 인원</label>
						<button class="main_decrement">-</button>
						<span id="main_totalCount">1</span>
						<button class="main_increment">+</button>
					</div>
					<div class="main_button-container">
						<button id="main_savePersonnel">저장</button>
					</div>
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
							<a class="block"
							   href="find/list/detail?room_id=${room.room_id}">
								<c:choose>
									<c:when test="${room.image_photo != null}">
										<img alt="" src="${room.image_photo}">
									</c:when>
									<c:otherwise>
										<img alt="" src="https://finaltripnest0613.s3.ap-northeast-2.amazonaws.com/roomphoto/noimage.jpg">
									</c:otherwise>
								</c:choose>
								<div class="text_box">
									<span class="title">${room.room_name}</span>
									<span class="text">${room.city} / ${room.district} / <fmt:formatNumber value="${room.room_price}" type="currency" />~</span>
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



	<%@ include file="../include/footer.jsp"%>
</body>
</html>