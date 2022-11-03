function loginModal() {
	$("#homeLogin").click(function() {
		$("#homeLogin").css("cursor","pointer");
		$("#backgroundTb").css("position", "fixed");
		$("#backgroundTb").css("right", "10px");
		$("#backgroundTb").css("top", "1px");
		$("#loginTb").css("position", "fixed");
		$("#loginTb").css("right", "700px");
		$("#loginTb").css("top", "250px");
	});
}
function closeModal() {
	$("#backgroundTb").click(function() {
		$("#backgroundTb").css("right","-1000%");
		$("#loginTb").css("right","-1000%");
	});
}

$(function() {
	loginModal();
	closeModal();
});