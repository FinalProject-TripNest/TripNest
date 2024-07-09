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

