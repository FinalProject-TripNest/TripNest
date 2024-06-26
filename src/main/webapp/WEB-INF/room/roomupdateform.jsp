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
</head>
<title>TRIP NEST</title>
<style>
.roomupdateformdiv input{
	border: 1px solid gray;
}

    .service-container,.image-container {
        display: flex;
        flex-wrap: wrap;
    }
    .servicediv{
        width: 25%; /* 4개씩 한 줄에 배치 */
        box-sizing: border-box;
        padding: 10px;
    }
    .image-item{
    		width: 20%;
        box-sizing: border-box;
        padding: 10px;
    }
    .checkboxspan {
        margin-left: 5px;
    }
</style>
<body>


	<div id="wrap">
		<div id="roomupdateform">
			<div class="center">
				<div class="roomupdateformdiv">
					<form action="update" method="post" enctype="multipart/form-data" id="roomupform">
						<div>
							<span>호스트 이름/이메일:</span>여기에 이름(${memberemail })
						</div>
						<div>
							<span>연락처</span>
							<input type="text" value="${rdto.room_hp }">
						</div>
						<div>
							<span>숙소이름:</span> 
							<input type="text" value=" ${rdto.room_name}">
						</div>
						<div>
							<span>가격:</span>
							<input type="text" value="${rdto.room_price }"> 
						</div>
						<div>
							<span>최소인원</span>
							<input type="number" value="${rdto.room_min_capacity}">
							<span>최대인원</span>
							<input type="number" value="${rdto.room_max_capacity}"> 
						</div>
						<div>
							<span>주소</span>
							<input type="text" value="${rdto.room_address }"><br>
							<span>상세주소</span>
							<input type="text" value="${rdto. room_address_detail}">
						</div>
						<div>
							<span>디테일 설명</span>
							<textarea style="width: 500px; height: 200px; border: 1px solid gray;">
								${rdto.room_detail }
							</textarea>
						</div>
						<div>
							<span>서비스</span>
						</div>
						<div class="service-container">
						<c:forEach var="service" items="${services}">
						    <div class="servicediv">
						        <input type="checkbox" value="${service}" class="service" name="room_service[]"
						               <c:if test="${fn:contains(rdto.room_service, service)}">checked</c:if>>
						        <span class="checkboxspan">${service}</span>
						    </div>
						</c:forEach>
						</div>
						<div>
							<span>사진</span>
							<input type="file" id="image_photo" multiple="multiple" accept="image/*"  name="image_upload">
						</div>
						<div id="imagePreviewContainer" class="image-container">
			        <c:forEach var="img" items="${images}">
			            <div class="image-item" >
			                <img src="${img.image_photo}" style="width:200px;height: 200px;">
			            </div>
			        </c:forEach>
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
                    previewContainer.appendChild(img);
                }
                reader.readAsDataURL(file);
            }
        }
    });
	</script>
</body>
</html>