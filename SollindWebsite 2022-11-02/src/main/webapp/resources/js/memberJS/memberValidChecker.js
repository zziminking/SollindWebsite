function validcheck() {
	var idField = document.joinform.m_id;
	var pwField = document.joinform.m_pw;
	var pwcheckField = document.joinform.m_pwcheck;
	var addr1Field = document.joinform.m_addr1;
	var addr2Field = document.joinform.m_addr2;
	var addr3Field = document.joinform.m_addr3;
	var nameField = document.joinform.m_name;
	var birthField = document.joinform.m_birth;

	if (isEmpty(idField) || containsHS(idField)
			|| $("#joinID").css("color") == "rgb(255, 0, 0)") {
		alert("id다시");
		return false;
	}

	if (isEmpty(pwField) || notEquals(pwField, pwcheckField)
			|| notContains(pwField, "1234567890")
			|| notContains(pwField, "qwertyuiopasdfghjklzxcvbnm")) {
		alert("pw확인");
		return false;
	}
	if (isEmpty(nameField)) {
		alert("이름다시");
		return false;
	}
	if (isEmpty(addr1Field) || isEmpty(addr2Field) || isEmpty(addr3Field)) {
		alert("주소다시");
		return false;
	}
	if (isEmpty(birth1Field) || isEmpty(birth2Field)
			|| isNotNumber(birth1Field) || isNotNumber(birth2Field)
			|| lessThan(birth1Field, 6) || lessThan(birth2Field, 1)
			|| birth1Field.value.indexOf("-") != -1
			|| birth2Field.value.indexOf(".") != -1) {
		alert("생일다시");
		birth1Field.value = "";
		birth2Field.value = "";
		return false;

	}
	if (isEmpty(photoField) || isNotType(photoField, "png")
			&& isNotType(photoField, "jpg") && isNotType(photoField, "gif")
			&& isNotType(photoField, "jfif")) {
		alert("사진다시");
		return false;
	}
	return true;
}
function logincheck() {
	var idField = document.loginform.m_id;
	var pwField = document.loginform.m_pw;
	
	if (isEmpty(idField) || isEmpty(pwField)) {
		alert("입력다시");
		idField.value = "";
		pwField.value = "";
		return false;
	}
	return true;
}