// 일반적
// 컨셉 : 부정적
// 잘못되면 true, 제대로 false

// 필수검사 : 일반적
// <input>을 넣었을때
// 안썼으면 true, 썼으면 false
function isEmpty(input) {
	return !input.value;
}

// <input>, 최소글자수를 넣었을때
// 짧으면 true, 길면 false
function lessThan(input, len) {
	return input.value.length < len;
}

function containsHS(input) {
	var hs = "1234567890abcdefghijklmnopqrstuvwxyzABCDEDFHIJKLMNOPQRSTUVWXYZ-_@.";
	for (var i = 0; i < input.value.length; i++) {
		if (hs.indexOf(input.value[i]) == -1) {
			return true;
		}
	}
	return false;
}
//	비번검사
//	<input> x2 넣었을 때, 내용이 다르면 true, 같으면 false
function notEquals(input1, input2) {
	return input1.value != input2.value;
}
function notContains(input, set) {
	for (var i = 0; i < set.length; i++) {
		if (input.value.indexOf(set[i]) != -1) {
			return false;
		}
	} return true;
}
function isNotNumber(input) {
	return isNaN(input.value);

}
function isNegative(input) {
	return input.value < 0;
}
//	사진파일만
//	pdf만
//	<input> , 확장자 넣었을떄
//	그게 아니면 true, 그거면 false
function isNotType(input, type) {
	type = "." + type;
	var fName = input.value.toLowerCase();
	return fName.indexOf(type) == -1;
}