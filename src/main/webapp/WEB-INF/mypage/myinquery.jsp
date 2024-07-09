<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
a.menu-item.myinquery {
	font-weight: 700;
}

.custom-model-mainiq {
	text-align: center;
	overflow: hidden;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0; /* z-index: 1050; */
	-webkit-overflow-scrolling: touch;
	outline: 0;
	opacity: 0;
	-webkit-transition: opacity 0.15s linear, z-index 0.15;
	-o-transition: opacity 0.15s linear, z-index 0.15;
	transition: opacity 0.15s linear, z-index 0.15;
	z-index: -1;
	overflow-x: hidden;
	overflow-y: auto;
}

.model-open {
	z-index: 99999;
	opacity: 1;
	overflow: hidden;
}

.custom-model-inner {
	-webkit-transform: translate(0, -25%);
	-ms-transform: translate(0, -25%);
	transform: translate(0, -25%);
	-webkit-transition: -webkit-transform 0.3s ease-out;
	-o-transition: -o-transform 0.3s ease-out;
	transition: -webkit-transform 0.3s ease-out;
	-o-transition: transform 0.3s ease-out;
	transition: transform 0.3s ease-out;
	transition: transform 0.3s ease-out, -webkit-transform 0.3s ease-out;
	display: inline-block;
	vertical-align: middle;
	width: 600px;
	margin: 30px auto;
	max-width: 97%;
}

.custom-model-wrap {
	display: block;
	width: 100%;
	position: relative;
	background-color: #fff;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 6px;
	-webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	background-clip: padding-box;
	outline: 0;
	text-align: left;
	padding: 20px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	max-height: calc(100vh - 70px);
	overflow-y: auto;
}

.model-open .custom-model-inner {
	-webkit-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	transform: translate(0, 0);
	position: relative;
	z-index: 999;
}

.model-open .bg-overlay {
	background: rgba(0, 0, 0, 0.6);
	z-index: 99;
}

.bg-overlay {
	background: rgba(0, 0, 0, 0);
	height: 100vh;
	width: 100%;
	position: fixed;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	z-index: 0;
	-webkit-transition: background 0.15s linear;
	-o-transition: background 0.15s linear;
	transition: background 0.15s linear;
}

.close-btn {
	position: absolute;
	right: 0;
	top: -30px;
	cursor: pointer;
	z-index: 99;
	font-size: 30px;
	color: #fff;
}

.myinquerypre, .myinqueryanswerpre, .myinqueryspan {
	padding: 20px;
}

#myinquerymodal .Qicondiv, #myinquerymodal .Aicondiv {
	border-radius: 100px;
	width: 20px;
	height: 20px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

#myinquerymodal .Aicondiv {
	background-color: gray;
}

#myinquerymodal .Qicondiv {
	background-color: #2196F3;
}

#myinquerymodal .contentdiv, #myinquerymodal .answerdiv {
	display: flex;
	align-items: center;
	justify-content: center;
}

