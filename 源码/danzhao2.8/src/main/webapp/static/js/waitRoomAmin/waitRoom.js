$(function() {
	
	var erid = $("#erid").val();
	var callingTabs = $("#callingTabs");
	
	// 获取正在被呼叫的考生
	$.ajax({
		aysnc:false,
		url:"waitroom/getCallingStu",
		type:"post",
		data:{
			erid : erid
		},
		success:function(message){
			callingTabs.empty();
			if(message == null || message == "" || message.length == 0){
				var audio = document.getElementById('myAudio'); 
				audio.pause();
			}
			for (var i = 0; i < message.length; i++) {
				var num = i+1;
				callingTabs.append('<tr>'+
						'<td><input type="hidden" name="stuid" class="stuid" value="'+message[i].stuid+'">'+num+'</td>'+
						'<td>'+message[i].stunumber+'</td>'+
						'<td>'+message[i].stuname+'</td>'+
						'<td>'+message[i].stusex+'</td>'+
						'<td>'+message[i].profname+'</td>'+
						'<td>'+message[i].ername+'</td>'+
						'</tr>');
			}
		}
	});
	
	//定时器 不停的获取更新状态
	state_time = setInterval(function(){
		getCallingState(erid);
	}, 2000);
	
});

// ----------------------------------------------函数

//获取该考场的被呼叫考生是否有更新
function getCallingState(erid) {
	$.ajax({
		aysnc:false,
		url:"waitroom/getCallingState",
		type:"post",
		data:{
			erid : erid
		},
		success:function(message){
//			$(".showMessage").append(message);
			if(message == 1){
				clearInterval(state_time);
//				alert(erid);
				window.location.reload();
			}
		}
	});
}

function rbf(){
	var audio = document.getElementById('myAudio'); 
	audio.currentTime = 0;
}
function bf(){
	var audio = document.getElementById('myAudio'); 
	if(audio!==null){        
	    //检测播放是否已暂停.audio.paused 在播放器播放时返回false.
//	     alert(audio.paused);
	     if(audio.paused)                     {                 
	      audio.play();//audio.play();// 这个就是播放  
	     }else{
	    	 audio.pause();// 这个就是暂停
	     }
	} 
}


