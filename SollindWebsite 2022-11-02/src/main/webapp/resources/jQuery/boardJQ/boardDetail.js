/**
 * 
 */
function ddabongCheck() {
	$("#boardDetailTable").find("#data").find("img").click(function(){
		var userID = $("#boardDetailTable").find("#replyID").val();
		var num = $("#boardDetailTable").find("#data").find("span").text();
		var check = $("#boardDetailTable").find("#data").find("img").attr("src");
		if (userID!="") {
			if (check=="resources/icon/ddabongCheck.png") {
				var boardNo = $("#boardDetailTable").find("#boardNo").val();
				var userID = $("#boardDetailTable").find("#replyID").val();
				var first = $("#boardDetailTable").find("#first").val();
				var ddabong = 0;
				$.ajax({
					/*
					url: "주소",
					data: {파라메터명: 값, 파라메터명: 값, ...},
					success : function(받은거) {
						성공했을때 함수
					};
					 */
					url : "http://192.168.0.126:7887/ddabong",
					data : {"boardNo": boardNo, "userID": userID, "first": first, "ddabong": ddabong},
					success : function(json) {
						$("#boardDetailTable").find("#data").find("img").attr("src","resources/icon/ddabong.png");
						$("#boardDetailTable").find("#data").find("span").text(Number(num)-1);
					}
				});
			} else {
				var boardNo = $("#boardDetailTable").find("#boardNo").val();
				var userID = $("#boardDetailTable").find("#replyID").val();
				var first = $("#boardDetailTable").find("#first").val();
				var ddabong = 1;
				$.ajax({
					/*
					url: "주소",
					data: {파라메터명: 값, 파라메터명: 값, ...},
					success : function(받은거) {
						성공했을때 함수
					};
					 */
					url : "http://192.168.0.126:7887/ddabong",
					data : {"boardNo": boardNo, "userID": userID, "first": first, "ddabong": ddabong},
					success : function(json) {
						$("#boardDetailTable").find("#data").find("img").attr("src","resources/icon/ddabongCheck.png");
						$("#boardDetailTable").find("#data").find("span").text(Number(num)+1);
					}
				});
			}
		}
	});
}
function mbtiTest() {
	var mbtiFirst = true;
	$("#boardDetailTable").find("#mbti").find("#mbtiBTN").click(function(){
		if (mbtiFirst) {
			var text = $("#boardDetailTable").find("#txt").text();
			$.ajax({
				/*
			url: "주소",
			data: {파라메터명: 값, 파라메터명: 값, ...},
			success : function(받은거) {
			성공했을때 함수
			};
				 */
				url : "http://192.168.0.126:1541/mbtiTest",
				data : {"text": text},
				success : function(json) {
					$.each(json.data, function (i, data) {
						$("#boardDetailTable").find("#mbti").find("input").attr("value",data.result).css("text-align","center");
					})
					mbtiFirst = false;
				}
			});
		}
	});
}
// 하...........................
// jQuery로 입력한거 함수연결 안됨
//function insertReply() {
//	$("#boardDetailTable").find("#replyInsertBTN").click(function goWhereData(){
//		var txt = $("#boardDetailTable").find("#reply").val();
//		if (txt != "") {
//			var id = $("#boardDetailTable").find("#writer").val();
//			var board_no = $("#boardDetailTable").find("#b_no").val();
//			$.ajax({
//				/*
//				url: "주소",
//				data: {파라메터명: 값, 파라메터명: 값, ...},
//				success : function(받은거) {
//					성공했을때 함수
//				};
//				 */
//				url : "http://192.168.0.138:7887/getReply",
//				data : {"br_txt": txt, "br_m_id": id, "br_b_no": board_no},
//				success : function(json) {
//					alert("test");
//					$("#boardDetailTable").find("#replyTable").empty();
//					$.each(json.data, function (i, data) {
//						if (id == data.br_m_id) {
//							var input1 = $("<input>").attr("id","myReply"+data.br_no).attr("type","text").attr("value",data.br_txt);
//							var input2 = $("<input>").attr("id","myReplyNo"+data.br_no).attr("type","hidden").attr("value",data.br_no);
//							var button1 = $("<button></button>").attr("class","replyUpdateBTN").attr("value",data.br_no).text("수정");
//							var button2 = $("<button></button>").attr("class","replyDeleteBTN").attr("value",data.br_no).text("삭제");
//							var td1 = $("<td></td>").append(input1).append(input2);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							var td3 = $("<td></td>").append(button1).append(button2);
//							var tr3 = $("<tr></tr>").append(td3);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2).append(tr3);
//						} else {
//							var td1 = $("<td></td>").text(data.br_txt);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2);
//						}
//					});
//				}
//			});
//			$("#boardDetailTable").find("#reply").val("");
//		}
//	});
//}
//function updateReply() {
//	$("#boardDetailTable").find("#replyTable").find(".replyUpdateBTN").click(function goWhereData(){
//		var no = $(this).attr("value");
//		var txt = $("#boardDetailTable").find("#replyTable").find("#myReply"+no).val();
//		if (txt != "") {
//			var board_no = $("#boardDetailTable").find("#b_no").val();
//			var boardReply_no = $("#boardDetailTable").find("#replyTable").find("#myReplyNo"+no).val();
//			var id = $("#boardDetailTable").find("#writer").val();
//			$.ajax({
//				/*
//				url: "주소",
//				data: {파라메터명: 값, 파라메터명: 값, ...},
//				success : function(받은거) {
//					성공했을때 함수
//				};
//				 */
//				url : "http://192.168.0.138:7887/updateReply",
//				data : {"br_txt": txt, "br_b_no": board_no, "br_no": boardReply_no},
//				success : function(json) {
//					$("#boardDetailTable").find("#replyTable").empty();
//					$.each(json.data, function (i, data) {
//						if (id == data.br_m_id) {
//							var input1 = $("<input>").attr("id","myReply"+data.br_no).attr("type","text").attr("value",data.br_txt);
//							var input2 = $("<input>").attr("id","myReplyNo"+data.br_no).attr("type","hidden").attr("value",data.br_no);
//							var button1 = $("<button></button>").attr("class","replyUpdateBTN").attr("value",data.br_no).text("수정");
//							var button2 = $("<button></button>").attr("class","replyDeleteBTN").attr("value",data.br_no).text("삭제");
//							var td1 = $("<td></td>").append(input1).append(input2);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							var td3 = $("<td></td>").append(button1).append(button2);
//							var tr3 = $("<tr></tr>").append(td3);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2).append(tr3);
//						} else {
//							var td1 = $("<td></td>").text(data.br_txt);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2);
//						}
//					});
//				}
//			});
//			$("#boardDetailTable").find("#reply").val("");
//			alert("수정 성공");
//		}
//	});
//}
//
//function deleteReply() {
//	$("#boardDetailTable").find("#replyTable").find(".replyDeleteBTN").click(function goWhereData(){
//		var no = $(this).attr("value");
//		var checkDelete = confirm("댓글을 삭제하시겠습니까?")
//		if (checkDelete) {
//			var board_no = $("#boardDetailTable").find("#b_no").val();
//			var boardReply_no = $("#boardDetailTable").find("#replyTable").find("#myReplyNo"+no).val();
//			var id = $("#boardDetailTable").find("#writer").val();
//			$.ajax({
//				/*
//				url: "주소",
//				data: {파라메터명: 값, 파라메터명: 값, ...},
//				success : function(받은거) {
//					성공했을때 함수
//				};
//				 */
//				url : "http://192.168.0.138:7887/deleteReply",
//				data : {"br_b_no": board_no, "br_no": boardReply_no},
//				success : function(json) {
//					$("#boardDetailTable").find("#replyTable").empty();
//					$.each(json.data, function (i, data) {
//						if (id == data.br_m_id) {
//							var input1 = $("<input>").attr("id","myReply"+data.br_no).attr("type","text").attr("value",data.br_txt);
//							var input2 = $("<input>").attr("id","myReplyNo"+data.br_no).attr("type","hidden").attr("value",data.br_no);
//							var button1 = $("<button></button>").attr("class","replyUpdateBTN").attr("value",data.br_no).text("수정");
//							var button2 = $("<button></button>").attr("class","replyDeleteBTN").attr("value",data.br_no).text("삭제");
//							var td1 = $("<td></td>").append(input1).append(input2);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							var td3 = $("<td></td>").append(button1).append(button2);
//							var tr3 = $("<tr></tr>").append(td3);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2).append(tr3);
//						} else {
//							var td1 = $("<td></td>").text(data.br_txt);
//							var tr1 = $("<tr></tr>").append(td1);
//							var td2 = $("<td></td>").text(data.br_m_id.substr(0,1)+"*******"+"   "+data.br_date);
//							var tr2 = $("<tr></tr>").append(td2);
//							$("#boardDetailTable").find("#replyTable").append(tr1).append(tr2);
//						}
//					});
//				}
//			});
//			$("#boardDetailTable").find("#reply").val("");
//			alert("삭제 성공");
//		}
//	});
//}
$(function() {
	ddabongCheck();
	mbtiTest();
//	insertReply();
//	updateReply();
//	deleteReply();
});