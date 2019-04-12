var isHover = false;
$(function(){
	
	//菜单切换
	$('.togglemenu').click(function(){
		if (!$('.togglemenu').hasClass('togglemenu_collapsed')){
			$('body').addClass('withmenucoll2');
			$('.side_nav').addClass('menucoll2');
			$('.togglemenu').addClass('togglemenu_collapsed');
			$('.side_nav > ul li a').each(function(){
				var ul= $(this).parent().find('ul');
				if (ul.length > 0){
					ul.prepend('<li><span>' + $(this).find('span').text() + '</span></li>');
					$(this).hover(function(){
						isHover = true;
				    	ul.show();
				    },function(){
				    	isHover = false;
				    	ul.hide();
				    	ul.hover(function(){
					    	ul.show();
					    },function(){
					    	ul.hide();
					  	});	
				  	});
				  	ul.hide();
				}
			})
		}else{
			$('body').removeClass('withmenucoll2');
			$('.side_nav').removeClass('menucoll2');
			$('.togglemenu').removeClass('togglemenu_collapsed');
			$('.side_nav > ul > li > a').each(function(){
				var ul= $(this).parent().find('ul');
				if (ul.length > 0){
					ul.find('li').first().remove();
					$(this).unbind('mouseenter').unbind('mouseleave');
					ul.unbind('mouseenter').unbind('mouseleave');
				}
			})
		}	
	})
 });