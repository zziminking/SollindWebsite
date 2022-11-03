function companySearchEvent() {
	$(".companySearch").keyup(function(e) {
		if ($(this).val() != "") {
			$.ajax({
				url:"http://192.168.0.126:7887/getCompanyInfo",
				data:{c_search: $(this).val()},
				success: function(companyData){
					$("#companySearchResultTableTdd").empty();
					$.each(companyData, function(ii, cd){
						for (var i = 0; i < 10; i++) {
							var star = $("<img>").attr("src", "resources/img/companyImg/star.png").attr("class", "companySearchResultTableStar");
							var c_logo = $("<img>").attr("src", "https://www.work.go.kr" + cd[i].c_logo).attr("class", "companySearchResultTableLogo");
							var c_nameTd = $("<td></td>").attr("class", "companySearchResultTableNameTd").attr("align", "center").text(cd[i].c_name);
							var c_logoTd = $("<td></td>").attr("class", "companySearchResultTableLogoTd").attr("align", "center").append(c_logo);
							var c_scoreTd = $("<td></td>").attr("class", "companySearchResultTableScoreTd").attr("align", "center").append(star).append(" " + cd[i].c_score);							
							var tr = $("<tr></tr>").append(c_logoTd, c_scoreTd, c_nameTd).attr("onclick", "locationDetail("+ cd[i].c_no + ");").attr("class", "companySearchResultTableTr");
							var table = $("<table></table>").append(tr).attr("class", "companySearchResultTable");
							$("#companySearchResultTableTdd").append(table);
							$(".companySearchResultTableAreaTd").css("border-top", "#E51B20 solid 2px");
						}
					});
				}
			});
		} else {
			$("#companySearchResultTableTdd").empty();
			$(".companySearchResultTableAreaTd").css("border-top", "none");
		}
	});
}
function locationDetail(c_no) {
	location.href = "http://localhost/Sollind/goCompanyDetailInfo?c_no=" + c_no
}
$(function() {
	companySearchEvent();
});