<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}

.login-form {
    background: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 300px;
}

.login-form h1 {
    font-weight: 700;
    margin-bottom: 10px;
}

.login-form p {
    font-weight: 400;
    margin-bottom: 20px;
}

.input-group {
    position: relative;
    margin-bottom: 20px;
}

.input-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.input-group label {
    position: absolute;
    top: -20px;
    left: 10px;
    font-size: 12px;
    color: #aaa;
}

.btn {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.login-btn {
    background: #ddd;
    color: #fff;
}

.signup-btn {
    background: #fff;
    color: #000;
    border: 1px solid #000;
}

.links {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
}

.links a {
    color: #000;
    text-decoration: none;
    font-size: 12px;
}
</style>
<body>
<div class="container">
    <div class="login-form">
        <h1>LOGIN</h1>
        <p>로그인</p>
        <form action="#" method="post">
            <div class="input-group">
                <input type="text" id="email" name="email" required>
                <label for="email">이메일 아이디</label>
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" required>
                <label for="password">비밀번호 (영문, 숫자, 특수문자)</label>
            </div>
            <button type="submit" class="btn login-btn" disabled>LOGIN</button>
            <button type="button" class="btn signup-btn">신규 회원 가입</button>
            <div class="links">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>