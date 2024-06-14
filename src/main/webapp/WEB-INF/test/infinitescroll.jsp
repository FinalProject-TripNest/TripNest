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
	padding: 120px 0;
}

#promotion_detail .block {
	width: calc(( 100% - 60px)/3);
	height: 500px;
	border: 1px solid red;
	position: static !important;
	margin-right: 30px;
	margin-bottom: 60px;
	overflow: hidden;
}

#promotion_detail .block:nth-child(3n) {
	margin-right: 0
}
/* //각 페이지 스타일 */
</style>
<body>
	<div id="wrap">
		<div id="promotion_detail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<div class="list">
					<a href="javascript:;" class="block"></a> <a href="javascript:;"
						class="block"></a> <a href="javascript:;" class="block"></a> <a
						href="javascript:;" class="block"></a> <a href="javascript:;"
						class="block"></a> <a href="javascript:;" class="block"></a>
				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
