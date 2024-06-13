<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<!-- 외부 CSS 파일 포함 -->
<style>
/* 각 페이지 스타일 */
#promotion_detail .list {
	display: flex;
	flex-wrap: wrap;
	height: auto !important;
}

#promotion_detail .block {
	width: calc(( 100% - 60px)/3);
	height: 700px;
	border: 1px solid red;
	position: static !important;
	margin-right: 30px;
	margin-bottom: 60px;
	overflow: hidden;
}

#promotion_detail .block:nth-child(3n) {
	margin-right: 0
}


#promotion_detail .title{
    text-align: center;
    padding: 60px 0;
    justify-content: center;
}
#promotion_detail .title2{
	font-size: 20px;
    line-height: 33px;
    font-weight: 500;
    color: #000;
    border-bottom: 3px solid #000;
    text-transform: uppercase;
}

#promotion_detail .block img {
    width: 100%;
    height: 70%;
    object-fit: cover;
    display: block;
    margin-bottom: 20px;
}
/* //각 페이지 스타일 */
</style>
<body>
	<div id="wrap">
		<div id="promotion_detail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="title">
				<a class="title2">TRAVEL</a>
				</div>
				
				
				<div class="list">
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					123
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 
					<a href="javascript:;" class="block">
					<img alt="" src="../img/journal/test1.png">
					
					
					</a> 

				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
