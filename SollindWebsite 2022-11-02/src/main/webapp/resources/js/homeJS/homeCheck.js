function searchCheck() {
	var HomeSearchInput = document.sc.HomeSearchInput;
	
	if(empty(HomeSearchInput)){
		alert("검색어를 쓰세요");
		searchInput.value="";
		searchInput.focus();
		return false;
	}
	return true;
}