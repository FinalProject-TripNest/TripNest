$(document).ready(function() {
	// Flatpickr 한국어 로컬라이제이션 설정
	flatpickr.localize(flatpickr.l10ns.ko);
	
	// 오늘 날짜 가져오기
	const today = new Date().toISOString().split('T')[0];

	const dateRangePicker = flatpickr("#header_checkdate", {
		mode: "range",
		dateFormat: "Y-m-d",
		locale: "ko",
		minDate: today,
		onChange: function(selectedDates, dateStr, instance) {
			if (selectedDates.length === 2) {
				const checkinDate = selectedDates[0].toLocaleDateString('ko-KR', {
					year: 'numeric',
					month: '2-digit',
					day: '2-digit'
				}).split('. ').join('-').slice(0, -1);
				const checkoutDate = selectedDates[1].toLocaleDateString('ko-KR', {
					year: 'numeric',
					month: '2-digit',
					day: '2-digit'
				}).split('. ').join('-').slice(0, -1);
				document.getElementById('header_checkin').value = checkinDate;
				document.getElementById('header_checkout').value = checkoutDate;
			}
		}
	});

	// 체크인 또는 체크아웃 입력 필드를 클릭하면 캘린더가 열리도록 설정
	document.getElementById('header_checkdate').addEventListener('focus', function() {
		dateRangePicker.open();
	});


	// 구글지도 검색추천 함수
	function initAutocomplete() {
		var input = document.getElementById('header_address');
		var autocomplete = new google.maps.places.Autocomplete(input);

		autocomplete.addListener('place_changed', function() {
			var place = autocomplete.getPlace();

			console.log(place);

			// 경도, 위도 전달 함수
			if (place.geometry) {
				var latitude = place.geometry.location.lat();
				var longitude = place.geometry.location.lng();

				document.getElementById('header_latitude').value = latitude;
				document.getElementById('header_longitude').value = longitude;

				console.log('Latitude:', latitude);
				console.log('Longitude:', longitude);
			} else {
				console.log("google maps api에 없는 장소입니다");
			}
		});
		
	}

	document.getElementById('openLocationSearch').onclick = function() {
	    document.getElementById('header_locationsearch').style.display = "block";
	}
	
	document.getElementById('closeLocationSearch').onclick = function() {
	    document.getElementById('header_locationsearch').style.display = "none";
	}
	
	document.getElementById('openDateSearch').onclick = function() {
	    document.getElementById('header_datesearch').style.display = "block";
	}
	
	document.getElementById('closeDateSearch').onclick = function() {
	    document.getElementById('header_datesearch').style.display = "none";
	}
	
	// 모달 외부 클릭 시 닫기
	window.onclick = function(event) {
	    if (event.target == document.getElementById('header_locationsearch')) {
	        document.getElementById('header_locationsearch').style.display = "none";
	    }
	    if (event.target == document.getElementById('header_datesearch')) {
	        document.getElementById('header_datesearch').style.display = "none";
	    }
	}
	
	initAutocomplete();
});