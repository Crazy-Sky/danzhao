$(function() {
	
	//获取菜单
	var menu_uls = $("#menu_ul");
	$.ajax({
		async : false,
		type : "post",
		url :"menu/selectAllMenuByRole",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data:{
			role : $("#sessionUserRole").attr('roleid')
		},
		dataType : "json",
		success : function (message) {
			//清空菜单
			menu_uls.empty();
			//获取并填充菜单
			for(var i=0;i<message[0].length;i++){
				var str2 = "";
				var k = 0;
				for (var j = 0; j < message[1].length; j++) {
					if(message[1][j].parentid == message[0][i].menuid){
						k++;
						str2 += "<li title='"+message[1][j].menuname+"'>"+
						"<a href='"+message[1][j].menulink+"&oneMenu="+i+"&twoMenu="+k+"'>"+message[1][j].menuname+"</a></li>";
					}
				}
				menu_uls.append(
						 "<li title='"+message[0][i].menuname+"'>"+
			                 "<a class='oneMenu'>"+
			                        "<img src='static/images/admin.png' width='12px' height='12px' alt='admin'>"+
			                        "<span class='text'>"+message[0][i].menuname+"</span>"+
			                 "</a>"+
			                 "<span class='arrow'></span>"+
			                 "<ul class='twoMenu_ul' >"+str2+"</ul>"+
		                  "</li>");
			}
			//绑定事件
			$(".oneMenu").each(function() {
				var ul = $(this).parent().find('ul');
				$(this).click(function(){
					if (ul.css('display') == 'none'){
						$(this).each(function(){
							var ul= $(this).parent().find('ul');
							if (ul.length > 0){
								ul.slideUp(200);
							}
						})
						ul.slideDown(200);
					}else{
						if (!isHover){
							ul.slideUp(200);
						}
					}
					
				})
			});
			//获取缓存中的菜单选中情况
			var oneSelected = $("#menu_1_selected").val();
			var twoSelected = $("#menu_2_selected").val();
			if(oneSelected != null && oneSelected != ""){
				$(".twoMenu_ul").eq(oneSelected).css({'display':'block'});
			}
			
			var selectedTwo = $(".twoMenu_ul").eq(oneSelected);
//			alert(twoSelected);
//			if(twoSelected != null && twoSelected != ""){
//				alert(selectedTwo.find('li').eq(twoSelected-1).html());
//				selectedTwo.find('li').eq(twoSelected).parent().css({'color':'#1296db'});
//			}
			
		},
		error : function () {
			alert("获取角色信息失败！");
		}
	});
});