.myinquerydelbtn {
	cursor: pointer;
	background-color: white;
}
</style>
<body>


	<div id="wrap">
		<div id="myPage">
			<div class="center" id="myinquery">
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
						<div>
							<div id="myinquerydiv">
								<button type="button"
									onclick="location.href='/inquery/inqueryform'"
									class="writeinquerybtn">1:1문의 글쓰기</button>
								<table class="myinquery">
									<thead>
										<tr align="center" style="background-color: #F8F8F8">
											<td>질문번호</td>
											<td>문의유형</td>
											<td width="250px;">문의제목</td>
											<td>등록날짜</td>
											<td>답변상태</td>
											<td>삭제</td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>


						</div>


						<div class="custom-model-mainiq" id="myinquerymodal">
							<div class="custom-model-inner">
								<div class="close-btn">×</div>
								<div class="custom-model-wrap">
									<div class="pop-up-content-wrap">
										<div class="myinquerymodal">
											<table class="myinquerymodaltable">
												<tr>
													<td
														style="text-align: center; width: 100px; vertical-align: middle;"><b>제목</b></td>
													<td><span class="myinqueryspan"></span></td>
												</tr>
												<tr>
													<td
														style="text-align: center; width: 100px; vertical-align: middle;">
														<div class="contentdiv">
															<div class="Qicondiv">Q</div>
															<b>문의내용</b>
														</div>
													</td>
													<td><pre class="myinquerypre"></pre></td>
												</tr>
											</table>
										</div>
										<hr>
										<div class="myinqueryanswer">
											<table>
												<tr>
													<td
														style="text-align: center; width: 100px; vertical-align: middle;">
														<div class="answerdiv">
															<div class="Aicondiv">A</div>
															<b>답변내용</b>
														</div>
													</td>
													<td><pre class="myinqueryanswerpre"
															style="color: #2196F3"></pre></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="bg-overlay"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/footer.jsp"%>
	<script>
		$(document).ready(
				function() {

					list();

					$(document).on(
							'click',
							'.Click-here',
							function() {
								$(".custom-model-mainiq")
										.addClass('model-open');
								$("body").addClass('modal-open');

								var inquery_id = $(this).data("inquery-id");
								//alert(inquery_id);

								$.ajax({
									url : "/mypage/inquerydetails",
									type : "get",
									dataType : "json",
									data : {
										"inquery_id" : inquery_id
									},
									success : function(res) {
										$(".myinqueryspan").text(
												res.inquery_title);
										$(".myinquerypre").text(
												res.inquery_content);

										if (res.inquery_answer == null) {
											$(".myinqueryanswerpre").text(
													"죄송합니다. 답변대기중입니다.").css(
													"color", "#2196F3");
										} else {
											$(".myinqueryanswerpre").text(
													res.inquery_answer).css(
													"color", "black");
										}
									}
								})
							});

					$(document).on("click", ".myinquerydelbtn", function() {
						var inquery_id = $(this).data("inquery-id");
						var a = confirm("해당 문의글을 삭제하시겠습니까?");
						if (a) {
							$.ajax({
								type : "get",
								url : "/mypage/deleteinquery",
								dataType : "html",
								data : {
									"inquery_id" : inquery_id
								},
								success : function() {
									alert("삭제되었습니다.");

									list();
								}

							})
						}
					})

					$(".close-btn, .bg-overlay").click(function() {
						$("body").removeClass('modal-open');
						$(".custom-model-mainiq").removeClass('model-open');
					});

				});
		function list() {
			$
					.ajax({
						type : "get",
						url : "/mypage/myinquerylist",
						dataType : "json",
						success : function(data) {
							var tbody = $(".myinquery tbody");
							tbody.empty(); // 기존 테이블 내용 비우기

							// 데이터를 반복하여 테이블에 추가
							$
									.each(
											data,
											function(i, iq) {
												var status = (iq.inquery_answer != null) ? "답변완료"
														: "답변대기";

												var s = "<tr>";
												s += "<td align='center'>"
														+ iq.inquery_id
														+ "</td>";
												s += "<td align='center'>"
														+ iq.inquery_category
														+ "</td>";
												s += "<td class='iq_title'><a class='Click-here' data-inquery-id='" + iq.inquery_id + "'>"
														+ iq.inquery_title
														+ "</a></td>";
												s += "<td align='center'>"
														+ new Date(
																iq.inquery_date)
																.toLocaleDateString()
														+ "</td>";
												if (iq.inquery_answer != null) {
													s += "<td align='center' style='color:#2196F3'>답변완료</td>";
												} else {
													s += "<td align='center'>답변대기</td>";
												}
												s += "<td align='center'><button type='button' class='myinquerydelbtn' data-inquery-id='" + iq.inquery_id + "'>삭제</button></td>";
												s += "</tr>";

												tbody.append(s);
											});
						}
					});
		}
	</script>
</body>
</html>