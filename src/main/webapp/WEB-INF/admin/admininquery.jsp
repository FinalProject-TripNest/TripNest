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
    padding: 8px;
    text-align: center;
    vertical-align: middle;
    height: 50px;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
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
border:0px solid red;
height: 200px;
border-bottom: 1px solid #ccc;
display: flex;
}

.num{
	width:100px;
}
.cate,.id,.date{
	width: 200px;
}
div.inquiry-divtitle{
border-bottom: 1px solid #ccc;
 width: 250px; /* 제목의 최대 너비 지정 */
    white-space: nowrap; /* 줄바꿈을 방지하여 한 줄에 표시 */
    overflow: hidden; /* 넘치는 부분 숨김 */
    text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
    text-align: center;
    padding: 15px 0;
    padding-left: 15px;
}
.answer,.reanswer{
width: 100px;
}
.reanswerbtn{
	background-color: white;
	border-radius: 5px;
	cursor: pointer;
}

.contentdiv,.answerdiv{
	display: flex;
	align-items: center;
	height: 200px;
	border: 0px solid black;
	width: 300px;
	justify-content: center;
}
.Qicondiv,.Aicondiv{
	border-radius: 100px;
	width: 25px;
	height: 25px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}
.Aicondiv{
	background-color: gray;
}
.Qicondiv{
	background-color: #2196F3;
}
.aaaaa,.contentbb{
	align-items: center;
	height: 80%;
	border: 0px solid black;
	width: 50%;
	display: flex;
	margin-left: 50px;
	font-size: 12pt;
	text-align: left;
}

