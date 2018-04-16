/*测试以及下次再做页面用js*/

var maxtime =100;//最大时间每个页面要自己覆盖此值
var cookiesName="test_time";
var timer;
var timeFalg=true;
var testTime=0;	

//倒计时
function CountDown(){
	var date = new Date();
    date.setTime(date.getTime() + (10 * 1000)); 
    setCookie(cookiesName,maxtime);
	if(maxtime>=0){  
		var minutes = Math.floor(maxtime/60);
        var seconds = Math.floor(maxtime%60);
        var msg = ""+minutes+"分"+seconds+"秒";
		document.all["timer"].innerHTML=msg;
		$(".examTimerShow").html(msg);
		if(maxtime <= 5*60){
			$("#timer").attr("style","color:red");
		} 
		if(timeFalg){
			--maxtime;
			++testTime;
		}
		$("#testTime").val(testTime);
	}  
	else{  
		clearInterval(timer);
		//DeleteCookie(cookiesName);
		submit();//交卷
	}  
}  

//计时增加
function CountUp(){
	var date = new Date();
    date.setTime(date.getTime() + (10 * 1000));
    var minutes = Math.floor(testTime/60);
    var seconds = Math.floor(testTime%60);
    var msg = ""+minutes+"分"+seconds+"秒";
	document.all["timer"].innerHTML=msg;
	$(".examTimerShow").html(msg);
    if(timeFalg){
        ++testTime;
    }
	$("#testTime").val(testTime);
	  
} 

//时间暂停
function timePause(){
	timeFalg=false;
	dialog(6);
}

//时间开始
function timeStart(){
	timeFalg=true;
	$(".bg-shadow").remove();
	$("#dcWrap").remove();
	$(".dialog-shadow").remove();
}


//我要交卷
function formSubmit(){
	dialog(1);
}
//确定交卷
function submit(){
	clearInterval(timer);
	//DeleteCookie(cookiesName);
	/*/paper/ajax/toExamPaper/播放大厅做课后作业*/
	if(window.location.href.match("/paper/ajax/toExamPaper/")!=null){
		addPaperRecord(2);
	}else {
		addPaperRecord(0);
	}

}


//继续做题
function jixuzuo(){
	$(".d-tips-2").remove();
	$(".dialog-shadow").remove();
	$(".bg-shadow").remove();
}

//点击下一部分
var titleheiddenNum = 0;
var titleheiddenNum_size=1;//最大数量,每个页面要覆盖此值
function nexttitleshow(){
	titleheiddenNum = titleheiddenNum+1;
	if(titleheiddenNum ==titleheiddenNum_size){
		titleheiddenNum = 0;
	}
	$(".titleHeiddenAndShow"+titleheiddenNum).click();
}

function titleHeiddenAndShow(id,obj){
	titleheiddenNum=parseInt($(obj).attr("indexNum"));
	var titleValue = $(obj).attr("titlevalue");
	if(paperType!=7){
		$("#showTitleValue").html(titleValue);
	}
	$(obj).parent().attr("class","current");
	$(obj).parent().siblings().each(function(){
		$(this).attr("class","");
	});
	$("#titleHidden"+id).show();
	$("#titleHidden"+id).siblings().hide();
	$("html,body").animate({scrollTop: $(".nextTitleAnchor").offset().top}, 0);
}

