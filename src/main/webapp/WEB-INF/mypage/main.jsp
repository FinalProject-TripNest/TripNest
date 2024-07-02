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
    .mypage_wrap {
        max-width: 1000px;
        margin: 0 auto;
        padding: 20px;
    }
    .mypage_info {
        text-align: center;
        margin: 250px 0 20px;
    }
    .mypage_info .title {
        font-size: 24px;
        margin-bottom: 10px;
    }
    .mypage_info .journey-info {
        font-size: 16px;
        color: #999;
    }
    .separator {
        width: 100%;
        height: 3px;
        background-color: #000;
        margin: 80px 0;
    }
    .content_wrapper {
        display: flex;
        align-items: flex-start;
    }
    .mypage_menu {
        width: 200px;
        margin-right: 40px;
    }
    .mypage_menu ul {
        list-style: none;
        padding: 0;
    }
    .mypage_menu li {
        margin-bottom: 20px;
    }
    .mypage_menu a, .mypage_menu button {
        display: block;
        width: 100%;
        text-align: left;
        padding: 10px;
        text-decoration: none;
        color: #333;
        font-size: 16px;
        border: 1px solid transparent;
        background: none;
        cursor: pointer;
    }
    .mypage_menu a.active, .mypage_menu a:hover, .mypage_menu button.active, .mypage_menu button:hover {
        color: #000;
        font-weight: bold;
    }
    .mypage_content {
        flex: 1;
    }
    .tabs {
        list-style: none;
        padding: 0;
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .tabs li {
        margin: 0 20px;
    }
    .tabs li a {
        text-decoration: none;
        color: #333;
        font-size: 18px;
        padding: 10px;
        display: block;	    
        }	    
    .tabs li a:hover,
    .tabs li.active a {
        color: #000;
        border-bottom: 2px solid #000;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
    }
    .btn:hover {
        background-color: #000;
    }
</style>
<body>
    <div id="wrap">
        <div id="mypage_main">
            <div class="center">
                <div class="mypage_info">
                    <div class="title">
                        <p>${memberDto.member_name}님 반가워요!</p>
                    </div>
                    <br>
                    <div class="journey-info" role="link" tabindex="0">
                        <p>2024년 6월부터 0번의 여행을 했어요.</p>
                    </div>
                </div>
                <div class="separator"></div>
                <div class="content_wrapper">
                    <div class="mypage_menu">
                        <ul>
                            <li><a href="#" data-target="reservation" class="menu-item">예약 정보</a></li>
                            <li><a href="#" data-target="cancel" class="menu-item">취소 내역</a></li>
                            <li><a href="#" data-target="coupon" class="menu-item">보유 쿠폰</a></li>
                            <li><a href="#" data-target="likestay" class="menu-item">관심 스테이</a></li>
                            <li><a href="#" data-target="edit" class="menu-item">회원 정보 수정</a></li>
                            <li><a href="#" data-target="message" class="menu-item">메시지</a></li>
                            <li><a href="#" data-target="myinquery" class="menu-item">1:1 문의</a></li>
                        </ul>
                    </div>
                    <div class="mypage_content" id="mypage_content">
                        <!-- Initial content can be loaded here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../include/footer.jsp"%>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // 해시값을 기반으로 타겟 페이지를 로드하는 함수
        function loadContent(target) {
            if (!target) {
                target = "reservation";
            }
            $('#mypage_content').load('/mypage/' + target);
            $('.menu-item').removeClass('active');
            $('a[data-target="' + target + '"]').addClass('active');
        }

        // 초기 해시값을 확인하고 적절한 컨텐츠를 로드
        var initialTarget = window.location.hash.substr(1);
        loadContent(initialTarget);

        // 메뉴 항목 클릭 이벤트 핸들러
        $('.mypage_menu a').on('click', function(e) {
            e.preventDefault();
            var target = $(this).data('target');
            window.location.hash = target;
            loadContent(target);
        });

        // 해시 변경 이벤트 핸들러 (브라우저 뒤로 가기/앞으로 가기)
        $(window).on('hashchange', function() {
            var target = window.location.hash.substr(1);
            loadContent(target);
        });
    });
    </script>
</body>
</html>
