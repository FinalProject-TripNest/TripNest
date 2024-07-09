AOS.init();

$(window).scroll(function() {
	if ($(this).scrollTop() > 200) {
		$('.top_btn').fadeIn(200);

	} else {
		$('.top_btn').fadeOut(200);
	}
});

$('.top_btn').click(function() {
	$('html, body').animate({
		scrollTop: 0
	}, 1000);
	return false;
});

$(function() {

	var lastScroll = 0;
	$(window).scroll(function(event) {

		var st = $(this).scrollTop();
		if (st > lastScroll) {
			$("header#header .top_event").addClass("active");
			$("#wrap").addClass("active");

		}
		else {

		}
		lastScroll = st;

		if ($(this).scrollTop() == 0) {
			$("header#header .top_event").removeClass("active");
			$("#wrap").removeClass("active");

		}
	});
});


/*여기서 부터 searchbar script*/

$(document).ready(function() {
    // Flatpickr 한국어 로컬라이제이션 설정
    flatpickr.localize(flatpickr.l10ns.ko);

    const defaultDate = "${defaultDate}";
    
    // 오늘 날짜 가져오기
    const today = new Date().toISOString().split('T')[0];

    const dateRangePicker = flatpickr("#main_checkdate", {
        mode: "range",
        dateFormat: "Y-m-d",
        locale: "ko",
        minDate: today,
        defaultDate: defaultDate,
        onOpen: function(selectedDates, dateStr, instance) {
            const calendar = instance.calendarContainer;
            const dateInput = document.getElementById('main_checkdate');
            calendar.style.width = `${dateInput.offsetWidth}px`; // input 요소의 너비를 가져와서 달력의 너비로 설정
        },
        onChange: function(selectedDates, dateStr, instance) {
            if (selectedDates.length === 2) {
                // 선택된 날짜를 로컬 시간대로 변환
                const formatDate = (date) => {
                    const year = date.getFullYear();
                    const month = ('0' + (date.getMonth() + 1)).slice(-2);
                    const day = ('0' + date.getDate()).slice(-2);
                    return `${year}-${month}-${day}`;
                };

                const checkinDate = formatDate(selectedDates[0]);
                const checkoutDate = formatDate(selectedDates[1]);

                console.log("Check-in Date:", checkinDate);
                console.log("Check-out Date:", checkoutDate);

                // jQuery를 사용하여 checkin 및 checkout 필드에 값 설정
                $('#main_checkin').val(checkinDate);
                $('#main_checkout').val(checkoutDate);
            }
        }
    });

    // 인원 input 창에 인원 선택해주는 modal 창 함수
    const $counter = $('.main_counter');
    const $decrementBtn = $counter.find('.main_decrement');
    const $incrementBtn = $counter.find('.main_increment');
    const $countDisplay = $counter.find('span');
    let count = parseInt($countDisplay.text());

    $decrementBtn.on('click', function() {
        if (count > 1) {
            count--;
            $countDisplay.text(count);
        }
    });

    $incrementBtn.on('click', function() {
        count++;
        $countDisplay.text(count);
    });

    const $saveBtn = $('#main_savePersonnel');
    $saveBtn.on('click', function() {
        const inputCount = count + '명';
        $('#main_personnelinput').text(inputCount);
        $('#main_personnelcount').val(count); // 숫자 값만 숨겨진 필드에 저장
        $('.main_modal-content').hide();
    });

    $('#main_personnel').on('click', function(event) {
        event.stopPropagation();
        const $personnel = $(this);
        const offset = $personnel.offset();
        const height = $personnel.outerHeight();
        const width = $personnel.outerWidth();
        $('.main_modal-content').css({
            top: offset.top + height + 'px',
            left: offset.left + 'px',
            width: width + 'px' // main_personnel 요소의 너비로 설정
        }).show();
    });

    $(document).on('click', function(event) {
        if (!$(event.target).closest('#main_personnel, .main_modal-content').length) {
            $('.main_modal-content').hide();
        }
    });
});

// 구글지도 검색추천 함수
function initAutocomplete() {
    var input = document.getElementById('main_address_input');
    var autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();

        console.log(place);

        // 경도, 위도 전달 함수
        if (place.geometry) {
            var latitude = place.geometry.location.lat();
            var longitude = place.geometry.location.lng();

            document.getElementById('main_latitude').value = latitude;
            document.getElementById('main_longitude').value = longitude;

            console.log('main_Latitude:', latitude);
            console.log('main_Longitude:', longitude);
        } else {
            console.log("google maps api에 없는 장소입니다");
        }
    });
}
initAutocomplete();
