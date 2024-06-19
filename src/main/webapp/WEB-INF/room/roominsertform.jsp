<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script>

</head>
<title>TRIP NEST</title>
<style>
	html,
	body {
		position: relative;
	}

	body {
		background: #fff;
		font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
		font-size: 14px;
		color: #000;
		margin: 0;
		padding: 0;
	}

	.swiper {
		width: 100%;
		height: 100%;
	}

	.swiper-slide {

		font-size: 18px;
		background: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
	}



	.number-input {
		display: flex;
		align-items: center;
	}
	.number-input input {
		width: 50px;
		text-align: center;
	}

	input{
		border: 1px solid #ccc; /* 테두리 설정 */
		border-radius: 4px; /* 모서리 둥글게 */
		padding: 5px;
		width: 500px;
		height: 40px;
	}
	textarea {
		width:500px;
		height:300px;
		border: 1px solid #ccc;
	}

	.image-preview-container {
		display: flex;
		flex-wrap: wrap;
		margin-top: 10px;
		margin: 0 auto;
		text-align: center;
	}

	.image-preview {
		width: 200px;
		height: 200px;
		margin-right: 10px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		object-fit: cover;
	}
	table tr,th,td {
		border: 0px solid black;
	}

	.form-table,.service-table {
		width: 100%;
		table-layout: fixed; /* 테이블 고정 레이아웃 설정 */
	}
	.form-table th {
		width: 30%; /* th의 너비를 30%로 설정 */
		padding: 10px;
		vertical-align: middle;
	}

	.form-table td {
		width: 70%;
		padding: 10px;
		vertical-align: middle;
	}

	.form-table .full-width {
		width: 100%;
	}
	.tablediv{
		margin: 0 auto;
		width: 80%;
		margin-bottom: 5%;
		margin-top: 8%;
	}
	caption {
		font-size: 20pt;
		font-weight: bold;
		margin-bottom: 5%;
	}
	button.addrbtn{
		cursor: pointer;
		width: 300px;
		height: 40px;
		border-radius: 4px;
		margin-top: 5%;
		margin-bottom: 5%;
	}
	#map{
		width:96%;
		height:450px;
		margin-top: 5%;
	}
	.image-preview-container {
		text-align: center;
	}

	.image-preview-container img {
		display: block;
		margin: 0 auto; /* 좌우 마진을 auto로 설정하여 가운데 정렬합니다. */
	}
	input.service{
		width: 50px;
	}

	.checkboxdiv{
		border: 1px solid #ccc;
		width:250px;
		height: 80px;
		vertical-align: middle;
		border-radius: 20px;
		margin: 10px;
	}

	.servicediv input[type="checkbox"] {
		transform: scale(0.8); /* 체크박스 크기를 줄입니다 */
		margin-right: 5px; /* 체크박스와 텍스트 사이의 간격을 조정합니다 */

	}

	.service-table {
		width: 100%;
		border-collapse: collapse; /* 테이블 셀 경계 병합 */
	}

	.service-table td {
		text-align: center; /* 셀 내용 가운데 정렬 */
		vertical-align: top; /* 셀 내용 상단 정렬 */
		width: 33.33%; /* 셀 폭을 세 등분으로 설정 */
		padding: 10px; /* 셀 여백 설정 */
	}

	.checkboxdiv {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.servicediv input[type="checkbox"] {
		vertical-align: middle; /* 체크박스 세로 정렬 */
		margin-right: 2px; /* 체크박스 오른쪽 여백 설정 */
		accent-color: black;
	}

	.servicediv{
		display: flex;
		align-items: center;
	}

	#insertbtn{
		width: 250px;
		height: 50px;
		background-color: white;
		font-size: 20pt;
		background-color: #05141F;
		color: white;
		border-radius: 20px;
		margin-top: 5%;
		cursor: pointer;
	}
	.swiper-pagination-progressbar .swiper-pagination-progressbar-fill{
		background-color: black;
	}
	.swiper-button-next:after, .swiper-button-prev:after{
		color: black;
	}
	input.addrinput{
		margin-bottom: 20px;
	}

</style>
<body>


