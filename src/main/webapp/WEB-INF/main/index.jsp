<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
header #header .select {
	display: none;
}

.flatpickr-calendar {
	width: 460px; /* 원하는 너비로 설정 */
}
</style>
<body onload="initAutocomplete()">
	<div id="wrap">
		<div id="index">
			<div class="top_banner">
				<div class="search">
					<form method="get" action="find/search" id="searchForm">
						<div id="address_parent">
							<input id="address" type="text" placeholder="여행 갈 곳을 검색해보세요"
								name="address" value="${defaultAddress }">
						</div>

						<div id="date">
							<input id="checkin" class="datepicker" name="checkin"
								placeholder="체크인 날짜를 선택하세요" value="${defaultCheckin}"> <input
								id="checkout" class="datepicker" name="checkout"
								placeholder="체크아웃 날짜를 선택하세요" value="${defaultCheckout}">
						</div>

						<div id="personnel">
							<input name="personnel" value="인원 수" id="personnelinput">
							<input type="hidden" name="personnelCount" id="personnelCount">

						</div>

						<input type="hidden" id="latitude" name="latitude"
							value="${defaultLatitude }"> <input type="hidden"
							id="longitude" name="longitude" value="${defaultLongitude }">

						<input type="submit" class="btn" value="검색">
					</form>
				</div>

				<!-- 인원 모달창 -->
				<div class="modal-background"></div>
				<div class="modal-content">
					<div class="counter">
						<label>총 인원</label>
						<button class="decrement">-</button>
						<span id="totalCount">0</span>
						<button class="increment">+</button>
					</div>
					<div class="button-container">
						<button id="savePersonnel">저장</button>
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



	<%@ include file="../include/footer.jsp"%>
	<script>
		// flat pickr에서 날짜 선택하면 input에 넣어주는 함수

		$(document)
				.ready(
						function() {

							// Flatpickr 한국어 로컬라이제이션 설정
							flatpickr.localize(flatpickr.l10ns.ko);

							const dateRangePicker = flatpickr(
									"#checkin",
									{
										mode : "range",
										dateFormat : "Y-m-d",
										locale : "ko",
										onChange : function(selectedDates,
												dateStr, instance) {
											if (selectedDates.length === 2) {
												const checkinDate = selectedDates[0]
														.toLocaleDateString(
																'ko-KR',
																{
																	year : 'numeric',
																	month : '2-digit',
																	day : '2-digit'
																}).split('. ')
														.join('-').slice(0, -1);
												const checkoutDate = selectedDates[1]
														.toLocaleDateString(
																'ko-KR',
																{
																	year : 'numeric',
																	month : '2-digit',
																	day : '2-digit'
																}).split('. ')
														.join('-').slice(0, -1);
												document
														.getElementById('checkin').value = checkinDate;
												document
														.getElementById('checkout').value = checkoutDate;
											}
										}
									});

							// 체크인 또는 체크아웃 입력 필드를 클릭하면 캘린더가 열리도록 설정

							document.getElementById('checkin')
									.addEventListener('focus', function() {
										dateRangePicker.open();
									});

							document.getElementById('checkout')
									.addEventListener('focus', function() {
										dateRangePicker.open();
									});

							// 인원 input 창에 인원 선택해주는 modal 창 함수
							const $counter = $('.counter');
							const $decrementBtn = $counter.find('.decrement');
							const $incrementBtn = $counter.find('.increment');
							const $countDisplay = $counter.find('span');
							let count = parseInt($countDisplay.text());

							$decrementBtn.on('click', function() {
								if (count > 0) {
									count--;
									$countDisplay.text(count);
								}
							});

							$incrementBtn.on('click', function() {
								count++;
								$countDisplay.text(count);
							});

							const $saveBtn = $('#savePersonnel');
							$saveBtn.on('click', function() {
								const inputCount = count + '명';
								$('#personnelinput').val(inputCount);
								$('#personnelCount').val(count); // 숫자 값만 숨겨진 필드에 저장
								$('.modal-content').hide();
								$('.modal-background').hide();
							});

							$('#personnelinput').on('click', function(event) {
						        event.stopPropagation();
						        const $personnel = $('#personnel');
						        const offset = $personnel.offset();
						        const height = $personnel.outerHeight();
						        $('.modal-content').css({
						            top: offset.top + height + 'px',
						            left: offset.left + 'px'
						        }).show();
						        $('.modal-background').show();
						    });

							$(document)
									.on(
											'click',
											function(event) {
												if (!$(event.target)
														.closest(
																'#personnelinput, .modal-content').length) {
													$('.modal-content').hide();
													$('.modal-background')
															.hide();
												}
											});

							$('.modal-background').on('click', function() {
								$('.modal-content').hide();
								$(this).hide();
							});

						});

		// 구글지도 검색추천 함수
		function initAutocomplete() {
			var input = document.getElementById('address');
			var autocomplete = new google.maps.places.Autocomplete(input);

			autocomplete.addListener('place_changed', function() {
				var place = autocomplete.getPlace();

				console.log(place);

				// 경도, 위도 전달 함수
				if (place.geometry) {
					var latitude = place.geometry.location.lat();
					var longitude = place.geometry.location.lng();

					document.getElementById('latitude').value = latitude;
					document.getElementById('longitude').value = longitude;

					console.log('Latitude:', latitude);
					console.log('Longitude:', longitude);
				} else {
					console.log("google maps api에 없는 장소입니다");
				}
			});
		}

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