/**
 * 提交试卷
 * optype 0，提交试卷，1是下次再做,2播放大厅提交试卷
 */
 function addPaperRecord(optype){
	 $("#addPaperRecord").submit();
 	var serialize = $("#addPaperRecord").serialize();
 	dialog(2);
	var closeWin = false;
//	初始为ajax提交
/* 	$.ajax({
 		type:"POST",
 		dataType:"json",
 		async:false,
 		url:"/front/exam_assignment",
 		data:serialize+'&optype='+optype,
 		success:function(result){
			//解除绑定
			$(window).unbind('unload');
			$(window).unbind('beforeunload');
 			if(result.success){
 				if(timer!=null){
 					clearInterval(timer);
 				}
 				DeleteCookie(cookiesName);
 				if(optype==1){
					closeWin = newPage(baselocation+"/quest/toQuestionitemList")//去题库练习
 				}else if(optype==2){
					window.location.href = (baselocation+"/paper/ajax/getExamPaperReport/"+result.entity)//去题库练习
				}else{
					closeWin = newPage(baselocation+"/paper/getExamPaperReport/"+result.entity);
 				}
 			}else{
				closeWin = newPage(baselocation+"/quest/toQuestionitemList");//去题库练习
 			}
			if (closeWin==true){
                setTimeout("closeWebPage()", 1000);
			}
 		}
 	});*/
 }
//加返回值判断方法是否执行完毕
function newPage(url) {
	winOpenUrl(url);
	return true;
}
//取消收藏试题
function notFavorite(id,obj){
	$.ajax({
		type:"POST",
		dataType:"json",
		url:baselocation+"/quest/notFavorite/"+id,
		data:{"favorite.qstId":id},
		async:false,
		success:function(result){
			if(result.success==true){
				$(obj).parent().html('<a href="javascript:void(0)" onclick="favorite('+id+',this)" qstId="'+id+'" title="收藏试题" class="vam c-666 ml5"><em class="icon18 collect-icon not-collect">&nbsp;</em>收藏试题</a>');
			}
		}
});
}
//收藏试题
function favorite(id,obj){
	$.ajax({
		type:"POST",
		dataType:"json",
		url:baselocation+"/quest/toFavorite/"+id,
		data:{"favorite.qstId":id},
		async:false,
		success:function(result){
			if(result.success==true){
				$(obj).parent().html('<a href="javascript:void(0)" onclick="notFavorite('+id+',this)" title="取消收藏试题" qstId="'+id+'" class="vam c-666 ml5"><em class="icon18 collect-icon">&nbsp;</em>取消收藏试题</a>');
			}
		}
	});
}
//答题卡点击
function datikaAnchor(titleheiddenNum,num){
	$(".titleHeiddenAndShow"+titleheiddenNum).click();
	$("html,body").animate({scrollTop: $(".datikaQstAnchor"+num).offset().top-200},600);
}

