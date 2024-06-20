<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="../img/common/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
header#header .menu ul.main::after {
	display: none;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<header id="header">

	<nav>
		<div>
			<a class="logo" href="adminmain"> <img alt=""
				src="../img/common/logo.png">
			</a>

			<div class="menu">
				<ul class="main">
					<li><a href="${root }/admin/memberList">회원관리</a></li>
					<li><a href="${root }/admin/roomlist">숙소목록</a></li>
					<li><a href="${root }/admin/inquerylist">1:1문의</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>

<!-- 탑버튼 -->
<div class="top_btn"></div>
<!-- //탑버튼 -->