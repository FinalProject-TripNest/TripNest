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
#admin_promtion {
	padding-bottom: 120px;
}

#admin_promtion .center {
	width: 100%;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	line-height: 26px;
	border: 1px solid #e0e0e0;
	margin-top: 20px;
}

th, td, th {
	text-align: center;
	vertical-align: middle;
}

th, td {
	border: 1px solid #e0e0e0;
	padding: 20px;;
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
	margin-right: 10px;
}

td button.update {
	background-color: #2b7fb1;
}

td button.update:hover {
	background-color: #306d91;
}

td button:last-child {
	margin-right: 0;
}

td .btn_box {
	display: flex;
}

td button:hover {
	background-color: #c82333;
}

img {
	width: 160px;
}

.pop_up {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 9999;
	align-items: center;
	justify-content: center;
	display: none;
}

.pop_up.active {
	display: flex;
}

.pop_up .dimd {
	background-color: rgb(87 87 87/ 80%);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
}

.pop_up .main {
	background-color: #fff;
	width: 800px;
	z-index: 2;
	padding: 20px;
	border-radius: 10px;
}

.pop_up form>div {
	display: flex;
	align-items: center;
}

.pop_up form>div {
	margin-top: 20px;
}

.pop_up form>div:first-child {
	margin-top: 0;
}

.pop_up form>div .update_btn {
	background-color: #668b2c;
	color: #ffffff;
	border: none;
	padding: 14px 20px;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
	width: 100px;
	display: flex;
	justify-content: center;
}

.pop_up form>div .update_btn:hover {
	background-color: #5f773b;
}

.pop_up form>div label {
	margin-right: 20px;
}

.pop_up form>div input.file {
	display: none;
}

.pop_up form>div input {
	height: 40px;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 10px;
	width: 100%;
}

.pop_up form>div textarea.content {
	resize: none;
	border: 1px solid #ddd;
	width: 100%;
	height: 200px;
	border-radius: 10px;
	padding: 20px;
	line-height: 22px;
	border-radius: 10px;
}

.pop_up form>div .btn input {
	width: 200px;
}

.pop_up form>div.btn {
	justify-content: center;
}

.pop_up form>div.btn  input {
	width: 160px;
	cursor: pointer;
	color: #fff;
	height: 50px;
}

.pop_up.update_pop form>div.btn  input {
	background-color: #2b7fb1;
}

.pop_up.update_pop form>div.btn  input:hover {
	background-color: #306d91;
}

.pop_up.insert_pop form>div.btn  input {
	background-color: #52b540;
}

.pop_up.insert_pop form>div.btn  input:hover {
	background-color: #3c912d;
}

.pop_up form img.photo {
	width: 120px;
	height: 120px;
	object-fit: cover;
	margin-right: 20px;
}

.insert_btn div {
	background-color: #52b540;
	color: #ffffff;
	border: none;
	padding: 10px 15px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	margin-right: 10px;
	width: 58px;
}

