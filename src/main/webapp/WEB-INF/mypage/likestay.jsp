<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<title>TRIP NEST</title>
<style>
.mylikestayphoto{
	width: 270px;
	height:270px;
	border-radius: 10px;
}
#mylikestaydiv{
	display: flex;
	flex-wrap: wrap; /* 줄 바꿈 설정 */
    gap: 20px;
}
#likestay .mylikestaydate {
            width: 100%;
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
        }
#likestay .mylikestaydiv {
            position: relative;
            display: inline-block;
        }
#likestay .bi-heart-fill{
color: rgba(255, 255, 255, 0.7);
    border-radius: 100px;
    position: absolute;
			bottom: 40px; /* 이미지 내부에서 아이콘의 상단 위치 */
			right: 30px; /* 이미지 내부에서 아이콘의 오른쪽 위치 */
			font-size: 18px; /* 아이콘 크기 */
			cursor: pointer;
}
#likestay .mylikestaydiv{
position: relative;
display: inline-block;
padding: 20px;
}
#likestay .red{
	color: rgba(255, 0, 0, 0.6);
}
.mylikestayprice{
float: right;
}
#likestay b {
	font-size: 24px;
	margin-bottom: 20px;
	text-align: left;
}
</style>
<body>


	<div id="likestay" class="reservation-info">
		<b>관심스테이</b>
		<div id="mylikestaydiv">
			
		</div>
	</div>



	<script>
	 $(document).ready(function() {
	        list();
	    });
	
	
	$(document).on('click','.bi-heart-fill',function(){
		
		event.stopPropagation(); // 이벤트 전파 방지
		   event.preventDefault();  // 기본 동작 방지
		   
				var room_id = $(this).attr("room_id");
        var member_useremail = "${sessionScope.myid}";
        var heart = $(this);
        
      $.ajax({
			type:"get",
			url:"/wishlist/deletewish",
			data:{"room_id":room_id,"member_useremail":member_useremail},
			dataType:"html",
			success:function(){
				alert("위시리스트에 삭제되었습니다.");
				heart.removeClass("red");
				list();
			}
		});
	});
	
function list(){
	$.ajax({
		type:"get",
		url:"/wishlist/mywishlist",
		dataType:"json",
		success:function(data){
			var s="";
			 $.each(data, function(date, items) {
                 s += "<span class='mylikestaydate'>" + date + "</span>"; // 날짜 출력
                 $.each(items, function(i, res) {
                     s += "<div class='mylikestaydiv'>";
                     s += "<a href='/find/list/detail?room_id=" + res.room_id + "'>";
                     s += "<img src='" + res.image_photo + "' class='mylikestayphoto'>";
                     s += "<i class='bi bi-heart-fill'room_id='"+res.room_id+"'></i>";
                     s += "<br><span>" + res.room_name + "</span>/<span>" + res.room_region + "</span>";
                     s += "<span class='mylikestayprice'>" + res.room_price + "</span>";
                     s += "</a></div>";
                 });
             });
			$("#mylikestaydiv").html(s);
			 icon();
		}
		
	});
}
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
</body>
</html>