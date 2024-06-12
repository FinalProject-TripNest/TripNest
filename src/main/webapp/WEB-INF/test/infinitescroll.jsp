<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<title>TRIP NEST</title>
<!-- 외부 CSS 파일 포함 -->
<link rel="stylesheet" href="https://codepen.io/desandro/pen/owWLYz.css">
<style>
/* 각 페이지 스타일 */
.grid {
	display: flex;
	flex-wrap: wrap;
	height: auto !important;
}
/* reveal grid after images loaded */
.grid.are-images-unloaded {
	opacity: 0;
}

/* hide by default */
.grid.are-images-unloaded .image-grid__item {
	opacity: 0;
}

.page-load-status {
	display: none; /* hidden by default */
	padding-top: 20px;
	border-top: 1px solid #DDD;
	text-align: center;
	color: #777;
}

.a {
	width: calc(( 100% - 40px)/3);
	height: 500px;
	border: 1px solid red;
	position: static !important;
	margin-right: 20px;
	margin-bottom: 60px;
}

.a:nth-child(3n) {
	margin-right: 0
}
/* loader ellips in separate pen CSS */
/* //각 페이지 스타일 */
</style>
<body>
	<div id="wrap">
		<div id="promotion_detail">
			<div class="center">
				<!-- 각 페이지 작업 코드 -->
				<h1>123</h1>
				<div class="grid are-images-unloaded">

					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
					<div class="a">1111</div>
				</div>
				<div class="page-load-status">
					<div class="loader-ellips infinite-scroll-request">
						<span class="loader-ellips__dot"></span> <span
							class="loader-ellips__dot"></span> <span
							class="loader-ellips__dot"></span> <span
							class="loader-ellips__dot"></span>
					</div>
					<p class="infinite-scroll-last">End of content</p>
					<p class="infinite-scroll-error">No more pages to load</p>
				</div>
				<!--//각 페이지 작업 코드  -->
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
	<script
		src="https://unpkg.com/infinite-scroll@4/dist/infinite-scroll.pkgd.js"></script>
	<script>
		//각 페이지 자바스크립트
		let grid = document.querySelector('.grid');

		let msnry = new Masonry(grid, {
			itemSelector : 'none', // select none at first

			percentPosition : true,
			stagger : 30,
			visibleStyle : {
				transform : 'translateY(0)',
				opacity : 1
			},
			hiddenStyle : {
				transform : 'translateY(100px)',
				opacity : 0
			},
		});

		imagesLoaded(grid, function() {
			grid.classList.remove('are-images-unloaded');
			msnry.options.itemSelector = '.a';
			let items = grid.querySelectorAll('.a');
			msnry.appended(items);
		});

		var nextPenSlugs = [ '202252c2f5f192688dada252913ccf13',
				'a308f05af22690139e9a2bc655bfe3ee',
				'6c9ff23039157ee37b3ab982245eef28', ];

		function getPenPath() {
			let slug = nextPenSlugs[this.loadCount];
			if (slug) {
				return `../index`; // 실제 경로로 변경
			}
		}

		let infScroll = new InfiniteScroll(grid, {
			path : getPenPath,
			append : '.a',
			outlayer : msnry,
			status : '.page-load-status',
			history : false,
			crossOrigin : false
		// 이 부분을 추가하여 CORS 정책을 우회합니다.
		});
		//각 페이지 자바스크립트
	</script>
</body>
</html>
