<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>TRIP NEST</title>
<style>
a.menu-item.likestay {
	font-weight: 700;
}
</style>
<body>


	<div id="wrap">
		<div id="myPage">
			<div class="center" id="myLikeStay">
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
						<div id="likestay" class="reservation-info">
							<div id="mylikestaydiv"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@ include file="../include/footer.jsp"%>
	<script>
		list();

		$(document).on('click', '.bi-heart-fill', function() {

			event.stopPropagation(); // 이벤트 전파 방지
			event.preventDefault(); // 기본 동작 방지

			var room_id = $(this).attr("room_id");
			var member_useremail = "${sessionScope.myid}";
			var heart = $(this);

			$.ajax({
				type : "get",
				url : "/wishlist/deletewish",
				data : {
					"room_id" : room_id,
					"member_useremail" : member_useremail
				},
				dataType : "html",
				success : function() {
					alert("위시리스트에 삭제되었습니다.");
					heart.removeClass("red");
					list();
				}
			});
		});

		function list() {
			$
					.ajax({
						type : "get",
						url : "/wishlist/mywishlist",
						dataType : "json",
						success : function(data) {
							var s = "";
							$
									.each(
											data,
											function(date, items) {
												s += "<span class='mylikestaydate'>"
														+ date + "</span>"; // 날짜 출력
												$
														.each(
																items,
																function(i, res) {
																	s += "<div class='mylikestaydiv'>";
																	s += "<a href='/find/list/detail?room_id="
																			+ res.room_id
																			+ "'>";
																	s += "<img src='" + res.image_photo + "' class='mylikestayphoto'>";
																	s += "<i class='bi bi-heart-fill'room_id='"+res.room_id+"'></i>";
																	s += "<br><span class='text'>"
																			+ res.room_name
																			+ "</span>/<span class='text'>"
																			+ res.room_region
																			+ "</span>";
																	s += "<span class='mylikestayprice'>"
																			+ res.room_price
																			+ "</span>";
																	s += "</a></div>";
																});
											});
							$("#mylikestaydiv").html(s);
							icon();
						}

					});
		}
		function icon() {
			$(".bi-heart-fill").each(function() {
				var room_id = $(this).attr("room_id");
				var member_useremail = "${sessionScope.myid}";
				var heart = $(this);

				$.ajax({
					type : "get",
					url : "/wishlist/count",
					data : {
						"room_id" : room_id,
						"member_useremail" : member_useremail
					},
					dataType : "json",
					success : function(res) {
						if (res.count == 1) {
							heart.addClass("red");
						}
					}
				});
			});

		}

	</script>
</body>
</html>