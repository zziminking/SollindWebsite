var doAiDataCheck = "";
var data = "";
function doAI() {
	var check = true;
	$("#companyAITable").find("#aiButtonTd").find("#aiButton").click(function() {
		var name = $("#companyAITable").find("#companyAIName").val();
		var info1 = $("#companyAITable").find("#companyAIInfo1").val();
		var info2 = $("#companyAITable").find("#companyAIInfo2").val();
		var info3 = $("#companyAITable").find("#companyAIInfo3").val();
		var info4 = $("#companyAITable").find("#companyAIInfo4").val();
		var info5 = $("#companyAITable").find("#companyAIInfo5").val();
		var info6 = $("#companyAITable").find("#companyAIInfo6").val();
		var star1 = $("#companyAITable").find("#companyAIStarScoreTable").find("#companyAIStar1").val();
		var star2 = $("#companyAITable").find("#companyAIStarScoreTable").find("#companyAIStar2").val();
		var star3 = $("#companyAITable").find("#companyAIStarScoreTable").find("#companyAIStar3").val();
		var star4 = $("#companyAITable").find("#companyAIStarScoreTable").find("#companyAIStar4").val();
		var star5 = $("#companyAITable").find("#companyAIStarScoreTable").find("#companyAIStar5").val();
		if (name == "" || name == null) {
			alert("회사명을 입력해주세요");
			check = false;
		}
		if (check && (info1 == "" || info1 == null || isNaN(info1))) {
			alert("매출액(억원)을 입력해주세요");
			check = false;
		}
		if (check && (info2 == "" || info2 == null || isNaN(info2))) {
			alert("영업이익률(%)을 입력해주세요");
			check = false;
		}
		if (check && (info3 == "" || info3 == null || isNaN(info3))) {
			alert("순이익률(%)을 입력해주세요");
			check = false;
		}
		if (check && (info4 == "" || info4 == null || isNaN(info4))) {
			alert("부채비율(%)을 입력해주세요");
			check = false;
		}
		if (check && (info5 == "" || info5 == null || isNaN(info5))) {
			alert("당좌비율(%)을 입력해주세요");
			check = false;
		}
		if (check && (info6 == "" || info6 == null || isNaN(info6))) {
			alert("유보율(%)을 입력해주세요");
			check = false;
		}
		if (check && (star1 == "" || star1 == null || isNaN(star1))) {
			alert("복지 및 급여를 입력해주세요");
			check = false;
		}
		if (check && (star2 == "" || star2 == null || isNaN(star2))) {
			alert("업무와 삶의 균형을 입력해주세요");
			check = false;
		}
		if (check && (star3 == "" || star3 == null || isNaN(star3))) {
			alert("사내문화를 입력해주세요");
			check = false;
		}
		if (check && (star4 == "" || star4 == null || isNaN(star4))) {
			alert("승진 기회 및 가능성을 입력해주세요");
			check = false;
		}
		if (check && (star5 == "" || star5 == null || isNaN(star5))) {
			alert("경영진을 입력해주세요");
			check = false;
		}
		data = info1 + "," + info2 + "," + info3 + "," + info4 + "," + info5 + "," + info6 + "," + star1 + "," + star2 + "," + star3 + "," + star4 + "," + star5;
		if (check && !(doAiDataCheck==data)) {
			$.ajax({
				url : "http://192.168.0.126:1743/companyGrade",
				data : {"companyData" : data},
				success : function(json) {
					doAiDataCheck = data;
					$("#companyAITable").find(".companyAITd1").find("#companyGrade").attr("value", json.data[0].result);
				}
				
			});
		}
		check = true;
	});
}


$(function() {
	doAI();
});