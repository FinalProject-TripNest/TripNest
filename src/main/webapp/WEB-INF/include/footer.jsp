<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<footer id="footer">
   <div class="container_wide">
      <div class="footer_cont">
         <div class="logo">
            <img src="${root }/img/common/logo.png" alt="STAYFOLIO">
         </div>
         <div class="menu-cs">
            <ul class="menu">
               <li><a target="_self" rel="noreferrer" href="/about">ABOUT</a></li>
               <li><a target="_self" rel="noreferrer"
                  href="/4-point-approach">4 POINT APPROACH</a></li>
               <li><a target="_blank" rel="noreferrer"
                  href="https://page.stibee.com/subscriptions/243310?groupIds=238993">NEWSLETTER</a></li>
               <li><a target="_blank" rel="noreferrer"
                  href="http://stayfolio.kr/career">CAREERS</a></li>
            </ul>
            <div class="cs">
               <div>
                  <div class="cs-tit" style="margin-top: 24px">고객센터</div>
               </div>
               <div class="cs-btns" style="min-height: 44px">
                  <button type="button" class="gry">1:1 문의</button>
                  <button type="button" class="wh">
                     <a rel="noreferrer">입점 문의</a>
                  </button>
                  <button type="button" class="wh">
                     <a rel="noreferrer">컨설팅 문의</a>
                  </button>
                  <button type="button" class="wh">
                     <a target="_blank" rel="noopener noreferrer">마케팅 제휴</a>
                  </button>
                  <button type="button" class="wh">
                     <a rel="noreferrer">B2B 구매</a>
                  </button>
               </div>
               <div class="cs-time">운영시간 : 평일 10:00 ~ 18:00 / 주말 및 공휴일 제외</div>
               <div class="cs-terms">
                  <a
                     href="https://stayfolio.notion.site/Ver-1-5-25cf5f57f2384b7aa8bf0f07fa93270b"
                     target="_blank" rel="noreferrer">이용약관</a><a
                     href="https://stayfolio.notion.site/Ver-2-2-b230062ee0b24c46884b89da8d264e7e"
                     target="_blank" rel="noreferrer" class="bold">개인정보 처리방침</a>
               </div>
            </div>
         </div>
         <div class="copyright">Copyright©TRIPNEST</div>
      </div>
      <div class="footer_address">

         <span class="info" style="word-break: keep-all">상호명 (주) 트립네스트<!-- -->
            |<!-- --> <!-- --> <!-- -->대표자 김민규<!-- --> | <!-- -->주소 서울특별시 강남구
            역삼동 테헤란로<!-- --> | <!-- -->전화 3456-2143<!-- --> |<!-- --> <!-- -->help@tripnest.com<!-- -->
            <br>사업자등록번호 676-87-00055<!-- --> |<!-- --> <!-- -->통신판매업신고
            제2015-서울강남-0499호<!-- --> <a class="info" href="javascript:;"
										rel="noreferrer">[사업자정보확인]</a> <!-- -->| <!-- -->관광사업자등록 일반여행업
            2018-000049호(강남구청)<!-- --> <!-- -->
            <div class="info">(주)트립네스트는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약,
               이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</div></span>
      </div>
   </div>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="${root }/js/index.js"></script>