//选择是否单题模式
function danti(obj){
	 if($(obj).prop("checked")){
		 showdanti();
	 }else{
		 showduoti();
	 } 
	 //默认到第一题
	 datikaAnchor(0,1);
}
//下一题
function nextqst(num){
	//选择答题卡  点击答题卡
	/*if(num%51==1 && num!=1){
		nextQuestionListShow();
	}*/
	if($("#datikaCurrent"+num).children("a")[0]){
		$("#datikaCurrent"+num).children("a")[0].click();
	}else{
        //dialog(1);
		/*if (confirm("是否交卷！")){
			addPaperRecord(0)
		}else {*/
			$("#datikaCurrent1").children("a")[0].click();
		//}
	}
}
//展示单题模式
function showdanti(){
	$('input:radio').unbind("click"); 
	//头部部分的html隐藏
	$(".t-p-sub-title-wrap").hide();
	//底部下一部分隐藏
	$(".page-bar").hide();
	//全部试题隐藏
	$("li[class^='datikaQstAnchor']").hide();
	//第一题展示
	$(".datikaQstAnchor1").show();
	//单题模式下一题按钮展示
	$(".nextoneqst").show();
	datikaAnchor = function(titleheiddenNum,num){
		//隐藏材料题
		$(".cailiaohiddle").hide();
		$(".titleHeiddenAndShow"+titleheiddenNum).click();
		//全部试题隐藏
		$("li[class^='datikaQstAnchor']").hide();
		//如果有下一题则展示下一题没有则展示第一题
		if($(".datikaQstAnchor"+num)!=null){
			$(".datikaQstAnchor"+num).show();
			$(".datikaQstAnchor"+num).siblings(".cailiaohiddle").show();
		}else{
			$(".datikaQstAnchor1").show();
		}

		//答题卡点击时  手机端 隐藏 答题卡
		if($(".e-nav-bx-warp").hasClass("hauto")){
			$(".e-nav-wrap").find(".dtClose1").click();
		}
	};
}
//展示多题模式
function showduoti(){
	$('input:radio').click(function(){
        var numinder = $(this).parent().attr("numinder");
		//paperMiddleListindex 大题的 下标
		var paperMiddleListindex=$(this).parent().attr("paperMiddleListindex");
        if(numinder!=null){
            var numinder1 = numinder*1+1;
            datikaAnchor(paperMiddleListindex,numinder1);
        }
    });
	$(".t-p-sub-title-wrap").show();
	$(".page-bar").show();
	//单题模式下一题按钮隐藏
	$(".nextoneqst").hide();
	//全部试题隐藏
	$("li[class^='datikaQstAnchor']").show();
	//全部大题顯示
	$("ul[id^='titleHidden']").show();
	//材料显示
	$(".cailiaohiddle").show();
	datikaAnchor = function(titleheiddenNum,num){
		//显示部分
		//$(".titleHeiddenAndShow"+titleheiddenNum).click();
		//定位到题的位置
		$("html,body").animate({scrollTop: $(".datikaQstAnchor"+num).offset().top-200}, 600);

		//答题卡点击时  手机端 隐藏 答题卡
		if($(".e-nav-bx-warp").hasClass("hauto")){
			$(".e-nav-wrap").find(".dtClose1").click();
		}
	};
}

//删除错题
function delErrorQuestion(id,obj){
	$.ajax({
		type:"POST",
		dataType:"json",
		url:baselocation+"/quest/delerrorQuestion/"+id,
		async:false,
		success:function(result){
			if(result.success==true){
				$(obj).parent().parent().parent().parent().remove();
			}
		}
	});
}

var qstIdNote="";//笔记内容
//添加笔记
function addNote(obj){
	dialog(7);
	qstIdNote = $(obj).attr("qstId");
	$("#notesubmit").click(function(){
		var noteContent = $("#noteContent").val();
		if(noteContent.length>200){
			alert("你最多能输入200个字");
			return false;
		}
		$.ajax({
			type:"POST",
			dataType:"json",
			url:baselocation+"/front/examNote/${pid}",
			data:{"queryNoteQuestion.noteContent":noteContent,"queryNoteQuestion.qstId":qstIdNote},
			async:false,
			success:function(result){
				if(result.success==true){
					$("#dialog-shadow #dcWrap .dtClose").click();
					$(obj).attr("onclick","updateNote(this)");
					$(obj).prev().html(noteContent);
					if(noteContent==""){
						$(obj).attr("style","margin-left:0px");
					}else{
						$(obj).attr("style","margin-left:425px");
					}
				}
			}
		});
	});
}
//笔记重置
function chongzhiNotOrCheck(){
	$("#noteContent").val("");
	$("#checkContent").val("");
	$("#notetips").html("您还可以输入"+200+"个字");
}
//更新笔记
function updateNote(obj){
	dialog(7);
	qstIdNote = $(obj).attr("qstId");
	 $("#noteContent").val($(obj).prev().html());
	$("#notesubmit").click(function(){
		var noteContent = $("#noteContent").val();
		if(noteContent.length>200){
			alert("你最多能输入200个字");
			return false;
		}
		$.ajax({
			type:"POST",
			dataType:"json",
			url:baselocation+"/quest/updateNote.do",
			data:{"queryNoteQuestion.noteContent":noteContent,"queryNoteQuestion.qstId":qstIdNote},
			async:false,
			success:function(result){
				if(result.success==true){
					$("#dialog-shadow #dcWrap .dtClose").click();
					$(obj).prev().html(noteContent);
					if(noteContent==""){
						$(obj).attr("style","margin-left:0px");
					}else{
						$(obj).attr("style","margin-left:425px");
					}
				}
			}
		});
	});
}

