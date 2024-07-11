<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<title>TRIP NEST</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    #reset_password_form {
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
        margin-bottom: 10px;
    }
    input[type="password"], input[type="text"] {
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
        position: relative;
    }
    .password-input input[type="password"], .password-input input[type="text"] {
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
    .error {
        color: red;
        font-size: 0.9em;
        margin-top: 5px;
    }
</style>
<body>
    <div id="wrap">
        <div id="reset_password_form">
            <div class="center">
                <h1>TRIP NEST</h1>
                <h2>비밀번호 재설정</h2>
                
                <form action="${pageContext.request.contextPath}/member/resetPassword" method="post">
                    <input type="hidden" name="token" value="${token}">
                    <div class="form-group">
                        <label for="new_password">새 비밀번호</label>
                        <div class="password-input">
                            <input type="password" id="new_password" name="new_password" placeholder="새 비밀번호" required="required">
                            <button type="button" class="password-toggle" onclick="togglePasswordVisibility('new_password', 'toggleIcon')">
                                <img id="toggleIcon" alt="Show Password" src="../img/register_login/password_deactivate.ico">
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">비밀번호 확인</label>
                        <div class="password-input">
                            <input type="password" id="confirm_password" name="confirm_password" placeholder="비밀번호 확인" required="required">
                            <button type="button" class="password-toggle" onclick="togglePasswordVisibility('confirm_password', 'toggleConfirmIcon')">
                                <img id="toggleConfirmIcon" alt="Show Password" src="../img/register_login/password_deactivate.ico">
                            </button>
                        </div>
                        <p id="matchMessage" class="error" style="display: none;">비밀번호가 일치하지 않습니다.</p>
                    </div>
                    <div class="form-group">
                        <ul>
                            <li id="letter" class="invalid">✔️ 영문</li>
                            <li id="number" class="invalid">✔️ 숫자</li>
                            <li id="special" class="invalid">✔️ 특수문자</li>
                            <li id="length" class="invalid">✔️ 8자 이상 20자 이하</li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn" id="submitBtn" disabled>비밀번호 재설정</button>
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
    const passwordInput = document.getElementById('new_password');
    const confirmPasswordInput = document.getElementById('confirm_password');
    const toggleIcon = document.getElementById('toggleIcon');
    const toggleConfirmIcon = document.getElementById('toggleConfirmIcon');
    const submitBtn = document.getElementById('submitBtn');
    const letter = document.getElementById('letter');
    const number = document.getElementById('number');
    const special = document.getElementById('special');
    const length = document.getElementById('length');
    const matchMessage = document.getElementById('matchMessage');
    let passwordVisible = false;
    let confirmPasswordVisible = false;

    passwordInput.addEventListener('input', validatePassword);
    confirmPasswordInput.addEventListener('input', validatePassword);

    document.querySelectorAll('.password-toggle').forEach(button => {
        button.addEventListener('click', function() {
            const input = this.previousElementSibling;
            const icon = this.querySelector('img');
            const isPasswordVisible = input.type === 'password';
            input.type = isPasswordVisible ? 'text' : 'password';
            icon.src = isPasswordVisible ? '../img/register_login/password_activate.ico' : '../img/register_login/password_deactivate.ico';
        });
    });

    function validatePassword() {
        const value = passwordInput.value;
        const confirmValue = confirmPasswordInput.value;

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
        if (/[a-zA-Z]/.test(value) && /\d/.test(value) && /[!@#$%^&*(),.?":{}|<>]/.test(value) && value.length >= 8 && value.length <= 20 && value === confirmValue) {
            submitBtn.disabled = false;
            matchMessage.style.display = 'none';
        } else {
            submitBtn.disabled = true;
            if (value !== confirmValue) {
                matchMessage.style.display = 'block';
            } else {
                matchMessage.style.display = 'none';
            }
        }

        letter.style.color = letter.classList.contains('valid') ? 'black' : 'lightgray';
        number.style.color = number.classList.contains('valid') ? 'black' : 'lightgray';
        special.style.color = special.classList.contains('valid') ? 'black' : 'lightgray';
        length.style.color = length.classList.contains('valid') ? 'black' : 'lightgray';
    }
</script>
</body>
</html>
