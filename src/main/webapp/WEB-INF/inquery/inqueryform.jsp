<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>TRIP NEST</title>
<style>
a.menu-item.myinquery {
	font-weight: 700;
}
</style>
<body>


	<div id="wrap">
		<div id="myPage">
			<div class="center" id="myInqueryForm">
				<div class="mypage_info">
					<div class="title">
						<p>
							<span>${myname}</span>님반가워요!
						</p>
					</div>
				</div>
				<div class="separator"></div>
				<div class="content_wrapper">
					<%@ include file="../include/mypqge_menu.jsp"%>
					<div class="mypage_content" id="mypage_content">
						<form action="insert" method="post" class="inqueryfrm">
							<table class="inquerytable">
								<tr style="height: 50px;">
									<th colspan="2" align="left"
										style="background-color: #E9E9E9; font-size: 1.2em; padding-left: 100px;"><span>상세항목입력</span>
									</th>
								</tr>
								<tr style="height: 50px;">
									<th>문의유형</th>
									<td style="padding-left: 70px;"><select
										name="inquery_category" class="inquery_category">
											<option value="선택해주세요" selected="selected">선택해주세요</option>
											<option value="숙소등록 문의">숙소등록 문의</option>
											<option value="시스템 기능/오류">시스템 기능/오류</option>
											<option value="예약 확인 및 취소">예약 확인 및 취소</option>
											<option value="정산관리">정산관리</option>
											<option value="기타문의">기타문의</option>
									</select></td>
								</tr>
								<tr>
									<th><span> 제목</span></th>
									<td align="center"><input type="text" class="title"
										name="inquery_title" placeholder="제목을 입력해 주세요."
										required="required"></td>
								</tr>
								<tr>
									<th><span>내용</span></th>
									<td align="center"><textarea class="content"
											placeholder="문의하실 내용을 구체적으로 작성해 주시면 더욱 빠르고 정확한 답변을 드릴 수 있습니다."
											name="inquery_content" required="required"></textarea></td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="canceldiv">
											<button type="button" id="cancelbtn" onclick="history.back()">
												취소하기&nbsp;&nbsp;<i class="bi bi-x-circle"></i>
											</button>
										</div>
										<div class="submitdiv">
											<button type="submit" id="submitbtn">
												접수하기&nbsp;&nbsp;<i class="bi bi-check-lg"></i>
											</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../include/footer.jsp"%>
	<script>
		$(function() {

			$("#submitbtn").click(function() {

				var cate = $("select.inquery_category").val();

				if (cate == "선택해주세요") {
					alert("문의유형을 선택해 주세요.");
					return false;
				}

			})
		})
	</script>
</body>
</html>