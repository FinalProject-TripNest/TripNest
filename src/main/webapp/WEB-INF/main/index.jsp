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

#index #search_address_modal {
    position:absolute;
    display:none;
     
    box-sizing: border-box;
}
</style>
<body>
	<div id="wrap">
		<div id="index">
			<div class="top_banner">
			<!-- 호텔 검색 박스 -->
				<div id="hotel_search">
					<input id="hotel_search_address" type="button" value="어디로 떠나시나요?"></input>
					<input id="hotel_search_date" type="button" value="언제 떠나시나요?"></input>
					<input id="hotel_search_capacity" type="button" value="누구와 떠날까요?"></input>
					<input id="hotel_search_button" type="button"></input>
				</div>
			</div>
			<!-- 검색 박스 모달창 -->
			<div class="search_modal_overlay">
				<div id="search_address_modal">
					<div id="address_search_title">
						<h2>어디로 떠날까요?</h2>
					</div> 
					<div id="address_input_div">
						<input id="address_input" value="원하는 호텔 혹은 지역을 검색해 보세요.">
					</div>
				</div>
				<div id="search_date_modal">
									
				</div>
				<div id="search_capacity_modal">
					
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
										<a class="block" href="javascript:;"> <img alt=""
											src="${image.image_photo}">
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
				<a href="javascript:;">
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
		// 추가적인 JavaScript 코드 필요 시 여기에 작성
		
		//모달 창 띄우기, 모달창 닫기
		$(document).ready(function() {
            $('#hotel_search_address').on('click', function() {
            	 $('.search_modal_overlay').css('display', 'flex');
                $('#search_address_modal').css('display', 'flex');
            });
            
            $('#hotel_search_date').on('click', function() {
           		 $('.search_modal_overlay').css('display', 'flex');
                $('#search_date_modal').css('display', 'flex');
            });
            
            $('#hotel_search_capacity').on('click', function() {
           		 $('.search_modal_overlay').css('display', 'flex');
                $('#search_capacity_modal').css('display', 'flex');
            });
            
            $('.search_modal_overlay').on('click', function(e) {
                if (e.target === this) {
                    $('.search_modal_overlay').css('display', 'none');
                    $('#search_date_modal').css('display','none');
                    $('#search_capacity_modal').css('display','none');
                    $('#search_address_modal').css('display', 'none');
                }
            });
        });
	</script>
</body>
</html>
