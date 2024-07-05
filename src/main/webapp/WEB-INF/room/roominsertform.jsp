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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<title>TRIP NEST</title>
<style>
#roominsertfrom	html,
	body {
		position: relative;
	}

#roominsertfrom	body {
		background: #fff;
		font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
		font-size: 14px;
		color: #000;
		margin: 0;
		padding: 0;
	}

#roominsertfrom .swiper {
		width: 100%;
		height: 100%;
	}

#roominsertfrom .swiper-slide {

		font-size: 18px;
		background: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
	}



#roominsertfrom	.number-input {
		display: flex;
		align-items: center;
	}
#roominsertfrom .number-input input {
		width: 50px;
		text-align: center;
	}

 #roominsertfrom input{
		border: 1px solid #ccc; /* 테두리 설정 */
		border-radius: 4px; /* 모서리 둥글게 */
		padding: 5px;
		width: 500px;
		height: 40px;
	}
#roominsertfrom textarea {
		width:500px;
		height:300px;
		border: 1px solid #ccc;
		padding: 10px;
	}

#roominsertfrom .image-preview-container {
		display: flex;
		flex-wrap: wrap;
		margin: 0 auto;
		text-align: center;
	}

#roominsertfrom .image-preview {
		width: 200px;
		height: 200px;
		margin-right:2px;
		border: 1px solid #ccc;
		object-fit: cover;
	}

#roominsertfrom .form-table,.service-table {
		width: 100%;
		table-layout: fixed; /* 테이블 고정 레이아웃 설정 */
	}
#roominsertfrom	.form-table th {
		width: 30%; /* th의 너비를 30%로 설정 */
		padding: 10px;
		vertical-align: middle;
	}

#roominsertfrom	.form-table td {
		width: 70%;
		padding: 10px;
		vertical-align: middle;
	}

#roominsertfrom .form-table .full-width {
		width: 100%;
	}
#roominsertfrom .tablediv{
		margin: 0 auto;
		width: 80%;
		margin-bottom: 5%;
		margin-top: 3%;
	}
	
	
#roominsertfrom .roomphotodiv{
		margin: 0 auto;
		width: 80%;
		margin-bottom: 5%;
		margin-top: 3%;
}
#roominsertfrom caption {
		font-size: 20pt;
		font-weight: bold;
		margin-bottom: 5%;
	}
#roominsertfrom button.addrbtn{
		cursor: pointer;
		width: 300px;
		height: 40px;
		border-radius: 4px;
		margin-top: 5%;
		margin-bottom: 5%;
	}
#roominsertfrom .roomMap{
		width:96%;
		height:450px;
		margin-top: 5%;
	}
#roominsertfrom .image-preview-container {
		text-align: center;
	}

#roominsertfrom .image-preview-container img {
		display: block;
		margin: 0 auto; /* 좌우 마진을 auto로 설정하여 가운데 정렬합니다. */
	}
#roominsertfrom input.service{
		width: 50px;
	}

