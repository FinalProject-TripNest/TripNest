<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	margin-top: 50px;
}
h1 {
	color: #4CAF50;
	}
p {
	font-size: 1.2em;
}
</style>
<body>


	<div id="wrap">
		<div id="member_registerSuccess">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<h1>회원가입 성공</h1>
			    <p>TRIP NEST에 회원가입이 성공적으로 완료되었습니다.</p>
			    <p>로그인 페이지로 이동하여 로그인을 진행하세요.</p>
			    <a href="${pageContext.request.contextPath}/login">로그인 페이지로 이동</a>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
	//각 페이지 자바스크립트

	//각 페이지 자바스크립트
	</script>
</body>
</html>