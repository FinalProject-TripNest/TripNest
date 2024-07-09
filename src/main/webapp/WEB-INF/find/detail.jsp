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
		<div id="findDetail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title" data-aos="fade-up">
					<a class="title2">Room</a>
				</div>
				<div class="head">
					<div class="title">
						<span>${detailDto.room_name }</span>
					</div>
					<div class="data_btn">
						<input class="detail_date" value="${defaultDate }"> 
						<img alt="" src="../../img/main/right_arrow.png">
					</div>
					<c:choose>
						<c:when test="${sessionScope.loginok == null}">
							<a href="../../login/loginform" class="payment_btn">결제하기</a>
						</c:when>
						<c:otherwise>
						<!-- 박범수 checkin, checkout 넘겨주기 -->
							<a href="../../find/reservation?room_id=${detailDto.room_id}&checkin=${checkin }&checkout=${checkout}" class="payment_btn">결제하기</a>
						</c:otherwise>
					</c:choose>


				</div>
				<div class="main">
					<div class="infomation">
						<div class="info_title">
							<span>ROOM INFORMATION</span>
						</div>
						<div class="title">
							<span>${detailDto.room_name }</span>
						</div>
						<div class="price">
							<span><fmt:formatNumber value="${detailDto.room_price}"
									type="currency" /></span>
						</div>
						<div class="detail">
							<p>${detailDto.room_detail}</p>
						</div>
						<div class="info">
							<p>기준 인원 ${detailDto.room_min_capacity}명 (최대 인원
								${detailDto.room_max_capacity}명)</p>
						</div>
					</div>
					<div class="slide">
						<div class="detail_slide">
							<div class="swiper-wrapper">

								<c:forEach items="${detailDto.roomImgList}" var="image">
									<div class="swiper-slide">
										<img alt="" src="${image}">
									</div>
								</c:forEach>

							</div>
							<div class="swiper_btn">
								<div class="swiper-button-next btn"></div>
								<div class="swiper-button-prev btn"></div>
							</div>

							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
				<div class="amenities" id="amenities">
					<div class="title">AMENITIES</div>
					<div class="text">
						<p>${detailDto.room_service}</p>
					</div>
				</div>


				<div id="location" hidden>${detailDto.room_address}</div>

				<!-- 지도 div 태그 -->
				<div id="map"
					style="width: 100%; height: 400px; margin-bottom: 120px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					};

					// 지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					var roomLocation = document.getElementById('location').innerText;

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									roomLocation,
									function(result, status) {

										// 정상적으로 검색이 완료됐으면
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">${detailDto.room_name}</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				</script>

				<div class="review">
					<div class="title" data-aos="fade-up">
						<a class="title2">Review</a>
					</div>
					<div class="list">
						<c:forEach items="${ReviewJoinDto}" var="list">
							<div class="block">
								<div class="name">${list.member_name}</div>
								<div class="text">${list.review_content}</div>
								<div class="bottom" data-star-count="${list.review_rating}">
									<script>
										// 페이지 로드 후 실행
										document
												.addEventListener(
														'DOMContentLoaded',
														function() {
															var reviewBlocks = document
																	.querySelectorAll('.review .block');

															reviewBlocks
																	.forEach(function(
																			block) {
																		var bottomElement = block
																				.querySelector('.bottom');
																		if (!bottomElement.classList
																				.contains('star-added')) { // 별점이 추가되지 않은 경우에만 실행
																			var starCount = parseInt(bottomElement
																					.getAttribute('data-star-count'));
																			var starContainer = document
																					.createElement('div');
																			starContainer.innerHTML = displayStars(starCount);
																			starContainer.classList
																					.add('star-container');
																			bottomElement
																					.appendChild(starContainer);
																			bottomElement.classList
																					.add('star-added'); // 클래스 추가 표시
																		}
																	});
														});

										// 별점을 표시하는 함수
										function displayStars(starCount) {
											var starHtml = '';
											for (var i = 0; i < starCount; i++) {
												starHtml += '<img alt="" src="../../img/find/star.png" class="star">';
											}
											return starHtml;
										}
									</script>

									<span><fmt:formatDate value="${list.review_date}"
											pattern="yyyy-MM-dd" /></span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>



				<!--//각 페이지 작업 코드  -->
			</div>
			<div class="notification">
				<div class="center">
					<div class="flex">
						<div class="li_title">안내사항</div>
						<ul class="list">
							<li class="btn margin active">예약 안내</li>
							<li class="btn">이용 안내</li>
							<li class="btn">환불 규정</li>
						</ul>
					</div>


					<div class="container">
						<div class="fixed_title">
							<span> 숙소 이용에 대한 상세한 안내를 확인해 보세요.</span>
						</div>
						<div class="tab_view active">
							<div class="tit">예약 안내</div>
							<div class="cont">
								<dl>
									<dt>
										요금 기준
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<table>
											<thead>
												<tr>
													<th>숙소</th>
													<th>인원(기준/최대)</th>
													<th>요금</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${detailDto.room_name }</td>
													<td>${detailDto.room_min_capacity}/${detailDto.room_max_capacity}</td>
													<td><fmt:formatNumber value="${detailDto.room_price}"
															type="currency" />~</td>
												</tr>
											</tbody>
										</table>
										<ul>
											<li>기준인원 ${detailDto.room_min_capacity}인이며, 최대인원
												${detailDto.room_max_capacity}인(영유아 포함)까지 이용 가능한 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										반려 동물
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>반려 동물 동반이 불가한 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										문의하기
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>예약과 이용 문의 ${detailDto.room_hp }</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>

						<div class="tab_view">
							<div class="tit">이용 안내</div>
							<div class="cont">
								<dl>
									<dt>
										이용 규칙
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>체크인 시간은 오후 3시, 체크아웃 시간은 오전 11시입니다.</li>
											<li>예약하신 당일 오전에, 체크인 안내 문자를 보내드립니다.</li>
											<li>최대인원을 초과하는 인원은 입실이 불가합니다.</li>
											<li>예약인원 외 방문객의 출입을 엄격히 제한합니다.</li>
											<li>미성년자의 경우 보호자(법정대리인)의 동행 없이 투숙이 불가합니다.</li>
											<li>모든 공간에서 절대 금연입니다. 위반 시 특수청소비가 청구됩니다.</li>
											<li>취사 가능한 숙소이나, 연기와 냄새가 나는 음식(고기, 해산물 등)의 조리를 금지합니다.</li>
											<li>침구나 비품, 시설 등에 오염, 파손 및 분실이 발생한 경우 변상비가 청구됩니다.</li>
											<li>협의되지 않은 상업 사진 및 영상 촬영(광고용, 제품사진, 쇼핑몰, SNS마켓 포함), 드론
												촬영은 불가합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										노천탕,
										<!-- -->
										<div class="line-break"></div>
										실내욕조
										<!-- -->
									</dt>
									<dd>
										<ul>
											<li>이용시간 제한 없이 이용하실 수 있습니다.</li>
											<li>동절기(12-3월)에는 날씨에 따라 이용이 어려울 수 있습니다.</li>
											<li>액체, 분말, 거품류의 입욕제 사용이 가능합니다.</li>
											<li>배수의 문제가 발생할 수 있는 입욕 용품(각종 꽃잎, 포프리, 약초 등)의 사용을 제한합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										CCTV
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>안전과 방범을 위해 외부에 CCTV가 설치되어 있는 숙소입니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<dl>
									<dt>
										주차
										<!-- -->
										<div class="line-break"></div>
									</dt>
									<dd>
										<ul>
											<li>건물 뒤편에 ${detailDto.room_name } 전용 주차장이 마련되어 있습니다. 주중(월-금) 1대, 주말(토-일)
												2대까지 주차 가능합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>
						<div class="tab_view">
							<div class="tit">환불 규정</div>
							<div class="cont">
								<dl>
									<dt>환불 규정</dt>
									<dd>
										<table>
											<thead>
												<tr>
													<th>기준일</th>
													<th>환불 금액</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>체크인 10일전까지</td>
													<td>총 결제금액의 100% 환불</td>
												</tr>
												<tr>
													<td>체크인 9일전까지</td>
													<td>총 결제금액의 90% 환불</td>
												</tr>
												<tr>
													<td>체크인 8일전까지</td>
													<td>총 결제금액의 80% 환불</td>
												</tr>
												<tr>
													<td>체크인 7일전까지</td>
													<td>총 결제금액의 70% 환불</td>
												</tr>
												<tr>
													<td>체크인 6일전까지</td>
													<td>총 결제금액의 60% 환불</td>
												</tr>
												<tr>
													<td>체크인 5일전까지</td>
													<td>총 결제금액의 50% 환불</td>
												</tr>
												<tr>
													<td>체크인 4일전까지</td>
													<td>총 결제금액의 40% 환불</td>
												</tr>
												<tr>
													<td>체크인 3일전부터</td>
													<td>변경 / 환불 불가</td>
												</tr>
											</tbody>
										</table>
									</dd>
									<dt>
										숙박권
										<!-- -->
										<div class="line-break"></div>
										양도
										<!-- -->
									</dt>
									<dd>
										<ul>
											<li>숙박권의 재판매를 비롯하여 양도, 양수, 교환을 금지합니다.</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
		var swiper = new Swiper(".detail_slide", {
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			autoplay : {
				disableOnInteraction : false,
				waitForTransition : true,
			},

			loop : false, // 슬라이드 반복 여부
			loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상
		});

		$("#findDetail .notification .center ul li.btn").click(
				function() {
					$("#findDetail .notification .center ul li.btn")
							.removeClass("active");
					$(this).addClass("active");

					var idx = $(this).index();
					console.log(idx);
					$(this).closest(".center").find(".container .tab_view")
							.removeClass("active");
					$(this).closest(".center").find(".container .tab_view").eq(
							idx).addClass("active");
				});
	</script>

</body>
</html>