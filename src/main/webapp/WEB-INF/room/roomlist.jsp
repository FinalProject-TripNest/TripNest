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
#roomlist table td{
	height: 40px;
	    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
    	vertical-align: middle;
}

#roomTable{
	margin: 0 auto;
}
#roomlist .roomlistdiv{
padding-top:20px;
padding-bottom: 5%;
}
#roomlist .servicelist{
    white-space: nowrap; /* 줄바꿈을 방지하여 한 줄에 표시 */
    overflow: hidden; /* 넘치는 부분 숨김 */
    text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
    max-width: 160px;
}
#roomlist .roomdel,.roomedit{
width: 70px;
background-color: #F8F8F8;
border: 1px solid #ccc;
cursor: pointer;
height: 30px;
margin: 5px;
}

#roomlist caption {
	margin-bottom: 20px;
	font-size: 20pt;
}
#roomlist .address{
white-space: nowrap; /* 줄바꿈을 방지하여 한 줄에 표시 */
overflow: hidden; /* 넘치는 부분 숨김 */
text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
max-width: 250px;
}
</style>
<body>


	<div id="wrap">
		<div id="roomlist">
			<div class="center">
				<div class="roomlistdiv">
				<input type="hidden" value="${memberId}" class="memid">
					<table id="roomTable">
					<caption align="top"><b>호스트님의 공간</b><br><span style="font-size: 12pt;">(해당 숙소를 클릭하면 상세페이지로 이동합니다.)</span> </caption>
					<thead>
						<tr align="center" style="background-color:#F8F8F8; ">
							<td width="80px;">숙소번호</td>
							<td width="200px;">숙소이름</td>
							<td width="250px;">위치</td>
							<td width="150px;">가격</td>
							<td width="100px;">서비스</td>
							<td width="100px;">상태</td>
							<td width="160px;">비고</td>
							<td><fmt:formatNumber value="" type="number"/> </td>
						</tr>
						</thead>
						<tbody>
						<!-- 여기에 list 옵니다 -->
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
	$(function(){
		list();
			
		 $(document).on('click', '.roomdel', function(){
				var room_id=$(this).val();
				//alert(id);
				var a=confirm("정말 삭제하시겠습니까?");
				
				if(a){
					$.ajax({
						type:"get",
						url:"/room/delete",
						data:{"room_id":room_id},
						dataType:"html",
						success:function(){
							alert("삭제되었습니다.");
							list();
				
						}
						
					})
				}
				

			});
		 
	});
	
	function list(){
		$.ajax({
			type:"get",
			url:"/room/myroomlist",
			dataType:"json",
			success:function(data){
	              var tbody = $('#roomTable tbody');
	                tbody.empty();
	                $.each(data, function(index, room){
	                	 var formattedPrice = new Intl.NumberFormat().format(room.room_price);
	                	
	                    var s = '<tr class="clickable-row" data-url="/find/list/detail?room_id=' + room.room_id + '">' +
	                        '<td align="center">' + room.room_id + '</td>' +
	                        '<td  align="center">' + room.room_name + '</td>' +
	                        '<td class="address">' + room.room_address +'&nbsp;'+room.room_address_detail +'</td>' +
	                        '<td align="center">'+formattedPrice+'</td>' +
	                        '<td class="servicelist">' + room.room_service + '</td>' +
	                        '<td align="center">' + room.room_status + '</td>' +
	                        '<td align="center">' +
	                            '<button type="button" class="roomdel" value="' + room.room_id + '">삭제</button>' +
	                            '<button type="button" class="roomedit" value="' + room.room_id + '" onclick="location.href=\'updateform?room_id=' + room.room_id + '\'">수정</button>' +
	                        '</td>' +
	                    '</tr>';
	                    tbody.append(s);
	                });
			}
		})
	};
	// jQuery로 각 행에 클릭 이벤트 추가
	$(document).on('click', '.clickable-row', function() {
	    window.location = $(this).data('url');
	});

	// 버튼 클릭 시 이벤트 전파를 막아 행 클릭 이벤트가 발생하지 않도록 합니다.
	$(document).on('click', '.roomdel, .roomedit', function(event) {
	    event.stopPropagation();
	});
	</script>
</body>
</html>