<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/adminpageheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>TRIP NEST</title>
<style>
.admin-r-table{
	margin: 0 auto;
	width: 80%;
	height: 80%;
}
.admin-r-table tr,td{
	border: 1px solid gray;
	vertical-align: middle;
}

.Click-here {
  cursor: pointer;
  width: 180px;
  text-align: center;
  font-size:16px;
  padding: 18px 0;
  margin: 0 auto;
}
.custom-model-main {
  text-align: center;
  overflow: hidden;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0; /* z-index: 1050; */
  -webkit-overflow-scrolling: touch;
  outline: 0;
  opacity: 0;
  -webkit-transition: opacity 0.15s linear, z-index 0.15;
  -o-transition: opacity 0.15s linear, z-index 0.15;
  transition: opacity 0.15s linear, z-index 0.15;
  z-index: -1;
  overflow-x: hidden;
  overflow-y: auto;
}

.model-open {
  z-index: 99999;
  opacity: 1;
  overflow: hidden;
}
.custom-model-inner {
  -webkit-transform: translate(0, -25%);
  -ms-transform: translate(0, -25%);
  transform: translate(0, -25%);
  -webkit-transition: -webkit-transform 0.3s ease-out;
  -o-transition: -o-transform 0.3s ease-out;
  transition: -webkit-transform 0.3s ease-out;
  -o-transition: transform 0.3s ease-out;
  transition: transform 0.3s ease-out;
  transition: transform 0.3s ease-out, -webkit-transform 0.3s ease-out;
  display: inline-block;
  vertical-align: middle;
  width: 600px;
  margin: 30px auto;
  max-width: 97%;
}
.custom-model-wrap {
  display: block;
  width: 100%;
  position: relative;
  background-color: #fff;
  border: 1px solid #999;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 6px;
  -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  background-clip: padding-box;
  outline: 0;
  text-align: left;
  padding: 20px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  max-height: calc(100vh - 70px);
	overflow-y: auto;
}
.model-open .custom-model-inner {
  -webkit-transform: translate(0, 0);
  -ms-transform: translate(0, 0);
  transform: translate(0, 0);
  position: relative;
  z-index: 999;
}
.model-open .bg-overlay {
  background: rgba(0, 0, 0, 0.6);
  z-index: 99;
}
.bg-overlay {
  background: rgba(0, 0, 0, 0);
  height: 100vh;
  width: 100%;
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  z-index: 0;
  -webkit-transition: background 0.15s linear;
  -o-transition: background 0.15s linear;
  transition: background 0.15s linear;
}
.close-btn {
  position: absolute;
  right: 0;
  top: -30px;
  cursor: pointer;
  z-index: 99;
  font-size: 30px;
  color: #fff;
}

@media screen and (min-width:800px){
	.custom-model-main:before {
	  content: "";
	  display: inline-block;
	  height: auto;
	  vertical-align: middle;
	  margin-right: -0px;
	  height: 100%;
	}
}
@media screen and (max-width:799px){
  .custom-model-inner{margin-top: 45px;}
}
.adminhold{
	width: 100px;
	height: 30px;
	background-color: #05141F;
	color: white;
}
.adminacc{
	width: 100px;
	height: 30px;
	background-color: white;
	border: 1px solid #05141F;
}
#room_photo{
	width: 200px;
	height: 200px;
}

.modal-open{
 overflow: hidden;
    position: fixed;
    width: 100%;
}

