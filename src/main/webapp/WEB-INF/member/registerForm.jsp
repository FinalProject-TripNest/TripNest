<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    #member_registerForm {
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
        position: relative;
    }
    label {
        display: block;
        margin-bottom: 20px;
    }
    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="tel"],
    input[type="date"] {
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
    .btn:disabled {
        background-color: #ddd;
        cursor: not-allowed;
    }
    .email-group {
        position: relative;
    }
    .email-group input {
        padding-right: 100px;
    }
    .email-verify-btn {
        position: absolute;
        right: 5px;
        top: 40px;
        padding: 5px 10px;
        border: none;
        background-color: #696969;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }
    .password-input {
    display: flex;
    align-items: center;
	}
	.password-input input[type="password"] {
	    flex: 1;
	    padding-right: 40px;
	}
	.password-toggle {
	    border: none;
	    background: none;
	    cursor: pointer;
	    position: absolute;
	    right: 10px;
	    top: 50%;
	    transform: translateY(-50%);
	}
	.password-toggle img {
    vertical-align: middle;
    width: 30px;
    height: 30px;
	}
	
    .form-group ul {
    	margin: 16px 0 0;
        padding: 0;
        list-style-type: none;
        display: flex;
        justify-content: space-between;
    }
    .form-group li {
        font-size: 0.9em;
        color: #666;
    }
    .valid {
        color: black;
    }
    .invalid {
        color: lightgray;
    }
</style>
<body>
	<div id="wrap">
        <div id="member_registerForm">
            <div class="center">
                <h1>TRIP NEST</h1>
                <h2>회원가입</h2>
                
                <form action="${pageContext.request.contextPath}/member/insert" method="post">
				    <input type="hidden" name="token" id="token">
				    <div class="form-group">
				        <label for="name">이름</label>
				        <input type="text" id="member_name" name="member_name" placeholder="이용자 본인의 이름을 입력하세요." required="required">
				    </div>
				    <div class="form-group email-group">
				        <label for="email">이메일(아이디)</label>
				        <input type="email" id="member_useremail" name="member_useremail" placeholder="@까지 정확하게 입력하세요." required="required">
				        <button type="button" class="email-verify-btn" onclick="sendVerificationCode()">인증번호 받기</button>
				    </div>
				    <div class="form-group" id="verificationCodeGroup" style="display: none;">
				        <label for="verification_code">인증번호</label>
				        <input type="text" id="verification_code" name="verification_code" placeholder="이메일로 받은 인증번호를 입력하세요." required="required">
				        <button type="button" class="email-verify-btn" onclick="verifyCode()">인증</button>
				    </div>
				    <div class="form-group">
				        <label for="password">비밀번호</label>
				        <div class="password-input">
				            <input type="password" id="member_password" name="member_password" placeholder="비밀번호를 입력하세요." required="required">
				            <button type="button" class="password-toggle">
				                <img id="toggleIcon" alt="Show Password" src="../img/password_deactivate.ico">
				            </button>
				        </div>
				        <ul>
				            <li id="letter" class="invalid">✔️ 영문</li>
				            <li id="number" class="invalid">✔️ 숫자</li>
				            <li id="special" class="invalid">✔️ 특수문자</li>
				            <li id="length" class="invalid">✔️ 8자 이상 20자 이하</li>
				        </ul>
				    </div>
				    <div class="form-group">
				        <label for="phone">휴대폰 번호</label>
				        <input type="tel" id="member_phone" name="member_phone" placeholder="휴대폰 번호를 입력하세요." required="required">
				    </div>
				    <div class="form-group">
				        <label for="birthday">생일</label>
				        <input type="date" id="member_birth_date" name="member_birth_date" placeholder="생일을 입력하세요." required="required">
				    </div>
				    <div class="form-group">
				        <button type="submit" class="btn" id="submitBtn" disabled>JOIN</button>
				    </div>
				</form>
            </div>
        </div>
    </div>
	
<%@ include file="../include/footer.jsp"%>
	
	<script>
	const passwordInput = document.getElementById('member_password');
    const toggleIcon = document.getElementById('toggleIcon');
    const submitBtn = document.getElementById('submitBtn');
    const letter = document.getElementById('letter');
    const number = document.getElementById('number');
    const special = document.getElementById('special');
    const length = document.getElementById('length');
    let passwordVisible = false;

    passwordInput.addEventListener('input', function() {
        const value = passwordInput.value;
        if (/[a-zA-Z]/.test(value)) {
            letter.classList.remove('invalid');
            letter.classList.add('valid');
        } else {
            letter.classList.remove('valid');
            letter.classList.add('invalid');
        }
        if (/\d/.test(value)) {
            number.classList.remove('invalid');
            number.classList.add('valid');
        } else {
            number.classList.remove('valid');
            number.classList.add('invalid');
        }
        if (/[!@#$%^&*(),.?":{}|<>]/.test(value)) {
            special.classList.remove('invalid');
            special.classList.add('valid');
        } else {
            special.classList.remove('valid');
            special.classList.add('invalid');
        }
        if (value.length >= 8 && value.length <= 20) {
            length.classList.remove('invalid');
            length.classList.add('valid');
        } else {
            length.classList.remove('valid');
            length.classList.add('invalid');
        }
        if (/[a-zA-Z]/.test(value) && /\d/.test(value) && /[!@#$%^&*(),.?":{}|<>]/.test(value) && value.length >= 8 && value.length <= 20) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }
        letter.style.color = letter.classList.contains('valid') ? 'black' : 'lightgray';
        number.style.color = number.classList.contains('valid') ? 'black' : 'lightgray';
        special.style.color = special.classList.contains('valid') ? 'black' : 'lightgray';
        length.style.color = length.classList.contains('valid') ? 'black' : 'lightgray';
    });

    document.querySelector('.password-toggle').addEventListener('click', function() {
        passwordVisible = !passwordVisible;
        if (passwordVisible) {
            passwordInput.type = 'text';
            toggleIcon.src = '../img/password_activate.ico';
        } else {
            passwordInput.type = 'password';
            toggleIcon.src = '../img/password_deactivate.ico';
        }
    });

    function sendVerificationCode() {
        const email = document.getElementById('member_useremail').value;
        // 이메일 형식 검증
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            alert("올바른 이메일 주소를 입력하세요.");
            return;
        }

        console.log("Sending email verification request with params: ", { email });

        const xhr = new XMLHttpRequest();
        xhr.open("POST", `${pageContext.request.contextPath}/member/send-verification`, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        const params = new URLSearchParams({
            email: email
        }).toString();
        xhr.send(params);
        xhr.onload = function() {
            if (xhr.status === 200) {
                alert("인증번호가 전송되었습니다.");
                document.getElementById('verificationCodeGroup').style.display = 'block';
            } else {
                alert("인증번호 전송에 실패했습니다. 다시 시도해주세요.");
            }
        }
    }

    function verifyCode() {
        const email = document.getElementById('member_useremail').value;
        const code = document.getElementById('verification_code').value;
        const xhr = new XMLHttpRequest();
        xhr.open("POST", `${pageContext.request.contextPath}/member/verify-code`, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        const params = new URLSearchParams({
            email: email,
            code: code
        }).toString();
        xhr.send(params);
        xhr.onload = function() {
            if (xhr.status == 200 && xhr.responseText === "true") {
                alert("인증이 완료되었습니다.");
                submitBtn.disabled = false;
                // 인증 성공 시 토큰을 폼에 추가
                document.getElementById('token').value = code;
            } else {
                alert("인증에 실패했습니다. 다시 시도해주세요.");
            }
        }
    }
	</script>
</body>
</html>
