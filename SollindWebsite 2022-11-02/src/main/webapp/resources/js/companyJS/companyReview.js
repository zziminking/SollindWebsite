function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (obj.scrollHeight) + 'px';
}

function check(f) {
	var title = f.cr_title;
	var advantage = f.cr_advantage;
	var weakness = f.cr_weakness;
	
	if (isEmpty(title)) {
		alert("제목을 입력해주세요");
		title.focus();
		return false;
	}
	
	if (isEmpty(advantage)) {
		alert("장점을 입력해주세요");
		advantage.focus();
		return false;
	}
	
	if (isEmpty(weakness)) {
		alert("단점을 입력해주세요");
		weakness.focus();
		return false;
	}
	return true;
}