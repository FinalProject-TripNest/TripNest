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

.adminmaindivone,.adminmaindivtwo,.adminmaindivzero{
	display: flex;
}
.adminmaindivzero{
	margin-bottom: 3%;
}
.admin_mainmem,.admin_mainroom,.admin_mainiq,.admin_pay{
	width: 50%;
	box-sizing: border-box;
	margin: 20px;
}
.mainaa{
	box-sizing: border-box;
	width: 33.3%;
	text-align: center;
	border: 1px solid #EEEEEE;
	height: 100px;
	padding-top: 10px;
}
.mainaa table{
	text-align: center;
	margin: 0 auto;
}

table td{
	border: 1px solid #ccc;
	height: 30px;
}
.mainmemtable,.mainroomtable,.mainiqtable,.maintable{
	width: 100%;
	text-align: center;
	margin: 0 auto;
}
.adminmaindivone button,.adminmaindivtwo button{
	float: right;
	background-color:#ccc;
	color: black;
	width: 140px;
	cursor: pointer;
	margin-bottom: 5px;
}
.mainaa td{
	border: 1px solid white;
	width: 33.3%;
	vertical-align: middle;
}

</style>
<body>


	<div id="wrap">
		<div id="adminpage">
			<div class="center" style="max-width: 1600px;">
			<div class="adminmaindivzero">
				<div class="mainaa">
					<span>전체 회원현황</span>
					<table style="width: 300px;">
						<tr style="background-color: #EEEEEE;">
							<td>총 회원수</td>
							<td>user</td>
							<td>business</td>
						</tr>
						<tr style="background-color: #F8F8F8;">
							<td>${memcount }명</td>
							<td>명</td>
							<td>명</td>
						</tr>
					</table>
				</div>
				
				<div class="mainaa">
					<span>전체 숙소현황</span>
					<table style="width: 300px;">
						<tr style="background-color: #EEEEEE;">
							<td>총 등록숙소</td>
							<td>승인</td>
							<td>미승인/보류</td>
						</tr>
						<tr style="background-color: #F8F8F8;">
							<td>${roomscount }개</td>
							<td>${roomscount-noroomcount}개</td>
							<td>${noroomcount }개</td>
						</tr>
					</table>
				</div>
				
				<div class="mainaa">
					<span>전체 문의현황</span>
					<table style="width: 300px;">
						<tr style="background-color: #EEEEEE;">
							<td>총 문의목록</td>
							<td>답변완료</td>
							<td>미답변</td>
						</tr>
						<tr style="background-color: #F8F8F8;">
							<td>${totaliqcount }개</td>
							<td>${totaliqcount-noiqcount}개</td>
							<td>${noiqcount }개</td>
						</tr>
					</table>
				</div>
				
			</div>
			<div class="adminmaindivone">
					<div style="border: 0px solid black;" class="admin_mainmem">
						<button type="button" onclick="location.href='/admin/memberList'">회원관리 바로가기</button>
						<span>최근 회원가입</span>
						<table class="mainmemtable">
							<tr style="background-color: #F8F8F8;">
								<td>번호</td>
								<td>이름</td>
								<td>아아디/이메일</td>
								<td>가입일시</td>
								<td>ROLE</td>
							</tr>
							<c:forEach var="memdto" items="${memlist}">
								<tr>
									<td>${memdto.member_id }</td>
									<td>${memdto.member_name }</td>
									<td>${memdto.member_useremail }</td>
									<td>
										<fmt:formatDate value="${memdto.member_registration_date }" pattern="yy-MM-dd"/>
									</td>
									<td>${memdto.member_role}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<div style="border: 0px solid red;" class="admin_mainroom">
						<button type="button" onclick="location.href='/admin/roomlist'">숙소관리 바로가기</button>
						<span>최근 등록숙소</span>
						<table class="mainroomtable">
							<tr style="background-color: #F8F8F8;">
								<td>번호</td>
								<td>호스트</td>
								<td>숙소이름</td>
								<td>위치</td>
								<td>상태</td>
							</tr>
							<c:forEach var="rdto" items="${roomlist }">
								<tr>
									<td>${rdto.room_id}</td>
									<td>${rdto.mememail}</td>
									<td>${rdto.room_name}</td>
									<td>${rdto.room_address}</td>
									<td>
										<c:if test="${rdto.room_status=='no' }">
											미승인
										</c:if>
										<c:if test="${rdto.room_status=='보류' }">
											보류
										</c:if>
										<c:if test="${rdto.room_status=='승인' }">
											승인
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="adminmaindivtwo">
					<div  style="border: 0px solid green;" class="admin_mainiq">
						<button type="button" onclick="location.href='/admin/inquerylist'">문의관리 바로가기</button>
						<span>최근 문의내역</span>
						
						<table class="mainiqtable">
							<tr style="background-color: #F8F8F8;">
								<td>카테고리</td>
								<td>아이디</td>
								<td>title</td>
								<td>문의날짜</td>
								<td>상태</td>
							</tr>
							<c:forEach var="iqdto" items="${iqlist }">
								<tr>
									<td>${iqdto.inquery_category }</td>
									<td>${iqdto.mememail }</td>
									<td>${iqdto.inquery_title }</td>
									<td>
										<fmt:formatDate value="${iqdto.inquery_date }" pattern="yy-MM-dd"/>
									</td>
									<td>
										<c:if test="${iqdto.inquery_answer==null }">
											미답변
										</c:if>
										<c:if test="${iqdto.inquery_answer!=null }">
											답변완료
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div style="border: 0px solid pink;" class="admin_pay">
						<button>결제내역 바로가기</button>
						<span>최근 결제내역</span>
						<table class="maintable">
							<tr style="background-color: #F8F8F8;">
								<td>결제번호</td>
								<td>게스트명</td>
								<td>연락처</td>
								<td>결제금액</td>
								<td>결제일</td>
							</tr>
						</table>
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