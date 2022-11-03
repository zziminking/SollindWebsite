/**
 * 
 */
function boardWriteCheck() {
	var title = document.boardWrite.title;
	var img = document.boardWrite.img;
	var text = document.boardWrite.text;
	if (isEmpty(title)) {
		alert("제목을 입력하시오.");
		title.focus();
		return false;
	}
	if (!isEmpty(img) && !fileType(img, "jpg")) {
		alert("jpg형식만 가능합니다.");
		img.value = "";
		img.focus();
		return false;
	}
	if (isEmpty(text)) {
		alert("글을 입력하시오.");
		text.focus();
		return false;
	}
	return true;
}
function boardRetouchCheck() {
	var title = document.boardRetouch.title;
	var img = document.boardRetouch.img;
	var text = document.boardRetouch.text;
	if (isEmpty(title)) {
		alert("제목을 입력하시오.");
		title.focus();
		return false;
	}
	if (!isEmpty(img) && !fileType(img, "jpg")) {
		alert("jpg형식만 가능합니다.");
		img.value = "";
		img.focus();
		return false;
	}
	if (isEmpty(text)) {
		alert("글을 입력하시오.");
		text.focus();
		return false;
	}
	return true;
}
function boardDeleteCheck() {
	var ok = confirm("글을 삭제 하시겠습니까?")
	if (ok) {
		return true;
	}
	return false;
}
function replyCheck() {
	var txt = document.writeReply.br_txt;
	if (isEmpty(txt)) {
		alert("댓글을 입력하시오.");
		txt.focus();
		return false;
	}
	return true;
}
function replyCheck2() {
	var txt = document.replyUpdateResult.br_txt;
	if (isEmpty(txt)) {
		alert("댓글을 입력하시오.");
		txt.focus();
		return false;
	}
	return true;
}