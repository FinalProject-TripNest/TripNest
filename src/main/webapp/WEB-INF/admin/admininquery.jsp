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

#admininquery {
    margin: 0 auto;
    width: 80%;
}
.inquiry-item,.inquery_content,.inquery_reanswer{
	 width: 1150px;
	 margin: 0 auto;
}
.admin-i-table {
    margin-bottom: 10px;
    border-collapse: collapse;
    margin: 0 auto;
}
.admin-i-table th, .admin-i-table td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: center;
    vertical-align: middle;
}
.inquiry-item {
    border: 0px solid gray;
    display: flex;
}


div.inquiry-div{
border:0px solid gray;
height: 50px;
align-items: center;
display: flex;
justify-content: center;
border-bottom: 1px solid #ccc;
}
.inquery_content,.inquery_reanswer{
border:0px solid gray;
height: 100px;
border-bottom: 1px solid #ccc;
}

.num{
	width:100px;
}
.cate,.id,.date{
	width: 200px;
}
.title{
width: 250px;
}
.answer,.reanswer{
width: 100px;
}
.reanswerbtn{
	background-color: white;
	border-radius: 5px;
}
.inquery_content>input{
	text-align: center;
	width: 100px;
	height: 100px;
	border: 1px solid #ccc;
	/*background-color: #ccc;*/
}
.inquery_content>span{
	border: 0px solid green;
	height: 100px;
	width: 100%;
}
.inquery_reanswer>textarea{
	border: 1px solid black;
}
</style>
<body>


	<div id="wrap">
		<div id="admininquery">
			<div class="center">
			<table class="admin-i-table">
				<tr>
					<td width="100">번호</td>
					<td width="200">카테고리</td>
					<td width="200">아이디</td>
					<td width="250">제목</td>
					<td width="200">문의날짜</td>
					<td width="100">답변상태</td>
					<td width="100">비고</td>
				</tr>
			</table>
			
			
				<c:forEach var="a" items="${list }">
				<input type="hidden" value="${a.inquery_id }" name="inquery_id_${a.inquery_id}">
					<div class=" inquiry-item">
						<div class="inquiry-div num">${no }</div>
							<c:set var="no" value="${no-1 }"/>
						<div class="inquiry-div cate" >${a.inquery_category }</div>
						<div class="inquiry-div id">${a.member_id }</div>
						<div class="inquiry-div title">${a.inquery_title}</div>
						<div class="inquiry-div date"><fmt:formatDate value="${a.inquery_date}"
									pattern="yyyy-MM-dd" /></div>
						<div class="inquiry-div answer">
							<c:if test="${a.inquery_answer==null }"><span>미답변</span> </c:if>	
							<c:if test="${a.inquery_answer!=null }"><span>답변완료</span> </c:if>	
						</div>
						<div class="inquiry-div reanswer" >
							<button type="button" class="reanswerbtn" data-inquery-id="${a.inquery_id}">답변달기</button>
						</div>
					</div>
					<div class="iqdiv" data-inquery-id="${a.inquery_id}">
						<div class="inquery_content">
							<input type="text" value="문의내용">
							<span> ${a.inquery_content}</span>
						</div>
						<div>
							<span class="adminanswer"></span>
						</div>
						<div class="inquery_reanswer" align="center">
							<span>문의답변</span>
							<input name="inquery_answer_${a.inquery_id}" placeholder="답변등록" class="inquery_answer">
							<button type="button" class="adminanswerbtn">등록</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 페이징 -->
	<div
		style="margin: 0 auto; width: 80%; text-align: center; padding-top: 5%;">
		<ul class="pagination justify-content-center">

			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<li class="page-item"><a class="page-link"
					href="inquerylist?currentPage=${startPage-1 }" style="color: black;">이전</a>
				</li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage==pp }">
					<li class="page-item active"
						style="display: inline; margin-right: 5px;"><a
						class="page-link" href="inquerylist?currentPage=${pp }">${pp }</a></li>
				</c:if>
				<c:if test="${currentPage!=pp }">
					<li class="page-item" style="display: inline; margin-right: 5px;">
						<a class="page-link" href="inquerylist?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li class="page-item"><a class="page-link"
					href="inquerylist?currentPage=${endPage+1}" style="color: black;">다음</a>
				</li>
			</c:if>
		</ul>
	</div>


	<%@ include file="../include/footer.jsp"%>
	<script>
		
		    $(function(){
		    	$(".iqdiv").hide();

		    	   $(".reanswerbtn").click(function(){
				    	 var id = $(this).data("inquery-id");
		              //alert(id);
		               $(".iqdiv").each(function(){
		                   if ($(this).data("inquery-id") === id) {
		                       $(this).slideToggle();
		                   }
		               });
		           });

		    	   $(".adminanswerbtn").click(function() {
		    		   var inquery_id = $(this).closest(".iqdiv").data("inquery-id");
		    		   var inquery_answer = $(this).closest(".inquery_reanswer").find(".inquery_answer").val();
		    		   //alert(inqueryAnswer+","+inqueryId);
		    		   
		    		   $.ajax({
		    			   type:"post",
		    			   url:"/admin/updateanswer",
		    			   data:{"inquery_id":inquery_id,"inquery_answer":inquery_answer},
		    			   dataTyle:"html",
		    			   success:function(){
		    				   alert("성공");
		    			   }
		    			   
		    		   })
		    		   
		    	   })		    	   
    });
	</script>
</body>
</html>