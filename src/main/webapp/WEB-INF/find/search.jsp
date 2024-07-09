<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>

<body>
    	<div id="search2" class="title" data-aos="fade-up">
			<a class="title2" id="">SEARCH</a>
		</div>
		<div id="search">
        <div id="list_container">
            <div id="list_count">
                <c:choose>
                    <c:when test="${empty roomsDto}">
                        <p>호텔 검색 결과가 없음</p>
                    </c:when>
                    <c:otherwise>
                        <p>호텔 ${fn:length(roomsDto)}개 이상</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="list">
                <c:forEach items="${roomsDto}" var="roomsDto" varStatus="status">
                    <c:if test="${status.index < 30}">
                        <c:set var="firstImage" value="true" />
                        <c:forEach items="${imagesDto}" var="imageDto">
                            <c:if test="${roomsDto.room_id eq imageDto.room_id}">
                                <c:if test="${firstImage}">
                                    <a class="block" href="list/detail?room_id=${roomsDto.room_id }&checkin=${checkin }&checkout=${checkout}">
                                        <div class="img">
                                            <img alt="" src="${imageDto.image_photo}">
                                        </div>
                                        <div class="text_box">
                                            <div class="top">
                                                <p class="title">${roomsDto.room_name}</p> 
                                                <p class="rating">
                                                    <img id="search_rating" alt="" src="../img/find/star.png"><span>${roomsDto.room_rating}</span>
                                                </p>
                                            </div>
                                            <div class="location">
                                                <span>${roomsDto.city} / ${roomsDto.district}</span>
                                            </div>
                                            <div class="standard">
                                                <span>기준${roomsDto.room_min_capacity }명(최대${roomsDto.room_max_capacity}명)</span>
                                            </div>
                                            <div class="price">
                                                <span class="text">
                                                    <fmt:formatNumber value="${roomsDto.room_price}" type="currency" />~
                                                </span>                                                                                
                                            </div>
                                        </div>
                                    </a>
                                    <c:set var="firstImage" value="false" />
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    <div id="map"></div>
    </div>
    <div id="pagination">
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <button class="page-btn" data-page="${pageNum}">${pageNum}</button>
        </c:forEach>
    </div>

    <%@ include file="../include/footer.jsp"%>

    <script>
    function initMap() {
        var mapOptions = {
            center: { lat: parseFloat(${latitude}), lng: parseFloat(${longitude}) },
            zoom: 12,
            gestureHandling: 'greedy' // 마우스 휠 이벤트가 지도에서만 작동
        };

        var map = new google.maps.Map(document.getElementById('map'), mapOptions);

        var hotels = [
            <c:forEach items="${roomsDto}" var="room" varStatus="loop">
            {
                lat: parseFloat(${room.room_latitude}),
                lng: parseFloat(${room.room_longitude}),
                name: '${room.room_name}'
            }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        // 지도 위에 마커 찍는 함수
        hotels.forEach(function(hotel) {
            var marker = new google.maps.Marker({
                position: { lat: hotel.lat, lng: hotel.lng },
                map: map,
                title: hotel.name
            });

            var infoWindow = new google.maps.InfoWindow({
                content: '<div><strong>' + hotel.name + '</strong><br>' +
                    'Latitude: ' + hotel.lat + '<br>' +
                    'Longitude: ' + hotel.lng + '</div>'
            });

            marker.addListener('click', function() {
                infoWindow.open(map, marker);
            });
        });

        // 지도 위에 마우스 올리면 페이지 스크롤 막기 함수
        $('#map').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });
    }

    window.onload = initMap;
    
    document.addEventListener('DOMContentLoaded', function() {
        const listContainer = document.getElementById('list_container');

        listContainer.addEventListener('wheel', function(event) {
          const delta = Math.sign(event.deltaY);
          const atTop = listContainer.scrollTop === 0;
          const atBottom = listContainer.scrollHeight - listContainer.scrollTop === listContainer.clientHeight;

          if ((delta > 0 && !atBottom) || (delta < 0 && !atTop)) {
            listContainer.scrollTop += event.deltaY;
            event.preventDefault();
            event.stopPropagation();
          }
        });
      });
    </script>
</body>
</html>