textarea.inquery_answer{
	margin-top: 20px;
	align-items: center;
	height: 80%;
	border: 1px solid #ccc;
	width: 100%;
	display: flex;
	margin-left: 50px;
}
button.adminanswerbtn,.admineditbtn{
	height: 60px;
	width: 100px;
  margin-left: 5%;
  background-color: white;
  border: 1px solid #ccc;
  border-radius: 5px;
  cursor: pointer;
}
.paging{
	 margin: 0 auto; 
	 text-align: center; 
	 padding-top: 5%;
	 padding-bottom: 5%;
}
.answer-areafirst,.answer-areasecond {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: space-between; /* 요소들 사이의 간격을 자동으로 조절 */
    margin-top: 10px; /* 필요한 경우 상단 마진을 조절 */
    width: 70%;
}
</style>
<body>


	<div id="wrap">
		<div id="admininquery">
			<div class="center">
			<div style="font-size: 1.2em; text-align: center;margin-bottom: 20px;"><b>1:1문의 현황</b></div>
			<table class="admin-i-table">
				<tr style="background-color: #F8F8F8;">
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
				<input type="hidden" value="${a.inquery_id }" name="inquery_id_${a.inquery_id}" class="inquery_id">
					<div class=" inquiry-item">
						<div class="inquiry-div num">${no }</div>
							<c:set var="no" value="${no-1 }"/>
						<div class="inquiry-div cate" >${a.inquery_category }</div>
						<c:if test="${a.member_id==0}">
							<div class="inquiry-div id">탈퇴한 사용자입니다.</div>
						</c:if>
						<c:if test="${a.member_id>0}">
							<div class="inquiry-div id">${a.mememail}</div>
						</c:if>
						<div class="inquiry-divtitle">${a.inquery_title}</div>
						<div class="inquiry-div date"><fmt:formatDate value="${a.inquery_date}"
									pattern="yyyy-MM-dd" /></div>
						<div class="inquiry-div answer">
							<c:if test="${a.inquery_answer==null }"><span style="color: #2196F3" class="ans">미답변</span> </c:if>	
							<c:if test="${a.inquery_answer!=null }"><span class="ans">답변완료</span> </c:if>	
						</div>
						<div class="inquiry-div reanswer" >
							<c:if test="${a.inquery_answer==null }">
								<button type="button" class="reanswerbtn" data-inquery-id="${a.inquery_id}">답변달기</button>
							</c:if>	
							<c:if test="${a.inquery_answer!=null }">
								<button type="button" class="reanswerbtn" data-inquery-id="${a.inquery_id}">수정하기</button>
							</c:if>	
						</div>
					</div>
					<div class="iqdiv" data-inquery-id="${a.inquery_id}">
						<div class="inquery_content">
							<div class="contentdiv"><div class="Qicondiv">Q</div> 문의내용</div><br>
							<div class="aaaaa"> <pre>${a.inquery_content}</pre></div>
						</div>
						<div class="inquery_reanswer" align="center">
							<div class="answerdiv"><div class="Aicondiv">A</div> 문의답변</div><br>
							
							<div class="answer-areafirst">
								<!--<c:if test="${a.inquery_answer==null }"></c:if>-->					
									<textarea name="inquery_answer_${a.inquery_id}" placeholder="답변등록" class="inquery_answer"></textarea>
										<button type="button" class="adminanswerbtn">등록</button>
							</div>
							<div class="answer-areasecond">
								<!--<c:if test="${a.inquery_answer!=null }"></c:if>-->
									<div class="bbbbb_${a.inquery_id } contentbb"><pre>${a.inquery_answer }</pre></div>
									<button type="button" class="admineditbtn" data-inquery-id="${a.inquery_id}" value="edit">수정</button>
								</div>
						</div>
					</div>
				</c:forEach>
				
				
				
				<!-- 페이징 -->
	<div class="paging">
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
				
				
			</div>
		</div>
	</div>

	

	<%@ include file="../include/footer.jsp"%>
	<script>
	
		    $(function(){
		    	$(".iqdiv").hide();
		    	
		    	$(".inquery_id").each(function(){
		    		var inquery_id = $(this).val();
		    		//console.log(inquery_id);
		    	})
		    	
		    	
		    	//답변달기를 눌렀을때 이벤트
		    	   $(".reanswerbtn").click(function(){
				    	 var inquery_id = $(this).data("inquery-id");
		              //alert(inquery_id);
		              
		              $.ajax({
		            	  url:"/admin/iqlist",
		            	  type:"get",
		            	  data:{"inquery_id":inquery_id},
		            	  dataType:"json",
		            	  success:function(res){
		            		  
		            	            if (res != null) {
		                                var inquery_answer = res.inquery_answer;
		                                if (inquery_answer == null) {
		                                    $("div.answer-areasecond").hide();
		                                    $("div.answer-areafirst").show();
		                                } else {
		                                    $("div.answer-areafirst").hide();
		                                    $("div.answer-areasecond").show();
		                                }
		                            }       
		            	            
		            	     
		            	  }
		              });


		              
		              
		               $(".iqdiv").each(function(){
		                   if ($(this).data("inquery-id") === inquery_id) {
		                       $(this).slideToggle();
		                   }
		               });
		           });
		    	
		    	
		    	//수정하기 버튼을 눌렀을때
		    	$(".admineditbtn").click(function(){
		    			
		    		var inquery_id = $(this).data("inquery-id");
		    		//alert(inquery_id);
		    		
		    		$("div.answer-areasecond").hide();
	          $("div.answer-areafirst").show();
		    		
		    			$.ajax({
		    			url:"/admin/iqlist",
		    			type:"get",
		    			data:{"inquery_id":inquery_id},
		    			dataType:"json",
		    			success:function(res){
		    				
		    				//관리자가 달았던 답글이 textarea에 입력되어있는 상태로
		    				$("textarea[name='inquery_answer_" + inquery_id + "']").val(res.inquery_answer);
		    				console.log(res.inquery_answer);
		    			}
		    		})
		    		
		    	});
		    	   
		    	    
    });
		    //등록버튼을 눌렀을때
		    $(document).ready(function(){
		    	
		    	   $(".adminanswerbtn").click(function() {
		    		   

		    		   
		    		   var inquery_id = $(this).closest(".iqdiv").data("inquery-id");
		    		   var inquery_answer = $(this).closest(".inquery_reanswer").find(".inquery_answer").val();
		    		   //alert(inquery_id+","+inquery_answer);
		    		   
		    		   //inquery_answer = inquery_answer.replace(/\n/g, "<br>");
		    		   
		    		   $.ajax({
		    			   type:"post",
		    			   url:"/admin/updateanswer",
		    			   data:{"inquery_id":inquery_id,"inquery_answer":inquery_answer},
		    			   dataType:"html",
		    			   success:function(){
		    				   
				    		   $("div.answer-areafirst").hide();
				           $("div.answer-areasecond").show();

		    					   alert("등록완료");
		    					   list(inquery_id)

		    			   }
		    			   
		    		   })
		    		   
		    	   });  
		    	   
		    	   
		    });
		    
		    //답글이 바로바로 반영되게
		    function list(inquery_id){
		    	
	    		
	    		$.ajax({
	    			url:"/admin/iqlist",
	    			type:"get",
	    			data:{"inquery_id":inquery_id},
	    			dataType:"json",
	    			success:function(res){
	    				$("div.bbbbb_"+inquery_id).find("pre").html(res.inquery_answer);
		          $("div.answer").find(".ans").text("답변완료").css("color","black");
	    			}
	    		})
		    	
		    }
			
		
	</script>
</body>
</html>