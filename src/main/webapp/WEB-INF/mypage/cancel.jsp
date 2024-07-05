<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<title>TRIP NEST</title>
<style>
a.menu-item.cancel{
	font-weight: 700;
}
</style>
<body>
	<div id="wrap">
		<div id="myPage">
			<div class="center" id="myCancel">
				<div class="mypage_info">
					<div class="title">
						<p>
							<span>${memberDto.member_name}</span>님반가워요!
						</p>
					</div>
				</div>
				<div class="separator"></div>
				<div class="content_wrapper">
					<%@ include file="../include/mypqge_menu.jsp"%>
					<div class="mypage_content" id="mypage_content">
						<div class="cancel">
							<c:choose>
								<c:when test="${not empty cancellations}">
									<div class="cancel-list">
										<c:forEach var="cancellation" items="${cancellations}">
											<div class="cancel-item">
												<div class="cancel-image-container">
													<p class="cancel-status">${cancellation.reservation_status}
													</p>
													<img src="${cancellation.image_photo}"
														alt="${cancellation.room_name}" />
												</div>
												<div class="cancel-info">
													<h3>${cancellation.room_name}</h3>
													<p>${cancellation.reservation_checkin}~
														${cancellation.reservation_checkout}</p>
													<p>
														결제취소일 :
														<fmt:formatDate value="${cancellation.paid_date}"
															pattern="yyyy-MM-dd HH:mm" />
													</p>
												</div>
												<div class="cancel-price">
													₩
													<fmt:formatNumber value="${cancellation.paid_amount}"
														type="currency" currencySymbol="" />
												</div>
											</div>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<div class="no-cancel">
										<img alt="" src="${root}/img/mypage/booking-waiting.png">
										<p>아직 취소 내역이 없습니다. 다른 스테이를 찾아보세요.</p>
										<a href="${root}/find/list" class="btn">다른 스테이 찾기</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>