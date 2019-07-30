function filter_all() {

	var txtSearch = document.getElementById("txtSearch").value.toLowerCase();
	var txtGender = document.getElementById("gender").value;
	var trs = document.getElementsByTagName("tr");
	var total_rows = trs.length - 1;
	for (var i = 1; i < total_rows; i++) {
		flag = 0;
		var tds = trs[i].getElementsByTagName("td");
		for (var j = 0; j < 6; j++) {
			if (tds[j] != null && tds[j].innerHTML.toLowerCase().indexOf(txtSearch) > -1) {
				flag = 1;
				break;
			}
			
		}
		if (flag != 1 || (txtGender!="" && tds[4].innerHTML.trim()!=txtGender)) {
			trs[i].style.display = "none";
		} else {
			trs[i].style.display = "table-row";
		}
	}
}