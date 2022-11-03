function isEmpty(input) {
	return !input.value;
}

function lessThan(input, len) {
	return input.value.length < len;
}

function containsHS(input) {
	var able = "1234567890QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm-_@.";
	for (var i = 0; i < input.value.length; i++) {
		if (able.indexOf(input.value[i]) == -1) {
			return true;
		}
	}
	return false;
}

function notEquals(input1, input2){
	return input1.value != input2.value;
}

function notContains(input, able){
	for (var i = 0; i < able.length; i++){
		if(input.value.indexOf(able[i]) != -1){
			return false;
		}
	}
	return true;
}

function notNum(input){
	return isNaN(input.value);
}

function isNegative(input){
	return input.value < 0;
}

function isNotType(input, type){
	type = "." + type;
	var fName = input.value.toLowerCase();
	return fName.indexOf(type) == -1;
}


