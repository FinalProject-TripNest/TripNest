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
.rinsertsuccess{
	width: 70%;
	margin: 0 auto;
	padding: 10%;
}
.rinsertsuccessspan{
	font-size: 2em;

}
.rinsertbtn1,.rinsertbtn2{
	margin: 10%;
	width: 100px;
	height: 50px;
	border: 1px solid gray;
	cursor: pointer;
}
.rinsertbtn2{
	background-color: #05141F;
	color: white;
}
.rinsertbtn1{
	background-color: white;
}

i.bi-house-door{
	font-size: 2.5em;
}
</style>
<body>


	<div id="wrap">
		<div id="roominsertsuccess">
			<div class="center">
				<div class="rinsertsuccess" align="center">
					<span><i class="bi bi-house-door"></i></span><br><br>
					<span class="rinsertsuccessspan">회원님의 공간이 정상적으로 등록되었습니다.</span><br><br>
					<span>TRIP NEST의 호스트가 되신 것을 진심으로 환영합니다.</span><br><br>
					<span>등록하신 숙소는 마이페이지>숙소목록에서 확인하실 수 있습니다.</span><br><br>
					<span>(최소 24시간 이내에 검토 후에 게스트분들에게 노출이 됩니다.) </span>
					<div>
						<button type="button" class="rinsertbtn1">메인페이지</button>
						<button type="button" class="rinsertbtn2">숙소목록</button>
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