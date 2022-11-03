// 일반적
// 컨셉 : 부정적
// 잘못되면 true, 제대로 false

// 필수검사
// <input>을 넣었을때
// 안썼으면 true, 썼으면 false
function empty(input) {
	return !input.value;
}

//<input>, 최소글자수를 넣었을때
//짧으면 true, 길면 false
function lessThan(input, len) {
	return input.value.length < len;
}

//<input>넣었을때 한글/특수문자 있으면 true, 없으면 false
function containsHS(input) {
	var hs = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_@.";
	// ah2ㄱf
	for (var i = 0; i < input.value.length; i++) {
		if (hs.indexOf(input.value[i]) == -1) {
			return true;
		}
	}
	return false;
}

// 비번검사
// <input> x 2개 넣었을때, 내용이 다르면 true 같으면 false
function notEquals(input1, input2) {
	return input1.value != input2.value;
}

// 조합
// <input>, 문자열세트를 넣었을때
// 그 문자열세트에 있는 글자가 없으면 true, 있으면 false
function notContains(input, set) {
	for (var i = 0; i < set.length; i++) {
		// abc6789
		if (input.value.indexOf(set[i]) != -1) {
			return false;
		}
	}
	return true;
}

// <input>넣었을때
// 숫자가 아니면 true, 숫자만 있으면 false
function isNotNumber(input){
	return isNaN(input.value) || (input.value.indexOf(' ') != -1);
}

// <input>넣었을때
// 음수면 true, 양수면 false
function isNegative(input){
	return input.value < 0;
}

// 사진파일만
// <input>, 확장자 넣었을때
// 그게 아니면 true, 그거면 false
function isNotType(input, type){
	type = "." + type; // ex).png로 .을 붙여줌
	var fName = input.value.toLowerCase(); //소문자로 바꿔주는 내장되있는것
	return fName.indexOf(type) == -1;
}