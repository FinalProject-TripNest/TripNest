
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
#admin_review {
	padding-bottom: 120px;
}

#admin_review .center {
	width: 100%;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td, th {
	text-align: center;
}

th, td {
	border: 1px solid #e0e0e0;
	padding: 12px 15px;
}

th {
	text-transform: uppercase;
	letter-spacing: 0.1em;
	font-size: 14px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

td button {
	background-color: #dc3545;
	color: #ffffff;
	border: none;
	padding: 10px 15px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

td button:hover {
	background-color: #c82333;
}
</style>
<body>


	<div id="wrap">
		<div id="admin_review">
			<div class="center">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>숙소 이름</th>
							<th>이메일</th>
							<th>내용</th>
							<th>평점</th>
							<th>작성 날짜</th>
							<th>리뷰 관리</th>
						</tr>
						<c:forEach items="${review}" var="list" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${list.room_name}</td>
								<td>${list.member_useremail}</td>
								<td>${list.review_content}</td>
								<td>${list.review_rating}</td>
								<td><fmt:formatDate value="${list.review_date}"
										pattern="yyyy-MM-dd" /></td>
								<td><button type="button" class="btn"
										name="${list.review_id }">삭제</button></td>
							</tr>
						</c:forEach>
					</thead>
					<tbody>
						<tr>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<%@ include file="../include/footer.jsp"%>
	<script>
		$("button.btn").click(function() {
			var review_id = $(this).attr("name");

			$.ajax({
				type : "GET", // POST 방식으로 변경
				url : "/admin/reviewDelete",
				dataType : "html",
				data : {
					"review_id" : review_id
				},
				success : function(response) {
					location.reload();
				}
			});
		});
	</script>



</body>
</html>