#roominsertfrom .checkboxdiv{
		border: 1px solid #ccc;
		width:200px;
		height: 60px;
		vertical-align: middle;
		border-radius: 10px;
		margin: 10px;
	}

	#roominsertfrom .servicediv input[type="checkbox"] {
		transform: scale(0.8); /* 체크박스 크기를 줄입니다 */
		margin-right: 5px; /* 체크박스와 텍스트 사이의 간격을 조정합니다 */
		vertical-align: middle; /* 체크박스 세로 정렬 */
		margin-right: 2px; /* 체크박스 오른쪽 여백 설정 */
		accent-color: black;

	}

	#roominsertfrom .service-table {
		width: 100%;
		border-collapse: collapse; /* 테이블 셀 경계 병합 */
	}

	#roominsertfrom .service-table td {
		text-align: center; /* 셀 내용 가운데 정렬 */
		vertical-align: top; /* 셀 내용 상단 정렬 */
		width: 33.33%; /* 셀 폭을 세 등분으로 설정 */
		padding: 10px; /* 셀 여백 설정 */
	}

	#roominsertfrom .checkboxdiv {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#roominsertfrom .servicediv{
		display: flex;
		align-items: center;
	}

	#roominsertbtn{
		width: 250px;
		height: 50px;
		background-color: white;
		font-size: 20pt;
		background-color: #05141F;
		color: white;
		border-radius: 10px;
		margin-top: 5%;
		cursor: pointer;
	}
	#roominsertfrom .swiper-pagination-progressbar .swiper-pagination-progressbar-fill{
		background-color: black;
	}
	#roominsertfrom .swiper-button-next:after, .swiper-button-prev:after{
		color: black;
	}
	#roominsertfrom input.addrinput{
		margin-bottom: 20px;
	}

    #image_upload_icon{
    	font-size: 3em;
    }
   #roominsertfrom .miribogibtn{
    background-color: white;
    width: 30px;
    height: 30px;
    border-radius: 100px;
    position: absolute;
    cursor: pointer;
    padding: 0;
    display: flex;
    top: 10px;
    right: 10px;
    color: black;
    text-align: center;
    justify-content: center;
    flex-wrap: wrap;
    align-content: center;
    }
  #roominsertfrom .miribogiimg{
     margin-top: 10px;
     padding:5px;
     height: 400px;
     width: 100%;
     max-width: 100%;
     display: block;
    }
  #roominsertfrom .miribogidiv{
    	width:33.3%;
    	position: relative;
    	display: inline-block;
    }
   #roominsertfrom .preview-image{
     margin-top: 10px;
     padding:5px;
     height: 350px;
     width: 300px;
     max-width: 100%;
    }
  #roominsertfrom .miritable{
   	width: 100%;
   }
   #roominsertfrom .miritable td,.miritable th {
   border: 0px solid gray;
   height: 40px;
   border-bottom: 1px solid #ccc;

   }


#roominsertfrom .miritable td{
width: 70%;
vertical-align: middle;
}
#roominsertfrom .miritable th{
width: 30%;
vertical-align: middle;
}
#roominsertfrom .miridiv{
		margin: 0 auto;
		width: 80%;
		margin-bottom: 5%;
		margin-top: 3%;
}
#r_detail{
max-height: 250px;

overflow-x: hidden; /* 가로 스크롤 숨김 */
overflow-y: auto; /* 세로 스크롤 표시 */
font-family: "Noto Sans KR";
width: 700px;
padding: 10px;
white-space: pre-wrap; /* 공백 유지 및 줄바꿈 처리 */

}
</style>
<body>