//笔记内容变化时提示
function changetnote(){
	var len=$("#noteContent").val().length;
	//alert(len);
	$("#notetips").html("您还可以输入"+(200-len)+"个字");
}
//解析时显示正确错题
function showErrorQuestion(){
	$(".rightQuestion").hide();
}
//解析时显示所有
function showAllQuestion(){
	$(".rightQuestion").show();
}
//解析时显示错题
function lookErrorQuestion(obj){
	if($(obj).prop("checked")){
		showErrorQuestion();
	}else{
		showAllQuestion();
	}
}
function changecheck(){
	var len=$("#checkContent").val().length;
	if(len==0){
		$("#notetips").html("请输入内容");
		return;
	}
	$("#notetips").html("您还可以输入"+(200-len)+"个字");
}
function checkAnswer(paperId,qstId,obj){
	dialog(8);
	$("#checksubmit").click(function(){
		var content=$("#checkContent").val();
		if(content==null||content.trim()==''){
			msgshow("内容不能为空","false","2500");
			return false;
		}
		if(content.length>200){
			msgshow("你最多能输入200个字","false","2500");
			return false;
		}else{
			$.ajax({
				url:baselocation+"/quest/addQuestErrorCheck",
				data:{"questErrorCheck.paperId":paperId,"questErrorCheck.questionId":qstId,"questErrorCheck.content":content},
				dataType:"json",
				type:"post",
				async:false,
				success:function(result){
					if(result.message=="success"){
						msgshow("成功提交，等待处理","true","2500");
						$("#dialog-shadow #dcWrap .dClose").click();
					}else{
						msgshow("失败，请稍后重试","false","2500");
					}
				}
			});
			
		}	
	});
}
function getvideoCode(freeUrl){
	dialog(12);
	var str = "<script src='http://union.bokecc.com/player?vid="+freeUrl+"&siteid=${websitemapCC.cc.ccappID }&autoStart=true&width=100%&height=100%&playerid==D86AD47DE27F8F5A&playertype=1' type='text/javascript'/>";
	$("#vHtml").html(str);
	//alert(qstId);
	/*$.ajax({
		url : "" + baselocation + "/paper/getVideoHtml",
		data : {
			"qstId" : qstId
		},
		type : "post",
		dataType : "text",
		success : function(result) {
			var str = "<script src='http://union.bokecc.com/player?vid="+freeUrl+"&siteid=${websitemapCC.cc.ccappID }&autoStart=true&width=100%&height=100%&playerid==D86AD47DE27F8F5A&playertype=1' type='text/javascript'/>";
			$("#playcc").html(str);
			//$("#vedioSpace").html(result);
			dialog(12,result);
			//$("#vHtml").html(result);
		}
	});*/
}

//添加标记
function doMark(index,obj){
	$("#mark"+index).show();
	$(obj).title="取消标签";
	$(obj).html("取消标签");
	$(obj).parent().html('<em class=""><img src="/static/exam/images/bqian.png" /></em><a href="javascript:void(0)" onclick="notMark('+index+',this)" title="取消标记" qstId="notMark'+index+'" class="vam c-666 ml5" style="display: inline-block;margin-top: -10px;">取消标记</a>');
}
function notMark(index,obj){
	$("#mark"+index).hide();
	$(obj).title="添加标签";
	$(obj).html("添加标签");
	$(obj).parent().html('<em class=""><img src="/static/exam/images/bqian.png" /></em><a href="javascript:void(0)" onclick="doMark('+index+',this)" title="添加标记" qstId="doMark'+index+'" class="vam c-666 ml5" style="display: inline-block;margin-top: -10px;">添加标记</a>');
}
