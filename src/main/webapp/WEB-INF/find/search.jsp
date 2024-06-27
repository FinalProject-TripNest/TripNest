<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<style>
#map {
	height: 500px;
	width: 100%;
}
</style>
<body>
	<div id="wrap">
		<div class="list">
			<c:forEach items="${hotels}" var="hotels" begin="0" end="2">
				<c:set var="firstImage" value="true" />
				<c:forEach items="${imagesDto}" var="image">
					<c:if test="${hotels.room_id eq image.room_id}">
						<c:if test="${firstImage}">
							<a class="block"
								href="find/list/detail?room_id=${hotels.room_id }"> <img
								alt="" src="${image.image_photo}">
								<div class="text_box">
									<span class="title">${hotels.room_name}</span> <span
										class="text">${hotels.city} / ${hotels.district} / 
										<fmt:formatNumber value="${hotels.room_price}" type="currency" />~
									</span>
								</div>
							</a>
							<c:set var="firstImage" value="false" />
						</c:if>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
		<div id="map"></div>
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	
	<script>
    function initMap() {
      
      var mapOptions = {
    		  center: { lat: ${latitude}, lng: ${longitude} },
              zoom: 16,
              gestureHandling: 'greedy' // 마우스 휠 이벤트가 지도에서만 작동
          };
      
      var map = new google.maps.Map(document.getElementById('map'),mapOptions);

      var hotels = [
        <c:forEach items="${hotels}" var="hotel" varStatus="loop">
          {
            lat: ${hotel.room_latitude},
            lng: ${hotel.room_longitude},
            name: '${hotel.room_name}'
          }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
      ];
	  
      //지도위에 마커찍는 함수
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
      
      //지도위에 마우스올리면 페이지 스크롤 막기 함수
      $('#map').on('scroll touchmove mousewheel', function(event) {

    	  event.preventDefault();
    	  event.stopPropagation();
    	  return false;

    	});
    }

    window.onload = initMap;
  </script>
</body>
</html>