.insert_btn div:hover {
	background-color: #3c912d;
}
</style>
<body>
	<div id="wrap">
		<div id="admin_promtion">
			<div class="center">
				<div class="insert_btn">
					<div>등록</div>
				</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>사진</th>
							<th>제목</th>
							<th>내용</th>
							<th style="width: 140px">작성 날짜</th>
							<th style="width: 140px">쿠폰</th>
							<th style="width: 140px">기사 관리</th>
						</tr>
						<c:forEach items="${promotion}" var="list" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td><img alt="" src="${list.promotion_photo}"
									class="data_photo"></td>
								<td>${list.promotion_title}</td>
								<td>${list.promotion_content}</td>
								<td><fmt:formatDate value="${list.promotion_date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${list.promotion_content}</td>
								<td>
									<div class="btn_box">
										<button type="button" class="btn update"
											name="${list.promotion_id }">수정</button>
										<button type="button" class="btn delete"
											name="${list.promotion_id }">삭제</button>
									</div>
								</td>
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

	<div class="update_pop pop_up">
		<div class="dimd"></div>
		<div class="main">
			<form action="/admin/promotionUpdate" method="post">
				<input type="hidden" name="promotion_id" id="promotion_id">
				<div>
					<label>사진</label> <img alt="" src="" class="photo"
						id="update_photo"> <input type="file" name="promotion_photo"
						class="file" onchange="readURL(this);">
					<div class="update_btn">file</div>
				</div>
				<div>
					<label>제목</label> <input type="text" name="promotion_title"
						class="title">
				</div>
				<div>
					<label>내용</label>
					<textarea name="promotion_content" class="content"></textarea>
				</div>
				<div class="btn">
					<input type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
	<div class="insert_pop pop_up">
		<div class="dimd"></div>
		<div class="main">
			<form action="/admin/promotionInsert" method="post">
				<input type="hidden" name="promotion_id">
				<div>
					<label>사진</label> <img alt=""
						src="https://finaltripnest0613.s3.ap-northeast-2.amazonaws.com/roomphoto/noimage.jpg"
						class="photo" id="insert_photo"> <input type="file"
						name="promotion_photo" class="file" onchange="readURL(this);">
					<div class="update_btn">file</div>
				</div>
				<div>
					<label>제목</label> <input type="text" name="promotion_title"
						class="title">
				</div>
				<div>
					<label>내용</label>
					<textarea name="promotion_content" class="content"></textarea>
				</div>
				<div class="btn">
					<input type="submit" value="등록">
				</div>
			</form>
		</div>
	</div>


	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		$("td button.update").click(
				function() {
					$(".update_pop").addClass("active");
					$("html").addClass("scroll");
					var promotion_id = $(this).attr("name");
					$.ajax({
						type : "post",
						dataType : "json",
						url : "/admin/adminPromotionUpdate",
						data : {
							"promotion_id" : promotion_id
						},
						success : function(res) {
							$(".update_pop input.title").val(
									res.promotion_title);
							$(".update_pop textarea.content").val(
									res.promotion_content);
							$(".update_pop #promotion_id")
									.val(res.promotion_id);
							$(".update_pop img.photo").attr("src",
									(res.promotion_photo));
						}
					});
				});
		$(".pop_up .dimd")
				.click(
						function() {
							$(
									".insert_pop form>div input,.insert_pop form>div textarea")
									.val("");
							$(".pop_up").removeClass("active");
							$("html").removeClass("scroll");
						});

		$(".update_pop form>div .update_btn").click(function() {

			$(".update_pop form>div input.file").click();
		});

		$(".update_pop form>div input.file").change(function() {
			var input = this;
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#update_photo').attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			}
		});

		$(".insert_pop form>div .update_btn").click(function() {

			$(".insert_pop form>div input.file").click();
		});

		$(".insert_btn div").click(function() {
			$(".insert_pop").addClass("active");
		});

		$(".pop_up.insert_pop form>div.btn input")
				.click(
						function() {
							var formData = new FormData();
							var promotion_photo = $(".insert_pop form input.file")[0].files[0];
							var promotion_title = $(
									".insert_pop form input.title").val();
							var promotion_content = $(
									".insert_pop form textarea.content").val();
							/* alert(journal_photo); */
							formData.append("photo", promotion_photo);
							formData.append("promotion_title", promotion_title);
							formData.append("promotion_content",
									promotion_content);

							$.ajax({
								type : "POST",
								url : "/admin/promotionInsert",
								data : formData,
								dataType : "json",
								contentType : false,
								processData : false,
								success : function(data) {
									location.reload();
								}
							});

							return false;
						});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('insert_photo').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".btn_box .delete").click(function() {
			var promotion_id = $(this).attr("name");

			$.ajax({
				type : "GET",
				url : "/admin/promotionDelete",
				dataType : "json",
				data : {
					"promotion_id" : promotion_id
				},
				success : function(res) {
					location.reload();
				}
			});
		});

		$(".pop_up.update_pop form>div.btn input")
				.click(
						function() {
							var formData = new FormData();
							var promotion_photo = $(".update_pop form input.file")[0].files[0];
							var promotion_title = $(
									".update_pop form input.title").val();
							var promotion_content = $(
									".update_pop form textarea.content").val();
							var promotion_id = $("#promotion_id").val();

							formData.append("newFile", promotion_photo);
							formData.append("promotion_title", promotion_title);
							formData.append("promotion_content",
									promotion_content);
							formData.append("promotion_id", promotion_id);

							$.ajax({
								type : "post",
								dataType : "json",
								contentType : false,
								processData : false,
								url : "/admin/promotionUpdate",
								data : formData,
								success : function(res) {
									/* alert(res); */
									location.reload();
								}
							});

							return false;
						});
	</script>

</body>
</html>