$(function() {
	//实例化问题编辑器
	UE.getEditor('exatTitle', { //title
		theme:"default", //皮肤
		lang:'zh-cn', //语言
		initialFrameHeight:300,
		initialFrameWidth:1248,
		elementPathEnabled:false,
		//scaleEnabled:true,//设置可手动调整高度
		/*toolbars: [[ 
			'fullscreen', 'source', '|',
			'bold', 'italic', 'underline', 'fontborder', 
			'strikethrough', 'superscript', 'subscript', 
			'removeformat', 'pasteplain','|',
			'forecolor', 'backcolor','cleardoc','|',
			'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
			'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
			'emotion',
		 ]],*/
	});
	 UE.getEditor('exatAnswer', {
		theme:"default", //皮肤
		lang:'zh-cn', //语言
		initialFrameHeight:100,
		initialFrameWidth:1248,
		elementPathEnabled:false,
		toolbars: [[ 
			'bold', 'italic', 'strikethrough', 'removeformat', 'autotypeset', '|',
			'paragraph', 'fontfamily', 'fontsize',
		 ]],
		 //scaleEnabled:true//设置可手动调整高度
	});
	 
	var ue_title = UE.getEditor('exatTitle');
	var ue_answer = UE.getEditor('exatAnswer');
	var exatOprt = $("#exatOprt").val();
	
	//获取考题
	if(exatOprt == "update"){
		$.ajax({
			async : false,
			type : "post",
			url : "exat/selectOneExatWithBLOBs",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			data : {
				exatid : $("#exatid").val(),
			},
			success: function (message) {
				$("#insertExat_exatType").val(message.exattype);
				$("#exatSimpleContent").val(message.exatsimplecontent);
				ue_title.addListener("ready", function () {
		        　	　// editor准备好之后才可以使用
		        　　		ue_title.setContent(message.exatcontent);

		        });
				ue_answer.addListener("ready", function () {
		        　　		ue_answer.setContent(message.exatanswer);

		        });
//				ue_title.setContent(message.exatcontent);
//				ue_answer.setContent(message.exatanswer);
			},
			error: function () {
				alert("获取考题失败！");
			}
		});
	}
	 
	//保存考题
	$("#saveExatBt").click(function() {
		var exatContent = ue_title.getContent();
		var exatAnswer = ue_answer.getContent();
		var s=ue_title.getPlainTxt();
		var exatSimpleContent="";
		var c="";
		var j=0;
		for(var i=0;i<s.length;i++){
			if(s.charAt(i)!=""){
				c=c+s.charAt(i);
				j++;
				if(j>20)
				break;
			}
		}
		exatSimpleContent=exatSimpleContent+c+".......";
//		alert(exatSimpleContent+"--"+exatContent+"--"+exatAnswer);
		/*if(exatSimpleContent == null || exatSimpleContent == ""){
			alert("简略信息不能为空");
			return false;
		}*/
		if(exatContent == null || exatContent == ""){
			alert("题目不能为空");
			return false;
		}
		if(exatAnswer == null || exatAnswer == ""){
			alert("答案不能为空");
			return false;
		}
		var url, exatid;
		if(exatOprt == "update"){
			url = "exat/updateOneExatWithBLOBs";
			exatid = $("#exatid").val();
		}else{
			url = "exat/insertOneExatWithBLOBs";
		}
//		alert(url);
		$.ajax({
			async : false,
			type : "post",
			url : url,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			data : {
				exatid : exatid,
				exatsimplecontent : exatSimpleContent,
				exatcontent : exatContent,
				exatanswer : exatAnswer,
				exattype : $("#insertExat_exatType").val(),
				deptid : $("#deptid").val(),
			},
			success: function (message) {
				window.location.reload();
			},
			error: function () {
				alert("保存考题失败！");
			}
		});
	});
});