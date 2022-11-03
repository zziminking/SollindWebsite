function companyRankingUpdate() {
	// 서버에 연결하면 connection(확실하지 않음)제목의 메세지 보내게 되어있음
	// 내용은 소켓정보
	var socket = io.connect("http://192.168.0.126:5454");
	socket.on("return", function(){
		$.ajax({
			url: "http://192.168.0.126:7665/company.get",
			success : function(data){
				$("#bestCompanyTable").empty();
				var titleTd = $("<td></td>").text("실시간 인기 회사").attr("id", "bestCompany").attr("colspan", "2");
				var titleTr = $("<tr></tr>").append(titleTd);
				$("#bestCompanyTable").append(titleTr);
				$.each(data, function (n,name) {
					for (var i = 0; i < 10; i++) {
						var companyName = name[i].vr_c_name;
						var nameA = $("<a></a>").attr("href", "goCompanyDetailInfo?c_no=" + name[i].vr_c_no).append(companyName);
						var countTd = $("<td></td>").append(i+1).attr("id", "rankingCount");
						var nameTd = $("<td></td>").append(nameA).attr("id", "rankingCompanyName");
						var nameTr = $("<tr></tr>").append(countTd, nameTd);
						
						$("#bestCompanyTable").append(nameTr);
					}
				});
			}		
		})
		
	});
}


$(function() {
	companyRankingUpdate();
});