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
                        <input type="email" id="email" name="email" placeholder="이메일을 입력하세요." required="required">
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn">로그인</button>
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
    
<%@ include file="../include/footer.jsp"%>

	<script>
	
	</script>
</body>
</html>