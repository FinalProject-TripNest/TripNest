<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .edit {
        margin-top: 5px;
        margin-left: 90px;
        border-radius: 4px;
        width: 70%;
        background-color: #fff;
    }
    .edit h2 {
        font-size: 24px;
        margin-bottom: 20px;
        text-align: left;
    }
    .content {
        display: flex;
        justify-content: center;
        margin-top: 50px;
    }
    .main-content {
        width: 100%;
        position: relative;
    }
    .form-group {
        margin-bottom: 40px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="date"],
    .form-group select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-group .btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        margin-top: 10px;
    }
    .form-group .btn:hover {
        background-color: #000;
    }
    .submit-btn {
        text-align: center;
        margin-top: 20px;
        margin-bottom: 100px;
    }
    .submit-btn .btn {
        width: 40%;
    }
    .withdraw-btn {
        cursor: pointer;
        position: absolute;
        background: none;
        bottom: 100px;
        border-bottom: 1px solid #333;
        margin-bottom: 5px;
    }
    .social-login ul {
        list-style: none;
        padding: 0;
        display: flex;
    }
    .social-login li {
        margin-right: 10px;
        width: 32px;
        height: 32px;
        background-size: contain;
        background-repeat: no-repeat;
    }
    .social-login .kakao {
        background-image: url('../img/mypage/sns_kakao.svg');
    }
    .social-login .naver {
        background-image: url('../img/mypage/sns_naver.svg');
    }
    /* 탈퇴 팝업 스타일 */
    .withdraw-popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }
    .withdraw-popup-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 4px;
        text-align: center;
        width: 600px;
    }
    .withdraw-popup-content p {
        margin-bottom: 20px;
    }
    .withdraw-popup-buttons {
        display: flex;
        justify-content: space-between;
    }
    .withdraw-popup-buttons button {
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        width: 48%;
    }
    .withdraw-popup-buttons .withdraw-confirm {
        color: #fff;
    }
    .withdraw-popup-buttons .withdraw-confirm:hover {
        background-color: #000;
    }
    .withdraw-popup-buttons .withdraw-cancel {
        color: #fff;
    }
    .withdraw-popup-buttons .withdraw-cancel:hover {
        background-color: #000;
    }
</style>
<body>
<div class="edit">
    <h2>회원 정보 수정</h2>
    <div class="content">
        <div class="main-content">
            <form action="/mypage/updateProfile" method="post">
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" value="${memberDto.member_useremail}" disabled>
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
                                    <li>일반 회원</li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" value="${memberDto.member_name}">
                </div>
                <div class="form-group">
                    <label for="phone">휴대전화번호</label>
                    <input type="text" id="phone" name="phone" value="${memberDto.member_phone}" placeholder="등록이 필요합니다.">
                </div>
                <div class="form-group">
                    <label for="birthday">생년월일</label>
                    <input type="date" id="birthday" name="birthday" value="<fmt:formatDate value='${memberDto.member_birth_date}' pattern='yyyy-MM-dd'/>" placeholder="YYYY-MM-DD">
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
        <p><strong>${memberDto.member_name}</strong> 회원님,<br><br>
        회원 탈퇴 시 스테이폴리오 예약 및 구매 내역이 삭제되며<br>
        멤버십 혜택이 더 이상 제공되지 않습니다.</p>
        <div class="withdraw-popup-buttons">
            <button type="button" class="withdraw-confirm">탈퇴하기</button>
            <button type="button" class="withdraw-cancel">탈퇴 취소</button>
        </div>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            url: '/mypage/withdraw',
            type: 'POST',
            success: function(response) {
                // 성공 시 리다이렉트 또는 알림
                window.location.href = '/';
            },
            error: function(error) {
                // 에러 처리
                alert('회원 탈퇴 중 문제가 발생했습니다.');
            }
        });
    });
});
</script>
