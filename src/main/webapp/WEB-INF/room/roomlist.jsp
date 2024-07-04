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
table  tr, td{
	border: 1px solid red;
}
</style>
<body>


	<div id="wrap">
		<div id="roomlist">
			<div class="center">
				<div>
				<input type="hidden" value="${memberId}" class="memid">
					<table id="roomTable">
					<thead>
						<tr>
							<td>숙소번호</td>
							<td>숙소이름</td>
							<td>위치</td>
							<td>상태</td>
							<td>비고</td>
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
	                    var s = '<tr>' +
	                        '<td>' + room.room_id + '</td>' +
	                        '<td>' + room.room_name + '</td>' +
	                        '<td>' + room.room_address + '</td>' +
	                        '<td>' + room.room_status + '</td>' +
	                        '<td>' +
	                            '<button type="button" class="roomdel" value="' + room.room_id + '">삭제</button>' +
	                            '<button type="button" class="roomedit" value="' + room.room_id + '" onclick="location.href=\'updateform?room_id=' + room.room_id + '\'">수정</button>' +
	                        '</td>' +
	                    '</tr>';
	                    tbody.append(s);
	                });
			}
		})
	};
	
	</script>
</body>
</html>