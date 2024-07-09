<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<title>TRIP NEST</title>
<style>
#findList .bi-heart-fill{
color: rgba(255, 255, 255, 0.7);
    border-radius: 100px;
    position: absolute;
			bottom: 10px; /* 이미지 내부에서 아이콘의 상단 위치 */
			right: 10px; /* 이미지 내부에서 아이콘의 오른쪽 위치 */
			font-size: 18px; /* 아이콘 크기 */
}
#findList .img{
position: relative;
display: inline-block;
}
#findList .red{
	color: rgba(255, 0, 0, 0.6);
}
</style>
<body>
<div id="wrap">
	<div id="findList">
		<div class="title" data-aos="fade-up">
			<a class="title2">Find</a>
		</div>
		<div class="list">
			<c:forEach items="${roomDtoList}" var="room">
				<a href="list/detail?room_id=${room.room_id }"
				   class="block">
					<div class="img">
						<c:choose>
							<c:when test="${room.image_photo != null}">
								<img alt="" src="${room.image_photo}"><i class="bi bi-heart-fill" room_id="${room.room_id}"></i>
							</c:when>
							<c:otherwise>
								<!-- 기본 이미지 추가하기 -->
								<img alt="" src="https://finaltripnest0613.s3.ap-northeast-2.amazonaws.com/roomphoto/noimage.jpg" style="border: 1px solid #ddd;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="text_box">
						<div class="top">
							<p class="title">${room.room_name}</p>
							<p class="rating">
								<img alt="" src="../img/find/star.png"><span>${room.room_rating}</span>
							</p>
						</div>
						<div class="location">
							<span>${room.city} / ${room.district}</span>
						</div>
						<div class="standard">
							<span>기준${room.room_min_capacity }명(최대${room.room_max_capacity}명)</span>
						</div>
						<div class="price">
											<span><fmt:formatNumber value="${room.room_price}"
																	type="currency" /></span>
						</div>
					</div>
				</a>
			</c:forEach>

		</div>
	</div>
</div>




<%@ include file="../include/footer.jsp"%>
</body>
<script type="text/javascript">
$(function(){
	
	icon();
	
	var loginok="${sessionScope.loginok}";
	
	$(".bi-heart-fill").click(function(){
		
		event.stopPropagation(); // 이벤트 전파 방지
		   event.preventDefault();  // 기본 동작 방지
		
		if(loginok!="yes"){
			alert("로그인이 필요한 서비스입니다.");
			return;
		}else{
			var room_id=$(this).attr("room_id");
			var member_useremail="${sessionScope.myid}";
			var heart=$(this);
			//alert(room_id+","+member_useremail);

			
			$.ajax({
				type:"get",
				url:"/wishlist/count",
				data:{"room_id":room_id,"member_useremail":member_useremail},
				dataType:"json",
				success:function(res){
					
					//즐겨찾기 추가(count는 useremail과 room_id 일치했을 때 1이 나옴. 즉 위시리스트에 추가되지 않은 상태)
					if(res.count!=1){
						$.ajax({
							type:"post",
							url:"/wishlist/wishinsert",
							data:{"room_id":room_id,"member_useremail":member_useremail},
							dataType:"html",
							success:function(){
								alert("위시리스트에 추가되었습니다.");
								heart.addClass("red");
							}
						})
					}else{
						//이미 즐겨찾기에 추가되어 있는 경우 delete
						$.ajax({
							type:"get",
							url:"/wishlist/deletewish",
							data:{"room_id":room_id,"member_useremail":member_useremail},
							dataType:"html",
							success:function(){
								alert("위시리스트에 삭제되었습니다.");
								heart.removeClass("red");
							}
						})
						
					}
				}
			});
			
		}
		 

	});
	

});

function icon(){
    $(".bi-heart-fill").each(function() {
        var room_id = $(this).attr("room_id");
        var member_useremail = "${sessionScope.myid}";
        var heart = $(this);

        $.ajax({
            type: "get",
            url: "/wishlist/count",
            data: {"room_id": room_id, "member_useremail": member_useremail},
            dataType: "json",
            success: function(res) {
                if (res.count == 1) {
                    heart.addClass("red");
                }
            }
        });
    });
	
}
</script>
</html>