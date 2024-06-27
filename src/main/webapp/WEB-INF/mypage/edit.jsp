<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>TRIP NEST</title>
<style>
    .edit {
        margin-top: 5px;
        margin-left: 90px;
        border: 0px solid #ddd;
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
    }
    .form-group {
        margin-bottom: 20px;
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
    .birth-select {
        display: flex;
        justify-content: space-between;
    }
    .birth-select select {
        width: 32%;
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
        margin: 0 0 100px;
    }
    .submit-btn button {
        padding: 10px 20px;
        margin: 0 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .submit-btn .btn-secondary {
        background-color: #d9534f;
        color: white;
    }
    .submit-btn .btn-secondary:hover {
        background-color: #c9302c;
    }
    .submit-btn .btn-primary {
        background-color: #5bc0de;
        color: white;
    }
    .submit-btn .btn-primary:hover {
        background-color: #31b0d5;
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
                    <button type="button" class="btn-secondary">회원탈퇴</button>
                    <button type="submit" class="btn-primary">저장하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
