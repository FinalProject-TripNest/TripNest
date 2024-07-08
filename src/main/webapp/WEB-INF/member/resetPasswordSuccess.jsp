<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<title>TRIP NEST</title>
<body>
    <script>
        alert("비밀번호가 성공적으로 변경되었습니다. 로그인 해주세요.");
        window.location.href = "${pageContext.request.contextPath}/login/loginform";
    </script>
</body>
</html>