</style>
<body>


	<div id="wrap">
		<div id="adminrooms">
			<div class="center">
				<div class="admin-room">
					<table class="admin-r-table">
						<tr style="height:50px;" align="center">
							<td width="50">번호</td>
							<td width="200">숙소이름</td>
							<td width="300">위치</td>
							<td width="150">숙소가격</td>
							<td width="100">평점</td>
							<td width="100">승인/미승인</td>
						</tr>
						<c:if test="${totalCount>0 }">
							<c:forEach var="rlist" items="${list }">
								<tr>
									<td align="center">${no }</td>
									<c:set var="no" value="${no-1 }"/>
									<td>
										<div class="Click-here" id="Click-here">${ rlist.room_name}</div>
										<input type="hidden" value="${rlist.room_id }" name="room_id" class="r_id">
									</td>
									<td>${ rlist.room_address}</td>
									<td align="center">
										<fmt:formatNumber value="${ rlist.room_price}"/>원
									</td>
									<td align="center">${ rlist.room_rating}</td>
									<td align="center" class="roomstatus">
										<c:if test="${rlist.room_status=='no'}">
											미승인
										</c:if>
										<c:if test="${rlist.room_status=='승인'}">
											승인
										</c:if>
										<c:if test="${rlist.room_status=='보류'}">
											보류
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<!-- 모달창 -->

<div class="custom-model-main">
    <div class="custom-model-inner">        
    <div class="close-btn">×</div>
        <div class="custom-model-wrap">
            <div class="pop-up-content-wrap">
            	<input type="text" id="room_id">
            	<div>[숙소이름]&nbsp;&nbsp;<span id="room_name"></span></div><br>
            	<div>[연락처]&nbsp;&nbsp;<span id="room_hp"></span></div><br>
            	<div>[숙소가격]&nbsp;&nbsp;<span id="room_price"></span>원</div><br>
            	<div>[숙소주소]&nbsp;&nbsp;<span id="room_address"></span></div><br>
            	<div id="map" style="width: 400px; height: 300px;"></div>
            	<div>[제공되는 서비스]&nbsp;&nbsp;<br><span id="room_service"></span></div><br>
            	<div>[수용가능 인원]&nbsp;&nbsp;최소 <span id="room_min"> </span> 명 / 최대 <span id="room_max"></span>명</div><br>
            	<div>[숙소에 관하여]&nbsp;&nbsp;<br><span id="room_detail"></span></div><br>
            	<div >[등록한 사진]
            		<div id="imageGallery"></div>
            	</div><br>
            	
            	<div align="center">     	
            		<button type="button" class="adminacc">승인</button>
            		<button type="button" class="adminhold">보류</button>   		
            	</div>
            </div>
        </div>  
    </div>  
    <div class="bg-overlay"></div>
</div>
<!-- 페이징 -->
<div style="margin: 0 auto; width: 80%; text-align: center; padding-top: 5%;">
	<ul  class="pagination justify-content-center">
		
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<li class="page-item">
			<a class="page-link" href="roomlist?currentPage=${startPage-1 }"
			style="color: black;">이전</a>
			</li>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<li class="page-item active" style="display: inline; margin-right: 5px;">
					<a class="page-link" href="roomlist?currentPage=${pp }">${pp }</a>
				</li>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<li class="page-item" style="display: inline; margin-right: 5px;">
					<a class="page-link" href="roomlist?currentPage=${pp }">${pp }</a>
				</li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<li class="page-item">
				<a class="page-link" href="roomlist?currentPage=${endPage+1}"
				style="color: black;">다음</a>
			</li>
		</c:if>
	</ul>
