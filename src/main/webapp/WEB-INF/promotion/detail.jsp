<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>TRIP NEST</title>
<body>


	<div id="wrap">
		<div id="promotion_detail">
			<div class="bg">
				<div class="title">${dto.promotion_title }</div>
				<div class="event">${dto.promotion_content }</div>
				<div class="date">
					<fmt:formatDate value="${dto.promotion_date }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="center">
				<div class="main">
					<div id="member-id">${sessionScope.member.member_id}</div>
					<div class="img">
						<img alt="" src="${dto.promotion_photo}">
					</div>
					<div class="text">
						<p>${dto.promotion_explanation}</p>
					</div>

					<%-- 해당 프로모션에 쿠폰 이벤트가 있는경우에만 쿠폰 발급 번틀을 보여줌 --%>
					<c:if test="${couponGroupId != null}">
						<div class="btn">
							<div id="coupon-btn" onclick="newCoupon(${couponGroupId})">쿠폰 발급</div>
						</div>
					</c:if>

				</div>

			</div>
		</div>
	</div>

<script>

    async function newCoupon(couponGroupId){
		const memberId = document.getElementById("member-id").innerText.trim();
		console.log("memberId : "+memberId);

        // 로그인 확인
        if(memberId === ""){
            alert("로그인이 필요합니다.");
            location.href = "/login/loginform";
            return;
        }

        try{
			console.log("http://localhost:8080/api/coupons/"+couponGroupId+"/issue");
            const response = await fetch("http://localhost:8080/api/coupons/"+couponGroupId+"/issue",{
                method: "POST",
                headers:{
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    "memberId": memberId,
                }),
            });
            if(response.ok){
                alert("쿠폰이 발급되었습니다.");
            }else{
				console.log(response);
                alert("쿠폰 발급에 실패했습니다.");
            }
        }catch(error){
            throw new Error("쿠폰 발급 api 요청 실패");
        }
    }

</script>



<%@ include file="../include/footer.jsp"%>
</body>
</html>