function connectMemberJoinAddrEvent() {
	$("#joinaddr1, #joinaddr2").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#joinaddr1").val(data.zonecode);
				$("#joinaddr2").val(data.addressEnglish);
			}
		}).open();
	});
}

function bye() {
	$("#deleteA").click(function(){
		if(confirm("정말 탈퇴하시겠습니까?") == true) {
			location.href = "delete.go";
		}else{
			return false;
		}
	});
	
}

$(function() {
	connectMemberJoinAddrEvent();
	bye();
});