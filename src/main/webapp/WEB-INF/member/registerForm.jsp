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
				<h1>TRIP NEST JOIN</h1>
    			<h2>회원가입</h2>
				
				<form action="insert" method="post">
					<div class="form-group">
			            <label for="name">이름</label>
			            <input type="text" id="member_name" name="member_name" placeholder="이용자 본인의 이름을 입력하세요." required="required">
			        </div>
			        <div class="form-group">
			            <label for="email">이메일(아이디)</label>
			            <input type="email" id="member_useremail" name="member_useremail" placeholder="@까지 정확하게 입력하세요." required="required">
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
        
        // 영문 확인
        if (/[a-zA-Z]/.test(value)) {
            letter.classList.remove('invalid');
            letter.classList.add('valid');
        } else {
            letter.classList.remove('valid');
            letter.classList.add('invalid');
        }

        // 숫자 확인
        if (/\d/.test(value)) {
            number.classList.remove('invalid');
            number.classList.add('valid');
        } else {
            number.classList.remove('valid');
            number.classList.add('invalid');
        }

        // 특수문자 확인
        if (/[!@#$%^&*(),.?":{}|<>]/.test(value)) {
            special.classList.remove('invalid');
            special.classList.add('valid');
        } else {
            special.classList.remove('valid');
            special.classList.add('invalid');
        }

        // 길이 확인
        if (value.length >= 8 && value.length <= 20) {
            length.classList.remove('invalid');
            length.classList.add('valid');
        } else {
            length.classList.remove('valid');
            length.classList.add('invalid');
        }

        // 비밀번호 요구사항이 모두 충족되면 버튼 활성화
        if (/[a-zA-Z]/.test(value) && /\d/.test(value) && /[!@#$%^&*(),.?":{}|<>]/.test(value) && value.length >= 8 && value.length <= 20) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }

        // 영문, 숫자, 특수문자, 길이 요구사항에 따라 색상 변경
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
	</script>
</body>
</html>