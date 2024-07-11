<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    #login_loginForm {
        max-width: 500px;
        margin: 0 auto;
        margin-top: 20px;
        padding: 30px;
        border: 0px solid #e0e0e0;
        border-radius: 8px;
    }
    h1, h2 {
        text-align: center;
    }
    .form-group {
        margin-top: 20px;
        margin-bottom: 15px;
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .btn {
        width: 100%;
        padding: 10px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .social-buttons {
        display: flex;
        justify-content: space-between;
    }
    .social-buttons button {
        flex: 1;
        margin: 5px;
        padding: 0;
        border: none;
        background: none;
        cursor: pointer;
    }
    .social-buttons img {
        width: 100%;
        height: 30px;
        display: block;
        object-fit: cover;
        border-radius: 8px;
    }
    .forgot-password {
    	margin-left: 148px;
        margin-top: 20px;
    }
    .forgot-password a {
    	font-size: 12px;
    }
    .divider {
        content: "";
        width: 1px;
        height: 18px;
        background: #888;
        display: inline-block;
        vertical-align: middle;
        margin: 0 10px;
    }
</style>
<body>
    <div id="wrap">
        <div id="login_loginForm">
            <div class="center">
                <h1>TRIP NEST</h1>
                <h2>로그인</h2>
                
                <form action="${pageContext.request.contextPath}/login/loginprocess" method="post">
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" placeholder="이메일 아이디" required="required">
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호 (영문,숫자,특수문자)" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn">LOGIN</button>
                    </div>
                    <div class="form-group social-buttons">
                        <button type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=${kakaoClientId}&redirect_uri=${kakaoRedirectUri}&response_type=code'">
                            <img alt="kakao_login" src="../img/register_login/kakao_login.png">
                        </button>
                        <button type="button" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?client_id=${naverClientId}&redirect_uri=${naverRedirectUri}&response_type=code&state=STATE_STRING'">
                            <img alt="naver_login" src="../img/register_login/naver_login.png">
                        </button>
                    </div>
                    <div class="form-group forgot-password">
                        <a href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a>
                        <span class="divider"></span>
                        <a href="${pageContext.request.contextPath}/member/findPass">비밀번호 찾기</a>	
                    </div>
                    <div class="form-group">
                        <c:if test="${not empty error}">
                            <script>
	                            alert("${error}");
	                        </script>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp"%>

    <script>
    
    </script>
</body>
</html>
