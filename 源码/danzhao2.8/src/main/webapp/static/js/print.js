//前台页面用<!--startprint--><!--endprint-->包住需要打印的界面
function doPrint() {
//	pagesetup_null();
	var bdhtml=window.document.body.innerHTML;
	var sprnstr="<!--startprint-->"; 
	var eprnstr="<!--endprint-->"; 
	var prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
	window.document.body.innerHTML=prnhtml; 
	window.print();
	window.document.body.innerHTML=bdhtml; 
}