<div id="wrap">
	<div id="roominsertfrom">
		<div class="center">
			<form action="insert" method="post" enctype="multipart/form-data" id="roomform">
				<input type="hidden" name="room_address" id="room_address">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="tablediv">
								<table class="form-table">
									<caption align="top"><b>기본사항 작성하기</b></caption>
									<tr>
										<th>
											<span>숙소이름</span>
										</th>
										<td>
											<input type="text" required="required" name="room_name" id="room_name">
										</td>
									</tr>
									<tr>
										<th>
											<span>숙소사진</span>
										</th>
										<td class="full-width">
											<input type="file" id="image_photo" multiple="multiple" required="required" accept="image/*"
												   name="image_upload">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="image-preview-container" id="imagePreviewContainer" align="center"></div>
										</td>
									</tr>
									<tr>
										<th>
											<span>숙소가격</span>
										</th>
										<td>
											<input type="text" required="required" placeholder="1박 기준" name="room_price" id="room_price">
										</td>
									</tr>
									<tr>
										<th>인원수</th>
										<td align="center">
											<div class="number-input">
												<span>기준 :</span>&nbsp;&nbsp;
												<input type="number" id="room_min_capacity" value="1" min="1" name="room_min_capacity"/>

												<span>&nbsp;&nbsp;/최대 :</span>&nbsp;&nbsp;
												<input type="number" id="room_max_capacity" value="1" min="1" name="room_max_capacity"/>

											</div>
										</td>
									</tr>
									<tr>
										<th>
											<span>상세정보</span>
										</th>
										<td>
											<div>
												<textarea name="room_detail" id="room_detail"></textarea>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="tablediv">
								<table class="addr-table">
									<caption align="top"><b>주소입력하기</b></caption>
									<tr>
										<td>
											<div>
												<input type="text" class="addrinput" id="sample6_postcode" placeholder="우편번호">
												<input type="button" class="addrinput" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
												<input type="text" class="addrinput" id="sample6_address" placeholder="주소" required="required"><br>
												<input type="text" class="addrinput" id="sample6_detailAddress" placeholder="상세주소" required="required">
												<input type="text" class="addrinput" id="sample6_extraAddress" placeholder="참고항목">
											</div>
										</td>
									</tr>
								</table>
								<!-- <div align="center">
									<button type="button" onclick="searchAddress()" class="addrbtn">주소로 지도 표시하기</button>
								</div> -->
								<div id="map"></div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="tablediv">
								<table class="service-table">
									<caption align="top"><b>편의시설 선택하기</b></caption>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="와이파이" class="service" name="room_service[]">
												<div class="checkboxdiv">와이파이</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="TV" class="service" name="room_service[]">
												<div class="checkboxdiv">TV</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="주방" class="service" name="room_service[]">
												<div class="checkboxdiv">주방</div>
											</div>
										</td>
									</tr>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="세탁기" class="service" name="room_service[]">
												<div class="checkboxdiv">세탁기</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="에어컨" class="service" name="room_service[]">
												<div class="checkboxdiv">에어컨</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="전자렌지" class="service" name="room_service[]">
												<div class="checkboxdiv">전자렌지</div>
											</div>
										</td>
									</tr>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="수영장" class="service" name="room_service[]">
												<div class="checkboxdiv">수영장</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="바베큐 그릴" class="service" name="room_service[]">
												<div class="checkboxdiv">바베큐 그릴</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="주차장" class="service" name="room_service[]">
												<div class="checkboxdiv">주차장</div>
											</div>
										</td>
									</tr>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="반려동물 입장가능" class="service" name="room_service[]">
												<div class="checkboxdiv">반려동물 입장가능</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="셀프체크인" class="service" name="room_service[]">
												<div class="checkboxdiv">셀프체크인</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="건조기" class="service" name="room_service[]">
												<div class="checkboxdiv">건조기</div>
											</div>
										</td>
									</tr>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="헤어드라이기" class="service" name="room_service[]">
												<div class="checkboxdiv">헤어드라이기</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="비데" class="service" name="room_service[]">
												<div class="checkboxdiv">비데</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="식기류" class="service" name="room_service[]">
												<div class="checkboxdiv">식기류</div>
											</div>
										</td>
									</tr>

								</table>
								<div align="center">
									<button type="submit" id="insertbtn">등록하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
				</div>
			</form>
		</div>
	</div>
</div>




