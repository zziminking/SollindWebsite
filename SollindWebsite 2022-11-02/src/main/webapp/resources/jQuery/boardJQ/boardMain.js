/**
 * 
 */
function Time(data) {
	// 게시글 시간
	var date = new Date(data);
	
	// 현재시간 
	var now = new Date();
	var year = now.getFullYear();     // 연도
	var months = now.getMonth();     // 월                          
	var days = now.getDate();          // 일
	var hours = now.getHours();       // 현재 시간
	var minutes = now.getMinutes();   // 현재 분
	var now = new Date(year, months, days, hours, minutes);
	// 계산
	var sec = 60;
	var min = 60;
	var hour = 24;
	var day = 30;
	var month = 12;
	var msg = null;
	var diffTime = (now.getTime() - date.getTime())/1000;
	if (diffTime < sec) {
		msg = Math.floor(diffTime) + "초 전";
	} else if ((diffTime /= sec) < min) {
		msg = Math.floor(diffTime) + "분 전";
	} else if ((diffTime /= min) < hour) {
		msg = Math.floor(diffTime) + "시간 전";
	} else if ((diffTime /= hour) < day) {
		msg = Math.floor(diffTime) + "일 전";
	} else if ((diffTime /= day) < month) {
		msg = Math.floor(diffTime) + "달 전";
	} else {
		msg = Math.floor(diffTime) + "년 전";
	}
	return msg;
}
var pageCount = 1;
var first = true;
var noLast = true;
function insertNextBoard() {
	if (first && noLast) {
		$(window).scroll(function(){
			var htmlHeight = $(document).height();
			var browserHeight = $(window).height();
			var scrollTop = $(window).scrollTop();
			var scrollBottom = scrollTop + browserHeight;
			
			var boardStandard = $("#myBoardStandard").val();
			if(scrollBottom >= htmlHeight -50 && first){
				first = false;
				var id = $("#user").val();
				var type = null;
				for (var i = 1; i < 10; i++) {
					if ($("#boardType").find("#type"+i).css("color")=="rgb(0, 0, 0)") {
						type = $("#boardType").find("#type"+i).text();
					}
				}
				$.ajax({
					url : "http://192.168.0.126:7887/getBoardData",
					data : {"b_no": boardStandard, "num": pageCount, "type": type},
					success : function(json) {
						Time(json.data[0].b_date);
						if (json.data.length==0||json.data[0].result=="fail") {
							noLast = false;
						} else {
							$.each(json.data, function (i, data) {
								var mainTr = $("<tr></tr>")
								
								var mainTd1 = $("<td></td>").attr("class","boardTableTd").attr("style","border-right: solid 2px #E0E0E0;");
								var table = $("<table></table>").attr("class","eachBoardTable");
								var tbody = $("<tbody></tbody>");
								
								var t1_tr1 = $("<tr></tr>");
								var t1_tr1_td1 = $("<td></td>").attr("class","eachBoardTitle").attr("align","left");
								var t1_tr1_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no).text(data.b_title);
								t1_tr1_td1.append(t1_tr1_td1_a1);
								if (id == data.b_m_id) {
									var btn1 = $("<button>수정</button>");
									var t1_tr1_td1_a2 = $("<a></a>").attr("href","goBoardRetouch?b_no="+data.b_no).append("&nbsp;&nbsp;").append(btn1);
									t1_tr1_td1.append(t1_tr1_td1_a2);
								}
								var t1_tr1_td2 = $("<td></td>").attr("rowspan","2").attr("class","eachBoardImg").attr("align","center");
								if (data.b_img != "noImage") {
									var t1_tr1_td2_a1 = $("<img>").attr("src","resources/img/boardImg/"+decodeURIComponent(data.b_img));
									t1_tr1_td2.append(t1_tr1_td2_a1);
								}
								t1_tr1.append(t1_tr1_td1).append(t1_tr1_td2);
								
								var t1_tr2 = $("<tr></tr>");
								var t1_tr2_td1 = $("<td></td>").attr("class","eachBoardTxt").attr("align","left").attr("valign","middle");
								if (data.b_txt.length > 50) {
									var t1_tr2_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no).append(data.b_txt.substring(0, 50)+"...");
								} else {
									var t1_tr2_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no).append(data.b_txt);
								}
								t1_tr2_td1.append(t1_tr2_td1_a1);
								t1_tr2.append(t1_tr2_td1);
								
								var t1_tr3 = $("<tr></tr>")
								var t1_tr3_td1 = $("<td></td>").attr("class","eachBoardDdabong");
								var img = $("<img>").attr("src","resources/icon/ddabong.png");
								t1_tr3_td1.append(img).append(" "+data.b_ddabong);
								var t1_tr3_td2 = $("<td></td>").attr("class","eachBoardDate").attr("align","right").text(data.b_m_id.substring(0, 1)+"******* "+Time(data.b_date));
								t1_tr3.append(t1_tr3_td1).append(t1_tr3_td2);
								tbody.append(t1_tr1).append(t1_tr2).append(t1_tr3);
								table.append(tbody);
								mainTd1.append(table);
								mainTr.append(mainTd1);
								if (data.b_no2 != null) {
									var mainTd2 = $("<td></td>").attr("class","boardTableTd");
									var table2 = $("<table></table>").attr("class","eachBoardTable");
									var tbody2 = $("<tbody></tbody>");
									
									var t2_tr1 = $("<tr></tr>");
									var t2_tr1_td1 = $("<td></td>").attr("class","eachBoardTitle").attr("align","left");
									var t2_tr1_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no2).text(data.b_title2);
									t2_tr1_td1.append(t2_tr1_td1_a1);
									if (id == data.b_m_id2) {
										var btn2 = $("<button>수정</button>");
										var t2_tr1_td1_a2 = $("<a></a>").attr("href","goBoardRetouch?b_no="+data.b_no2).append("&nbsp;&nbsp;").append(btn2);
										t2_tr1_td1.append(t2_tr1_td1_a2);
									}
									var t2_tr1_td2 = $("<td></td>").attr("rowspan","2").attr("class","eachBoardImg").attr("align","center");
									if (data.b_img2 != "noImage") {
										var t2_tr1_td2_a1 = $("<img>").attr("src","resources/img/boardImg/"+decodeURIComponent(data.b_img2));
										t2_tr1_td2.append(t2_tr1_td2_a1);
									}
									t2_tr1.append(t2_tr1_td1).append(t2_tr1_td2);
									
									var t2_tr2 = $("<tr></tr>");
									var t2_tr2_td1 = $("<td></td>").attr("class","eachBoardTxt").attr("align","left").attr("valign","middle");
									
									if (data.b_txt2.length > 50) {
										var t2_tr2_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no2).append(data.b_txt2.substring(0, 50)+"...");
									} else {
										var t2_tr2_td1_a1 = $("<a></a>").attr("href","goBoardDetail?b_no="+data.b_no2).append(data.b_txt2);
									}
									t2_tr2_td1.append(t2_tr2_td1_a1);
									t2_tr2.append(t2_tr2_td1);
									
									var t2_tr3 = $("<tr></tr>")
									var t2_tr3_td1 = $("<td></td>").attr("class","eachBoardDdabong");
									var img2 = $("<img>").attr("src","resources/icon/ddabong.png");
									t2_tr3_td1.append(img2).append(" "+data.b_ddabong2);
									var t2_tr3_td2 = $("<td></td>").attr("class","eachBoardDate").attr("align","right").text(data.b_m_id2.substring(0, 1)+"******* "+Time(data.b_date2));
									t2_tr3.append(t2_tr3_td1).append(t2_tr3_td2);
									tbody2.append(t2_tr1).append(t2_tr2).append(t2_tr3);
									table2.append(tbody2);
									mainTd2.append(table2);
									mainTr.append(mainTd2);
								}
								$("#boardTable").append(mainTr);
							});
						}
						first = true;
						pageCount += 1;
					}
				});
			};
		});
	}
}
function goBoardByType() {
	$("#boardType").find("#type1").click(function(){
		location.href = '/Sollind/goBoardHome';
	});
	$("#boardType").find("#type2").click(function(){
		var type = $("#boardType").find("#type2").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type3").click(function(){
		var type = $("#boardType").find("#type3").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type4").click(function(){
		var type = $("#boardType").find("#type4").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type5").click(function(){
		var type = $("#boardType").find("#type5").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type6").click(function(){
		var type = $("#boardType").find("#type6").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type7").click(function(){
		var type = $("#boardType").find("#type7").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type8").click(function(){
		var type = $("#boardType").find("#type8").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
	$("#boardType").find("#type9").click(function(){
		var type = $("#boardType").find("#type9").text();
		location.href = '/Sollind/goBoardHome?type='+type;
	});
}
$(function() {
	insertNextBoard();
	goBoardByType();
});
