<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<title>TRIP NES</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    #additional_info_form {
        max-width: 500px;
        margin: 0 auto;
        margin-top: 20px;
        padding: 30px;
        border: 0px solid #e0e0e0;
        border-radius: 8px;
    }
    h2 {
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
    input[type="text"],
    input[type="date"],
    input[type="email"] {
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
        <div id="additional_info_form">
            <div class="center">
                <h2>추가 정보 입력</h2>
                
                <form action="${pageContext.request.contextPath}/login/kakaoAdditionalInfo" method="post">
                    <div class="form-group">
                        <label for="member_phone">전화번호</label>
                        <input type="text" id="member_phone" name="member_phone" required="required">
                    </div>
                    <div class="form-group">
                        <label for="member_birth_date">생년월일</label>
                        <input type="date" id="member_birth_date" name="member_birth_date" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn">제출</button>
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