<%@ include file="../include/footer.jsp"%>
<script>
	var swiper = new Swiper(".mySwiper", {
		pagination: {
			el: ".swiper-pagination",
			type: "progressbar",
		},
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});

	//도로명주소 검색
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	};

	//도로명 주소로 검색한 주소를 input hidden안에 내용들어가게
	$(document).ready(function() {
		// 주소 입력 필드의 값이 변경될 때마다 room_address에 설정
		$('#sample6_address, #sample6_detailAddress, #sample6_extraAddress').on('input', function() {
			var address = $('#sample6_address').val();
			var detailAddress = $('#sample6_detailAddress').val();
			var extraAddress = $('#sample6_extraAddress').val();

			var fullAddress = address + ' ' + detailAddress + ' ' + extraAddress;

			$('#room_address').val(fullAddress);
		});
	});

	//사진 미리보기
	document.getElementById('image_photo').addEventListener('change', function() {
		const previewContainer = document.getElementById('imagePreviewContainer');
		previewContainer.innerHTML = ''; // 기존 미리보기 초기화

		const files = this.files;
		for (let i = 0; i < files.length; i++) {
			const file = files[i];

			if (file.type.startsWith('image/')) {
				const reader = new FileReader();
				reader.onload = function(event) {
					const img = document.createElement('img');
					img.src = event.target.result;
					img.classList.add('image-preview');
					previewContainer.appendChild(img);
				}
				reader.readAsDataURL(file);
			}
		}
	});

	//폼을 제출할때 빠진 정보가 없게끔. 비어있는 슬라이드로 이동함.
	$(document).ready(function(){

		$("#insertbtn").click(function(){
			var room_name=$("#room_name").val();
			var images = $("#image_photo")[0].files.length;
			var room_price = $("#room_price").val();
			var room_detail = $("#room_detail").val();
			var room_address=$("#room_address").val();
			var services = $("input[name='room_service[]']:checked").length;

			if(!room_name){

				alert("숙소이름을 입력해 주세요.");
				// 슬라이드를 첫 번째 페이지로 이동
				var swiper = document.querySelector('.mySwiper').swiper;
				swiper.slideTo(0);
				return false;
			}
			if (!room_price) {
				alert("숙소가격을 입력해 주세요.");
				// 슬라이드를 첫 번째 페이지로 이동
				var swiper = document.querySelector('.mySwiper').swiper;
				swiper.slideTo(0);
				return false;
			}
			if (images == 0) {
				alert("숙소사진을 선택해 주세요.");
				// 슬라이드를 첫 번째 페이지로 이동
				var swiper = document.querySelector('.mySwiper').swiper;
				swiper.slideTo(0);
				return false;
			}

			if (!room_detail) {
				alert("상세정보를 입력해 주세요.");
				// 슬라이드를 첫 번째 페이지로 이동
				var swiper = document.querySelector('.mySwiper').swiper;
				swiper.slideTo(0);
				return false;
			}
			if (!room_address) {
				alert("주소를 입력해 주세요.");
				// 슬라이드를 첫 번째 페이지로 이동
				var swiper = document.querySelector('.mySwiper').swiper;
				swiper.slideTo(1);
				return false;
			}
			if (services == 0) {
				alert("1개 이상의 편의시설을 선택해 주세요.");
				// 슬라이드를 마지막 페이지로 이동
				return false;
			}
			return true;

		})
	});





</script>
<script type="text/javascript">

	//지도의 주소가 바뀔때마다 지도에 표시되는 위치 변경
	$(document).ready(function() {
		$('#sample6_detailAddress,#sample6_address').on('keyup', function() {
			var address = $('#sample6_address').val().trim(); // 주소 입력 필드 값 가져오기

			// 주소가 입력되어 있는 경우에만 지도 업데이트
			if (address) {
				searchAddress(address); // 주소 검색 함수 호출
			}
		});
	});


	//카카오 지도
	//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소로 좌표를 검색하는 함수
	function searchAddress() {
		var address = document.getElementById('sample6_address').value;
		//var detailAddress = document.getElementById('sample6_detailAddress').value;

		// 주소와 상세주소를 합쳐서 주소로 사용합니다
		//var fullAddress = address + ' ' + detailAddress;

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				map.setCenter(coords);
				// 지도에 마커를 표시합니다
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
			}
		});
	}



</script>
</body>
</html>