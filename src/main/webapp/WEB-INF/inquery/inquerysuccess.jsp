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
.inquerydiv{
	width: 60%;
	margin: 0 auto;
	padding: 10%;
}
.inqueryspan{
	font-size: 2em;

}
.inquerybtn1,.inquerybtn2{
	margin: 10%;
	width: 100px;
	height: 50px;
	border: 1px solid gray;
	cursor: pointer;
}
.inquerybtn2{
	background-color: #05141F;
	color: white;
}
.inquerybtn1{
	background-color: white;
}
i.bi-envelope-paper{
	font-size: 2.5em;
}
</style>
<body>


	<div id="wrap">
		<div id="inquerysuccess">
			<div class="center">
				<div class="inquerydiv" align="center">
					<span><i class="bi bi-envelope-paper"></i></span><br><br><br>
					<span class="inqueryspan"><b>1:1문의가 정상적으로 접수 되었습니다.</b></span><br><br>
					<span>문의사항에 대한 답변은 <br><br>마이페이지>1:1문의에서 확인하실 수 있습니다.</span><br><br>
						<div>
							<button type="button" onclick="location.href='/'" class="inquerybtn1">메인 페이지</button>&nbsp;&nbsp;
							<button type="button" onclick="location.href='/mypage/main#myinquery'" class="inquerybtn2">1:1문의 목록</button>
						</div>
					
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>

	</script>
</body>
</html>