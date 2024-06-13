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