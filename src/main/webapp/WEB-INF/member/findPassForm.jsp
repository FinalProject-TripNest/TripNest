<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
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
    .forgot-password {
        margin-top: 20px;
    }
    .forgot-password a {
        font-size: 12px;
    }
</style>
<body>
    <div id="wrap">
        <div id="login_loginForm">
            <div class="center">
                <h1>TRIP NEST</h1>
                <h2>비밀번호 찾기</h2>
                
                <form action="${pageContext.request.contextPath}/member/findPass" method="post">
                    <div class="form-group">
                        <label for="member_useremail">이메일</label>
                        <input type="email" id="member_useremail" name="member_useremail" placeholder="이메일" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn">비밀번호 찾기</button>
                    </div>
                    <div class="form-group">
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp" %>

    <script>
    
    </script>
</body>
</html>
