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
<style>
   html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    swiper-container {
      width: 100%;
      height: 100%;
    }

    swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
     .number-input {
            display: flex;
            align-items: center;
        }
        .number-input input {
            width: 50px;
            text-align: center;
        }
        .number-input button {
            width: 30px;
            height: 30px;
            border-radius: 100px;
            border: 1px solid #ccc;
            background-color: white;
        }
        
    input{
    	 border: 1px solid #ccc; /* 테두리 설정 */
            border-radius: 4px; /* 모서리 둥글게 */
            padding: 5px;
    }
    textarea {
			width:500px;
			height:300px;
}

	 .image-preview-container {
        display: flex;
        flex-wrap: wrap;
        margin-top: 10px;
    }

    .image-preview {
        width: 200px;
        height: 200px;
        margin-right: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        object-fit: cover;
    }
    

</style>
<body>


	<div id="wrap">
		<div id="roominsertfrom">
			<div class="center">
				<form action="">
					<swiper-container class="mySwiper" pagination="true" pagination-type="progressbar" navigation="true">
				    <swiper-slide>
							<div>
								<div><b>기본사항 작성하기</b></div>
								<div><span>숙소이름 </span> <input type="text" required="required"> </div>
								<div><span> 숙소사진</span> <input type="file" id="accommodationPhotos" multiple="multiple" required="required" accept="image/*"> </div>
								<div class="image-preview-container" id="imagePreviewContainer"></div>	
								
								<div>
									<span> 숙소가격</span>
									<input type="text" required="required" placeholder="1박 기준">
								</div>
								<div>
									<div class="number-input">
						        <span>인원수</span>
						        <div>
						        <span>기준:</span>
						        	<input type="number" id="peopleCount" value="1" min="1" />
						        <span>/최대:</span>
						        	<input type="number" id="maxCount" value="1" min="1" />
						        </div>
						   	 </div>
						   	 <div>
						   	 	<span>상세정보</span>
						   	 	<div>
						   	 		<textarea></textarea>
						   	 	</div>
						   	 </div>
								</div>
							</div>
						</swiper-slide>
				    <swiper-slide>
				    	<div>
				    		<div>
									<div class="d-inline-flex">숙소위치</div>
									<div>
										<input type="text" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" placeholder="주소"><br>
										<input type="text" id="sample6_detailAddress" placeholder="상세주소">
										<input type="text" id="sample6_extraAddress" placeholder="참고항목">
									</div>
								</div>
				    	</div>
				    </swiper-slide>
				    <swiper-slide>Slide 3</swiper-slide>
				    <swiper-slide>Slide 4</swiper-slide>
				    <swiper-slide>Slide 5</swiper-slide>
				    <swiper-slide>Slide 6</swiper-slide>
				    <swiper-slide>Slide 7</swiper-slide>
				    <swiper-slide>Slide 8</swiper-slide>
				    <swiper-slide>Slide 9</swiper-slide>
				  </swiper-container>
				 </form>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
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
	
	 function changeValue(id, delta) {
         const input = document.getElementById(id);
         const currentValue = parseInt(input.value);
         const newValue = currentValue + delta;
         if (newValue >= parseInt(input.min)) {
             input.value = newValue;
         }
     };

     document.getElementById('accommodationPhotos').addEventListener('change', function() {
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
	</script>
</body>
</html>