$(function() {
	
	var erid = $("#erid").val();
	var callingTabs = $("#callingTabs");
	var waitCallingStutabs=$("#waitCallingStutabs");
	
	// 获取正在被呼叫的考生
	$.ajax({
		aysnc:false,
		url:"waitroom/getCallingStu",
		type:"post",
		data:{
			erid : erid
		},
		success:function(message){
			if(message == null || message == "" || message.length == 0){
				var audio = document.getElementById('myAudio'); 
				audio.pause();
			}
			var callingStu = message.callingStu; // 被呼叫的考生
			
			var waitCallingStu = message.waitCallingStu; // 备考考生
			
			waitCallingStutabs.empty();
			callingTabs.empty();
			
			//获取呼叫数据
			for (var i = 0; i < callingStu.length; i++) {
				callingTabs.append('<tr>'+
						'<td>'+callingStu[i].stunumber+'</td>'+
						'<td>'+callingStu[i].stuname+'</td>'+
						'<td>'+callingStu[i].ername+'</td>'+
						'</tr>');
			}
			//获取等待数据
			for (var i = 0; i < waitCallingStu.length; i++) {
				waitCallingStutabs.append('<tr>'+
						'<td>'+waitCallingStu[i].stunumber+'</td>'+
						'<td>'+waitCallingStu[i].stuname+'</td>'+
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


