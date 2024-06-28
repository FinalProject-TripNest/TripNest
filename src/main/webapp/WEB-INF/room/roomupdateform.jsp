<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script>
</head>
<title>TRIP NEST</title>
<style>
#roomupdateform .roomupdateformdiv input{
	    border: 1px solid #ccc;
	        height: 35px;
    padding-left: 10px;
}
#roomupdateform .roomupdateformdiv{
	padding-top: 20px;
}

  #roomupdateform .service-container,.image-container {
        display: flex;
        flex-wrap: wrap;
    }
   #roomupdateform .servicediv{
        width: 25%; /* 4개씩 한 줄에 배치 */
        box-sizing: border-box;
        padding: 10px;
        display: flex;
       align-items: center;
    }
  #roomupdateform .image-item{
        box-sizing: border-box;
        padding: 10px;
        margin-top: 10px;
    }
   #roomupdateform .checkboxspan {
        margin-left: 5px;
    }
  #roomupdateform .editspan{
    width: 200px;
    border:0px solid red;
    display: inline-block;
    text-align: center;
    height: 30px;
    font-weight: bold;
    }
    
   #roomupdateform .address-container {
            display: flex;
            align-items: center;
        }

  #roomupdateform .editspan {
            margin-right: 10px;
        }

  #roomupdateform .addrinput {
            margin-bottom: 5px;
        }
  #roomupdateform .textarea-container{
        display: flex;
        align-items: center;
        }
        
  #roomupdateform .miribogibtn{
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
 #roomupdateform .miribogiimg{
     margin-top: 10px;
     height: 350px;
     width: 300px;
     max-width: 100%;
     display: block;
     margin: 10PX;
    }
  #roomupdateform .miribogidiv{
    	position: relative;
    	display: inline-block;
    }
    #roomupdatebtn{
		width: 250px;
		height: 50px;
		background-color: white;
		font-size: 15pt;
		background-color: #05141F;
		color: white;
		margin-top: 5%;
		cursor: pointer;
		margin-bottom: 5%;
    }
</style>
<body>


	<div id="wrap">
		<div id="roomupdateform">
			<div class="center">
				<div class="roomupdateformdiv">
					<form action="update" method="post" enctype="multipart/form-data" id="roomupform">
					<input type="hidden" value="${rdto.room_id }" name="room_id">
						<div>
							<span class="editspan">호스트 이름/이메일</span>${memberemail }
						</div>
						<div>
							<span class="editspan">연락처</span>
							<input type="text" value="${rdto.room_hp }" name="room_hp" required="required">
						</div>
						<div>
							<span class="editspan">숙소이름</span> 
							<input type="text" value=" ${rdto.room_name}" name="room_name" required="required">
						</div>
						<div>
							<span class="editspan">가격</span>
							<input type="text" value="${rdto.room_price}" name="room_price" required="required">
						</div>
						<div>
							<span class="editspan">최소인원</span>
							<input type="number" value="${rdto.room_min_capacity}" name="room_min_capacity" style="width: 50px;">
							<span class="editspan">최대인원</span>
							<input type="number" value="${rdto.room_max_capacity}" name="room_max_capacity" style="width: 50px;"> 
						</div>
						<div class="address-container">
							<span class="editspan">주소</span>
											<div class="address-inputs">
												<input type="text" class="addrinput" id="sample6_postcode" placeholder="우편번호" style="width: 150px;">
												<input type="button" class="addrinput" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 147px;"><br>
												<input type="text" class="addrinput" id="room_address" placeholder="주소" required="required" name="room_address" value="${rdto.room_address}"
												style="width: 300px;" required="required">
												<input type="text" class="addrinput" id="sample6_detailAddress" placeholder="상세주소" required="required" value="${rdto.room_address_detail}"
												name="room_address_detail" style="width: 300px;" required="required">
												<input type="hidden" id="room_region" name="room_region">
											</div>
						</div>
						<div class="textarea-container">
							<div class="editspan">디테일 설명</div>
							<textarea style="width: 500px; height: 250px; border: 1px solid #ccc; padding-left: 10px;" name="room_detail" required="required">
								${rdto.room_detail }
							</textarea>
						</div><br>
						<div>
							<span class="editspan">서비스</span>
						</div>
						<div class="service-container">
						<c:forEach var="service" items="${services}">
						    <div class="servicediv">
						        <input type="checkbox" value="${service}" class="service" name="room_service[]"
						               <c:if test="${fn:contains(rdto.room_service, service)}">checked</c:if>>
						        <span class="checkboxspan">${service}</span>
						    </div>
						</c:forEach>
						</div><br>
						<div>
							<span class="editspan">사진</span>
							<input type="file" id="image_photo" multiple="multiple" accept="image/*"  name="image_upload" onchange="previewImages(event)"
							style="padding-top: 5px;">
							<span>(사진을 선택하지 않을시 기존의 사진이 유지됩니다)</span>
						</div>
						<div id="imagePreviewContainer" class="image-container">
			        <c:forEach var="img" items="${images}">
			            <div class="image-item" >
			                <img src="${img.image_photo}" style="width:300px;height: 350px;">
			            </div>
			        </c:forEach>
			       </div>
			       <div id="updateroomimage"></div>
			       <div align="center">
			       	<button type="submit" id="roomupdatebtn">수정하기</button>
			       </div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
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
                    const imageItem = document.createElement('div');
										imageItem.classList.add('image-item');
										imageItem.appendChild(img);
					
										previewContainer.appendChild(imageItem);
                }
                reader.readAsDataURL(file);
            }
        }
    });
    
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
					document.getElementById("sample6_detailAddress").value = extraAddr;
				} else {
					document.getElementById("sample6_detailAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("room_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	};

	// 이미지 업로드시 미리보기 생성 및 동기화
	    function previewImages(event) {
		$("#updateroomimage").show();
		$("#imagePreviewContainer").hide();
        const imagePreviewList = document.getElementById('updateroomimage');

	    // eYzyqx 클래스를 가진 li 요소들을 선택하여 초기화합니다.
	    const itemsToRemove = imagePreviewList.querySelectorAll('div.miribogidiv');
	    itemsToRemove.forEach(item => {
	        item.remove(); // 요소를 제거하거나 다른 초기화 작업을 수행할 수 있습니다.
	    });
        const files = event.target.files;

        // 파일을 읽고 미리보기를 생성합니다.
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
                        // 선택한 파일 목록에서 해당 파일을 제거합니다.
                        const newFiles = Array.from(event.target.files).filter((f, i) => i !== index);

                        // 변경된 파일 목록으로 새 FileList 객체를 생성합니다.
                        const newFileList = new DataTransfer();
                        newFiles.forEach(f => newFileList.items.add(f));

                        // input 요소의 files 속성을 업데이트합니다.
                        event.target.files = newFileList.files;

                        // 변경된 files로 다시 미리보기를 생성합니다.
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
    }

	</script>
</body>
</html>