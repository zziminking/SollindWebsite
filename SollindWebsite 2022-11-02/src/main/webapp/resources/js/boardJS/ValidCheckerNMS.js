/**
 * 내가 만든 유효성 검사
 */
 
function isEmpty(input){
	return !input.value;
}

function lessThanMinLength(input, num){
	return input.value.length < num;
}

function containsHS(input){
	var text = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789-_!@#$%^&*";
	
	for (var i = 0; i < input.value.length; i++) {
		if (text.indexOf(input.value[i]) == -1) {
			return true;
		}
	}
	return false;
}

function same(input1, input2){
	if(input1.value==input2.value){
		return true;
	}
	return false;
}

function include(input, set){
	for(var i = 0; i < set.length; i++){
		if(input.value.indexOf(set[i])!=-1){
			return true;
		}
	}
	return false;
}

function isNotNumber(input){
	return isNaN(input.value)||(input.value.indexOf(' ')!=-1);
}

function isPositive(input){
	return input.value>=0;
}

function fileType(input, type){
	type="."+type;
	var fName = input.value.toLowerCase();// 소문자로 전부 바꿈
	return fName.indexOf(type)!=-1;
}
