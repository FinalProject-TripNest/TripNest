<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
a.menu-item.edit_btn {
	font-weight: 700;
}
</style>
<body>


	<div id="wrap">
		<div id="myPage">
			<div class="center" id="myEdit">
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
						<div class="edit">
							<div class="content">
								<div class="main-content">
									<form action="/mypage/updateProfile" method="post">
										<div class="form-group">
											<label for="email">이메일</label> <input type="email" id="email"
												name="email" value="${memberDto.member_useremail}" disabled>
										</div>
										<div class="form-group">
											<label for="auth">간편 로그인</label>
											<div class="social-login">
												<ul>
													<c:choose>
														<c:when test="${memberDto.member_social_type == 'kakao'}">
															<li class="kakao"></li>
														</c:when>
														<c:when test="${memberDto.member_social_type == 'naver'}">
															<li class="naver"></li>
														</c:when>
														<c:otherwise>
															<li>일반회원</li>
														</c:otherwise>
													</c:choose>
												</ul>
											</div>
										</div>
										<div class="form-group">
											<label for="name">이름</label> <input type="text" id="name"
												name="name" value="${memberDto.member_name}">
										</div>
										<div class="form-group">
											<label for="phone">휴대전화번호</label> <input type="text"
												id="phone" name="phone" value="${memberDto.member_phone}"
												placeholder="등록이 필요합니다.">
										</div>
										<div class="form-group">
											<label for="birthday">생년월일</label> <input type="date"
												id="birthday" name="birthday"
												value="<fmt:formatDate value='${memberDto.member_birth_date}' pattern='yyyy-MM-dd'/>"
												placeholder="YYYY-MM-DD">
										</div>
										<div class="submit-btn">
											<button type="submit" class="btn">저 장 하 기</button>
										</div>
									</form>
									<button type="button" class="withdraw-btn">회원탈퇴</button>
								</div>
							</div>
						</div>

						<!-- 탈퇴 팝업 -->
						<div class="withdraw-popup" id="withdrawPopup">
							<div class="withdraw-popup-content">
								<p>
									<strong>${memberDto.member_name}</strong> 회원님,<br> <br>
									회원 탈퇴 시 스테이폴리오 예약 및 구매 내역이 삭제되며<br> 멤버십 혜택이 더 이상 제공되지
									않습니다.
								</p>
								<div class="withdraw-popup-buttons">
									<button type="button" class="withdraw-confirm">탈퇴하기</button>
									<button type="button" class="withdraw-cancel">탈퇴 취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			// 회원탈퇴 버튼 클릭 시 팝업 열기
			$('.withdraw-btn').on('click', function() {
				$('#withdrawPopup').css('display', 'flex');
			});

			// 탈퇴 취소 버튼 클릭 시 팝업 닫기
			$('.withdraw-cancel').on('click', function() {
				$('#withdrawPopup').css('display', 'none');
			});

			// 탈퇴하기 버튼 클릭 시 회원 탈퇴 처리
			$('.withdraw-confirm').on('click', function() {
				// 회원 탈퇴 처리 로직
				$.ajax({
					url : '/mypage/withdraw',
					type : 'POST',
					success : function(response) {
						// 성공 시 리다이렉트 또는 알림
						window.location.href = '/';
					},
					error : function(error) {
						// 에러 처리
						alert('회원 탈퇴 중 문제가 발생했습니다.');
					}
				});
			});
		});
	</script>
</body>
</html>


