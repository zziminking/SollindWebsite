function getStarScore() {
	$(".star1").click(function() {
		$(".star1").attr("src", "resources/img/companyImg/star.png");
		$(".star2").attr("src", "resources/img/companyImg/star2.png");
		$(".star3").attr("src", "resources/img/companyImg/star2.png");
		$(".star4").attr("src", "resources/img/companyImg/star2.png");
		$(".star5").attr("src", "resources/img/companyImg/star2.png");
		$(".starScore").attr("value", "1");
	});
	
	$(".star2").click(function() {
		$(".star1").attr("src", "resources/img/companyImg/star.png");
		$(".star2").attr("src", "resources/img/companyImg/star.png");
		$(".star3").attr("src", "resources/img/companyImg/star2.png");
		$(".star4").attr("src", "resources/img/companyImg/star2.png");
		$(".star5").attr("src", "resources/img/companyImg/star2.png");
		$(".starScore").attr("value", "2");
	});
	
	$(".star3").click(function() {
		$(".star1").attr("src", "resources/img/companyImg/star.png");
		$(".star2").attr("src", "resources/img/companyImg/star.png");
		$(".star3").attr("src", "resources/img/companyImg/star.png");
		$(".star4").attr("src", "resources/img/companyImg/star2.png");
		$(".star5").attr("src", "resources/img/companyImg/star2.png");
		$(".starScore").attr("value", "3");
	});
	
	$(".star4").click(function() {
		$(".star1").attr("src", "resources/img/companyImg/star.png");
		$(".star2").attr("src", "resources/img/companyImg/star.png");
		$(".star3").attr("src", "resources/img/companyImg/star.png");
		$(".star4").attr("src", "resources/img/companyImg/star.png");
		$(".star5").attr("src", "resources/img/companyImg/star2.png");
		$(".starScore").attr("value", "4");
	});
	
	$(".star5").click(function() {
		$(".star1").attr("src", "resources/img/companyImg/star.png");
		$(".star2").attr("src", "resources/img/companyImg/star.png");
		$(".star3").attr("src", "resources/img/companyImg/star.png");
		$(".star4").attr("src", "resources/img/companyImg/star.png");
		$(".star5").attr("src", "resources/img/companyImg/star.png");
		$(".starScore").attr("value", "5");
	});
	
	$(".cRWScore Img").mouseenter(function() {
		$(this).css("cursor", "pointer");
	});
	$(".cRWScore Img").mouseleave(function() {
		$(this).css("cursor", "default");
	});
}

function titleEnterDefence() {
	$(".cRWTitle").keydown(function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
		}
	});
}
$(function() {
	getStarScore();
	titleEnterDefence();
});