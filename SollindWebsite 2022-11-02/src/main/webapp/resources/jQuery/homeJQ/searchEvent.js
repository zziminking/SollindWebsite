var search = false;
function SearchTypeEvent() {
	$(".borderName").click(function(){
		var type = $(".borderName").find("#boardType").val();
		if (type == "") {
			type = "전체";
		}
		if (!search) {
			$(".BoardPartCountTable").css("left", "355px");
			$(".borderName").find("h4").text(type+" △");
		} else {
			$(".BoardPartCountTable").css("left", "-1500px");
			$(".borderName").find("h4").text(type+" ▽");
		}
		search = !search
	});
}

function buttonTypeEvent(){
	var search = $("#searchResult").val();
	$(".BoardPartCountTable").find(".type0").click(function(){
		location.href = '/Sollind/Search.go?search='+search+"&type=";
	});
	$(".BoardPartCountTable").find(".type1").click(function(){
		var type = $(".BoardPartCountTable").find(".type1").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;
	});
	$(".BoardPartCountTable").find(".type2").click(function(){
		var type = $(".BoardPartCountTable").find(".type2").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;
	});
	$(".BoardPartCountTable").find(".type3").click(function(){
		var type = $(".BoardPartCountTable").find(".type3").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
	$(".BoardPartCountTable").find(".type4").click(function(){
		var type = $(".BoardPartCountTable").find(".type4").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
	$(".BoardPartCountTable").find(".type5").click(function(){
		var type = $(".BoardPartCountTable").find(".type5").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
	$(".BoardPartCountTable").find(".type6").click(function(){
		var type = $(".BoardPartCountTable").find(".type6").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
	$(".BoardPartCountTable").find(".type7").click(function(){
		var type = $(".BoardPartCountTable").find(".type7").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
	$(".BoardPartCountTable").find(".type8").click(function(){
		var type = $(".BoardPartCountTable").find(".type8").text();
		location.href = '/Sollind/Search.go?search='+search+"&type="+type;

	});
//	var type = null;
//
//	$("#BoardPartCountTable").find(type).click(function(){
//		alert(type);
//		$.ajax({
//			url:"http://192.168.0.126:7887/getSearchBoard",
//			data:{b_search : search, b_type : type},
//			success: function(SearchBoard){
//				alert(type);
//				$.each(SearchBoard, function(ii, sb){
//					for (var i = 0; i < 10; i++) {
//						var type = $("<td></td>").text(sb[i].b_title);
//						var tr = $("<tr></tr>").append(type);
//						var table = $("<table></table>").append(tr);
//						$("#searchBorderTd1").append(table);
//					}
//				});
//			}
//		});
//	});
}

$(function() {
	SearchTypeEvent();
	buttonTypeEvent();
});