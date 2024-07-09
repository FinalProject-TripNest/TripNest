<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="${root }/img/common/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@latest/swiper-bundle.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<!-- Flatpickr CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="${root }/css/reset.css">
<link rel="stylesheet" href="${root }/css/style.css">
<link rel="stylesheet" href="${root }/css/searchbar.css">
<link rel="stylesheet" href="${root }/css/personnelmodal.css">
<link rel="stylesheet" href="${root }/css/search.css">
</head>
    
<c:set var="root" value="<%=request.getContextPath()%>" />
<header id="header">
	<a href="javascript:;" class="top_event">
		<div>
			<span>최대 4만원 할인 쿠폰받기</span>
		</div>
	</a>
	<nav>
		<div>
			<a class="logo" href="${root }/index"> <img alt=""
				src="${root }/img/common/logo.png">
			</a>
			<div class="select">
				<ul>
					<li id="openLocationSearch"><img alt="" src="${root }/img/common/header_location.png">
						<span>어디로 떠날까요?</span></li>
					<li id="openDateSearch"><img alt="" src="${root }/img/common/header_back.png">
						<span>언제 떠날까요?</span></li>

				</ul>
			</div>
			
			<form method="get" action="/find/search">
			    <div id="header_locationsearch" class="modal_location">
			        <div class="modal-content_location">
			            <span class="close" id="closeLocationSearch">&times;</span>
			            <input id="header_address" type="text" placeholder="위치 검색" name="address" value="${address }">
					    <input id="header_latitude" type="hidden" name="latitude" value="${latitude }">
					    <input id="header_longitude" type="hidden" name="longitude" value="${longitude }">
			            <button type="submit">검색</button>
			        </div>
			    </div>
			    
			    <div id="header_datesearch" class="modal_date">
			        <div class="modal-content_date">
			            <span class="close" id="closeDateSearch">&times;</span>
			            <input id="header_checkdate" type="text" placeholder="날짜를 선택하세요" value="${defaultDate }">
			            <button type="submit">검색</button>
			        </div>
			    </div>
			    
			    <input id="header_checkin" type="hidden" name="checkin" value="${checkin }">
			    <input id="header_checkout" type="hidden" name="checkout" value="${checkout }">
			    <input id="header_personnal_count" type="hidden" name="personnelCount" value="${personnelCount }">
			</form>
			
			<div class="menu">
				<ul class="main">
					<li><a href="${root }/find/list">FIND NEST</a></li>
					<li><a href="${root }/promotion/list">PROMOTION</a></li>
					<li><a href="${root }/journal/list">JOURNAL</a></li>
				</ul>
				<ul class="sub">
					<c:choose>
                        <c:when test="${sessionScope.loginok == null}">
                            <li><a href="${root}/login/loginform">LOGIN</a></li>
                            <li><a href="${root}/member/register">SIGN UP</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${root}/login/logout">LOGOUT</a></li>
                            <li><a href="${root}/mypage">MY PAGE</a></li>
                        </c:otherwise>
                    </c:choose>
				</ul>
			</div>
		</div>
	</nav>
</header>


<!-- 탑버튼 -->
<div class="top_btn"></div>
<!-- //탑버튼 -->