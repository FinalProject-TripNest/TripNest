 $(document).ready(function() {
	            // Flatpickr 한국어 로컬라이제이션 설정
	            flatpickr.localize(flatpickr.l10ns.ko);

	            // 서버에서 전달된 기본 날짜 (JSP/Thymeleaf 등에서 전달)
	            const defaultDate = "${defaultDate}"; 

	            // 오늘 날짜 가져오기
	            const today = new Date().toISOString().split('T')[0];

	            const dateRangePicker = flatpickr(".detail_date", {
	                mode: "range",
	                dateFormat: "Y-m-d",
	                locale: "ko",
	                minDate: today,
	                defaultDate: defaultDate,
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

	                         // a 태그의 href 속성 업데이트
                        	const roomId = $("#roomId").val();
                        	const paymentUrl = "../../find/reservation?room_id="+roomId+"&checkin="+checkinDate+"&checkout="+checkoutDate;
                        	$('.payment_btn').attr('href', paymentUrl);
	                    }
	                }
	            });

				$(".data_btn").on("click", function() {
        			$(".detail_date").focus();
    			});

	            console.log('Flatpickr initialized:', dateRangePicker);
	        });