<div id="wrap">
	<div id="roominsertfrom">
		<div class="center">
			<form action="insert" method="post" enctype="multipart/form-data" id="roomform">
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
											<input type="text" required="required" name="room_name" id="room_name" placeholder="공간에 이름을 지어주세요">
										</td>
									</tr>
										<tr>
										<th>
											<span>연락처</span>
										</th>
										<td>
											<input type="text" required="required" name="room_hp" id="room_hp" placeholder="연락 가능한 번호 입력해 주세요">
										</td>
									</tr>
									<tr>
										<th>
											<span>숙소가격</span>
										</th>
										<td>
											<input type="text" required="required" placeholder="1박당 기본 요금을 설정하세요" name="room_price" id="room_price">
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
												<textarea name="room_detail" id="room_detail" placeholder="숙소에 대한 소개를 적어주세요"></textarea>
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
												<input type="text" class="addrinput" id="room_address" placeholder="주소" required="required" name="room_address"><br>
												<input type="text" class="addrinput" id="sample6_detailAddress" placeholder="상세주소" required="required">
												<input type="text" class="addrinput" id="sample6_extraAddress" placeholder="참고항목">
												<input type="hidden" id="room_address_detail" name="room_address_detail">
												<input type="hidden" id="room_region" name="room_region">
												<input type="hidden" name="room_latitude" id="room_latitude">
												<input type="hidden" name="room_longitude" id="room_longitude">
											</div>
										</td>
									</tr>
								</table>
								<div id="map" class="roomMap"></div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="roomphotodiv">
								<div align="center" style="font-size: 20pt;font-weight: bold;margin-bottom: 5%;"><b>숙소사진을 등록해주세요</b></div>
								<input type="file" id="image_photo" multiple="multiple" accept="image/*" name="image_upload" onchange="previewImages(event)" style="display: none;">
								<div align="center"><i class="bi bi-camera" id="image_upload_icon"></i></div>
								<div align="center" id="phototext">사진기를 눌러 사진을 등록해주세요.</div>
								<div class="image-preview-container" id="imagePreviewContainer" align="center"></div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="tablediv">
								<table class="service-table">
									<caption align="top"><b>편의시설 선택하기</b><br><span style="font-size: 12pt;">(1개이상 선택해주세요)</span> </caption>
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
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="빔프로젝트" class="service" name="room_service[]">
												<div class="checkboxdiv">빔프로젝트</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="보드게임" class="service" name="room_service[]">
												<div class="checkboxdiv">보드게임</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="빅테이블" class="service" name="room_service[]">
												<div class="checkboxdiv">빅테이블</div>
											</div>
										</td>
									</tr>
									<tr align="center">
										<td>
											<div class="servicediv">
												<input type="checkbox" value="전기포트" class="service" name="room_service[]">
												<div class="checkboxdiv">전기포트</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="스피커" class="service" name="room_service[]">
												<div class="checkboxdiv">스피커</div>
											</div>
										</td>
										<td>
											<div class="servicediv">
												<input type="checkbox" value="인덕션" class="service" name="room_service[]">
												<div class="checkboxdiv">인덕션</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="miridiv" align="center">
								<table class="miritable">
								<caption><b>입력한 숙소 정보</b><br><span style="font-size: 12pt;">(다시 확인해주세요)</span></caption>
									<tr>
										<th >숙소이름</th>
										<td><span id="r_name"></span></td>
									</tr>
									<tr>
										<th>연락처</th>
										<td><span id="r_hp"></span></td>
									</tr>
									<tr>
										<th>가격</th>
										<td><span id="r_price"></span></td>
									</tr>
									<tr>
										<th>인원수</th>
										<td><span id="r_people"></span></td>
									</tr>
									<tr>
										<th>상세정보</th>
										<td><pre id="r_detail"></pre></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><span id="r_address"></span></td>
									</tr>
									<tr>
										<th>편의시설</th>
										<td><span id="r_service"></span></td>
									</tr>
								</table>
								<br><br>
								<div>
									<span><b>등록한 사진</b></span>
									<div id="r_photo">
									
									</div>
								</div>
								<div align="center">
									<button type="submit" id="roominsertbtn">등록하기</button>
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
	
	$(document).ready(function(){
		   $('#image_upload_icon').on('click', function() {
		        $('#image_photo').click();
		    });
	})
	// 이미지 업로드시 미리보기 생성 및 동기화
	function previewImages(event) {
	    const imagePreviewList = document.getElementById('imagePreviewContainer');

	    // eYzyqx 클래스를 가진 li 요소들을 선택하여 초기화합니다.
	    const itemsToRemove = imagePreviewList.querySelectorAll('div.miribogidiv');
	    itemsToRemove.forEach(item => {
	        item.remove(); // 요소를 제거하거나 다른 초기화 작업을 수행할 수 있습니다.
	    });

	    const files = event.target.files;

	    // 파일을 읽고 결과를 반환하는 Promise를 생성합니다.
	    const readFile = (file) => {
	        return new Promise((resolve, reject) => {
	            const reader = new FileReader();
	            reader.onload = () => resolve(reader.result);
	            reader.onerror = reject;
	            reader.readAsDataURL(file);
	        });
	    };

	    // 모든 파일을 읽고 나서 처리합니다.
	    Promise.all(Array.from(files).map(readFile))
	        .then(fileImgs => {
	            fileImgs.forEach((fileImg, index) => {
	                const div = document.createElement('div');
	                div.classList.add('miribogidiv');

	                const img = document.createElement('img');
	                img.classList.add('miribogiimg');
	                img.src = fileImg;

	                const btn = document.createElement('button');
	                btn.textContent = 'X';
	                btn.classList.add('miribogibtn');
	                btn.addEventListener('click', function() {
	                    // event.target.files에서 해당 파일을 제거합니다.
	                    const newFiles = Array.from(event.target.files).filter((f, i) => i !== index);

	                    // 변경된 파일 목록으로 새 FileList 객체를 생성합니다.
	                    const newFileList = new DataTransfer();
	                    newFiles.forEach(f => newFileList.items.add(f));

	                    // input 요소의 files 속성을 업데이트합니다.
	                    event.target.files = newFileList.files;

	                    // 변경된 event.target.files로 미리보기를 다시 생성합니다.
	                    previewImages(event);
	                });

	                div.appendChild(img);
	                div.appendChild(btn);

	                imagePreviewList.appendChild(div);
	            });

	        })
	        .catch(error => {
	            console.error('파일을 읽는 중 오류가 발생했습니다:', error);
	        });
	};
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
				document.getElementById("room_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	};

	//도로명 주소로 검색한 주소를 input hidden안에 내용들어가게
	$(document).ready(function() {
		// 주소 입력 필드의 값이 변경될 때마다 room_address에 설정
		$('#sample6_detailAddress, #sample6_extraAddress').on('input', function() {
			var detailAddress = $('#sample6_detailAddress').val();
			var extraAddress = $('#sample6_extraAddress').val();

			var fullAddress = detailAddress + ' ' + extraAddress;
			 console.log("fullAddress:", fullAddress);
			$('#room_address_detail').val(fullAddress);
		});
		
	});
	$(document).ready(function(){
		$('#room_name').on('input', function(){
			var r_name=$("#room_name").val();
			
			$("#r_name").text(r_name);
		});
	    // 연락처 입력 변화 감지
	    $('#room_hp').on('input', function(){
	        var r_hp = $("#room_hp").val();
	        $("#r_hp").text(r_hp);
	    });

	    // 가격 입력 변화 감지
	    $('#room_price').on('input', function(){
	        var r_price = $("#room_price").val();
	        $("#r_price").text(r_price);
	    });

	    // 인원수 입력 변화 감지
	    /*$('#room_min_capacity, #room_max_capacity').on('input', function(){
	        var r_min_capacity = $("#room_min_capacity").val();
	        var r_max_capacity = $("#room_max_capacity").val();
	        $("#r_people").text("기준 " + r_min_capacity + " / 최대 " + r_max_capacity);
	    });*/

	    // 상세정보 입력 변화 감지
	    $('#room_detail').on('input', function(){
	        var r_detail = $("#room_detail").val();
	        $("#r_detail").text(r_detail);
	    });
	    updatePeopleText();

	    // 주소 입력 변화 감지 (우편번호, 주소, 상세주소, 참고항목)
	    $('#sample6_postcode, #room_address, #sample6_detailAddress, #sample6_extraAddress').on('input', function(){
	        var r_address = $("#room_address").val();
	        var r_detail_address = $("#sample6_detailAddress").val();
	        var r_extra_address = $("#sample6_extraAddress").val();
	        
	        if(r_extra_address==null){
	        	var full_address = r_address + " " + r_detail_address
	        }else{
	        	var full_address = r_address + " " + r_detail_address + " " + r_extra_address;
	        }
	        
	        $("#r_address").text(full_address);
	    });

	    // 편의시설 체크박스 변화 감지
	    $('.service').on('change', function(){
	        var services = [];
	        $('.service:checked').each(function(){
	            services.push($(this).val());
	        });
	        $("#r_service").text(services.join(", "));
	    });

	    
	    // 파일 입력(change) 이벤트 감지
	    $('#image_photo').on('change', function(){
	        var files = $(this)[0].files;
	        var photoContainer = $('#r_photo');
	        photoContainer.empty(); // 기존 이미지 모두 제거
	        
	        // FileReader 객체를 사용하여 선택된 이미지 파일들을 읽고 미리보기에 추가
	        for (var i = 0; i < files.length; i++) {
	            var file = files[i];
	            var reader = new FileReader();
	            
	            reader.onload = (function(theFile) {
	                return function(e) {
	                    var imgElement = $('<img>');
	                    imgElement.attr('src', e.target.result);
	                    imgElement.attr('alt', theFile.name);
	                    imgElement.addClass('preview-image');
	                    photoContainer.append(imgElement); // 미리보기 이미지를 추가
	                };
	            })(file);
	            
	            // 파일 읽기 시작
	            reader.readAsDataURL(file);
	        }
	    });
		
	});

	
	//사진 등록했을때 마지막 미리보기에 출력되게
	$(function() {
		
		
		// 이미지 미리보기를 감시할 MutationObserver 생성
	    var observer = new MutationObserver(function(mutations) {
	        mutations.forEach(function(mutation) {
	            if (mutation.type === 'childList') {
	                updateRPhoto();
	            }
	        });
	    });

	    // 감시할 대상 설정 (#imagePreviewContainer)
	    var targetNode = document.getElementById('imagePreviewContainer');
	    var config = { childList: true,subtree: true };

	    // MutationObserver 시작
	    observer.observe(targetNode, config);

	    // 초기화 시 이미지 미리보기 로드
	    updateRPhoto();

	    // #r_photo 업데이트 함수 정의
	    function updateRPhoto() {
	        var photoContainer = $('#r_photo');
	        var previewContainer = $('#imagePreviewContainer');

	        // 기존에 #r_photo에 있던 사진 모두 제거
	        photoContainer.empty();

	        // #imagePreviewContainer 내의 각 이미지를 #r_photo에 복제하여 추가
	        previewContainer.children('div.miribogidiv').each(function(index, element) {
	        	 var clonedDiv = $(element).clone();
	             photoContainer.append(clonedDiv);
	        });
	    }
		



});
	

	
	    function updatePeopleText() {
        var r_min_capacity = $("#room_min_capacity").val();
        var r_max_capacity = $("#room_max_capacity").val();
        $("#r_people").text("기준 " + r_min_capacity + " / 최대 " + r_max_capacity);
    }

	//폼을 제출할때 빠진 정보가 없게끔. 비어있는 슬라이드로 이동함.
	$(document).ready(function() {

		$("#roominsertbtn").click(function() {
			var room_name = $("#room_name").val();
			var images = $("#image_photo")[0].files.length;
			var room_price = $("#room_price").val();
			var room_detail = $("#room_detail").val();
			var room_address = $("#room_address").val();
			var services = $("input[name='room_service[]']:checked").length;

			console.log(room_address);

			if (!room_name) {

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
				swiper.slideTo(2);
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
				var swiper = document.querySelector('.mySwiper').swiper;
				// 슬라이드를 마지막 페이지로 이동
				swiper.slideTo(3);
				return false;
			}
			return true;

		})
	});
	

</script>
<script type="text/javascript">

	//지도의 주소가 바뀔때마다 지도에 표시되는 위치 변경
	$(document).ready(function() {
		$('#sample6_detailAddress,#room_address').on('keyup', function() {
			var address = $('#room_address').val().trim(); // 주소 입력 필드 값 가져오기

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
		var address = document.getElementById('room_address').value;
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
				$("#room_latitude").val(result[0].y);
				$("#room_longitude").val(result[0].x);
			}
		});
	}


</script>
</body>
</html>