</div>




	<%@ include file="../include/footer.jsp"%>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c890ddd8c7f2607257a2db412525f318&libraries=services"></script>
	<script>
	
		var map;
    var geocoder = new kakao.maps.services.Geocoder();
	
		$(function(){
						
			
			$(".Click-here").on('click', function() {
				 $(".custom-model-main").addClass('model-open');
				 $("body").addClass('modal-open');
					 var room_id = $(this).closest('tr').find('.r_id').val();
				  
					 	$.ajax({
					 		type:"get",
					 		url:"/admin/roomdetail",
					 		dataType:"json",
					 		data:{"room_id":room_id},
					 		success:function(res){
					 			//alert("성공");
					 			var formattedPrice = res.roomprice.toLocaleString();
					 			
					 	       if (res.roomstatus === '보류') {
					 	            // 보류 상태일 때 처리
					 	            $(".adminacc").show(); // 예를 들어 버튼을 보이게 함
					 	            $(".adminhold").hide(); // 다른 버튼은 숨김 처리
					 	        } else if (res.roomstatus === '승인') {
					 	            // 승인 상태일 때 처리
					 	            $(".adminacc").hide();
					 	            $(".adminhold").show();
					 	        }else{
					 	        	 $(".adminacc").show();
					 	        	 $(".adminhold").show();
					 	        }
					 			
					 			
					 			$("#room_name").text(res.roomname);
					 			$("#room_price").text(formattedPrice);
					 			$("#room_address").text(res.roomaddr);
					 			$("#room_service").text(res.roomservice);
					 			$("#room_min").text(res.roommin);
					 			$("#room_max").text(res.roommax);
					 			$("#room_detail").text(res.roomdetail);
					 			$("#room_hp").text(res.roomhp);
					 			$("#room_id").val(res.roomid);
					 			
					 			//console.log("Image URL: " + res.roomimg);
					      //$("#room_photo").attr("src", res.roomimg);
					      
					      
					      
					       var imageGallery = $('#imageGallery');
                    imageGallery.empty(); // 이미지 갤러리 초기화
                    
                        res.photoList.forEach(function(photoUrl) {
                            var img = $('<img>').attr('src', photoUrl).css({'width': '170px', 'height': '200px', 'margin': '5px'});
                            imageGallery.append(img);
                        });
					  
					 			
					 			 initializeMap(res.roomaddr);
					 		}
					 	})
				}); 
			
			
		    // Function to initialize Kakao Map
	        function initializeMap(address) {
	            var mapContainer = document.getElementById('map');
	            var mapOption = {
	                center: new kakao.maps.LatLng(37.566826, 126.9786567), // Seoul center
	                level: 3
	            };
	            map = new kakao.maps.Map(mapContainer, mapOption);

	            // Search address and add marker
	            geocoder.addressSearch(address, function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    map.setCenter(coords);
	                    var marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords
	                    });
	                }
	            });
	        }
			
			
			
			
				$(".close-btn, .bg-overlay").click(function(){
					$("body").removeClass('modal-open');
				  $(".custom-model-main").removeClass('model-open');
				  var mapContainer = document.getElementById('map');
		            mapContainer.innerHTML = "";
				});
				
				
						//숙소승인
				    $(document).on('click', '.adminacc', function() {
				        var room_id = $("#room_id").val();
				        
				        $.ajax({
				            type: "post",
				            url: "/admin/roomacc",
				            data: {"room_id": room_id},
				            dataType: "html",
				            success: function(response) {
				                alert("승인되었습니다.");
				                $(".custom-model-main").removeClass('model-open');
				                updateRoomList();
				            }
				        });
				    });
				    
						//숙소보류-노출안됨. 수정해서 다시 컨펌 받아야하는 상태
				    $(document).on('click','.adminhold',function(){
				    	var room_id = $("#room_id").val();
				    	
				    	  $.ajax({
					            type: "post",
					            url: "/admin/roomhold",
					            data: {"room_id": room_id},
					            dataType: "html",
					            success: function(response) {
					                alert("보류되었습니다.");
					                $(".custom-model-main").removeClass('model-open');
					                updateRoomList();
					            }
					        });
				    	
				    });
				    
						//room_status의 상태가 바로바로 list에 반영될 수 있게끔
				    function updateRoomList() {
				        $.ajax({
				            type: "get",
				            url: "/admin/roomlist", // 숙소 목록을 가져오는 URL
				            dataType: "html",
				            success: function(response) {
				            	  var $response = $(response);
				                  
				                  // 각 .roomstatus 요소를 순회하며 데이터를 업데이트
				                  $(".roomstatus").each(function(index) {
				                      var roomStatus = $response.find(".roomstatus").eq(index).text();
				                      $(this).text(roomStatus);
				                  });
				            }
				        });
				    }
				    
				
		})
	</script>
</body>
</html>