<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    h1 {
        text-align: center;
    }
    .result {
        text-align: center;
        margin-top: 20px;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<body>
    <div id="wrap">
        <div id="login_loginForm">
            <div class="center">
                <h1>TRIP NEST</h1>
                <div class="result">
                    <p>${message}</p>
                    <a href="${pageContext.request.contextPath}/login/loginform" class="btn">로그인</a>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp" %>

    <script>
    
    </script>
</body>
</html>
