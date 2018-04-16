$(function() {
		eBg();
		effect();
		allItem();
		leftMenuScroll();
		subTitleScroll();
		answerFun();
		analysis();
		answerScroll();
		/*goTop();*/
		killIe6();
		
		
		$(".answer-bar").click();
	});

	function eBg() {
		var winW = parseInt(document.documentElement.offsetWidth, 10) + parseInt(document.documentElement.scrollLeft || document.body.scrollLeft, 10);
		$(".e-bg>img").css({"width" : winW});
	}

	function effect() {
		//隔行色
		$(".m-h-lx li:odd").css("background-color" , "#f8f8f8");
		//考过历史记录
		$(".kg-wrap").hover(function() {
			$(this).children(".k-btn").addClass("hover");
			$(this).children(".kg").show();
		}, function() {
			$(this).children(".k-btn").removeClass("hover");
			$(this).children(".kg").hide();
		});
		
		$(function(){
			//input["radio"]
			$(".t-p-is-options label .o-radio").each(function() {
				$(this).parent().click(function() {
					if ($(this).children("input").is(":checked")) {
						$(this).addClass("current").siblings().removeClass("current");
						var numInder = $(this).attr("numInder");
						$("#datikaCurrent"+numInder).addClass("current");
						$("#datikaCurrentMobile"+numInder).addClass("current");
					} else {
						$(this).removeClass("current");
					}
				});
				//如果该选项是选择状态按钮选择答题卡选中
				if ($(this).parent().children("input").is(":checked")) {
					// 选项选中
					$(this).parent().addClass("current").siblings().removeClass("current");
					//答题卡选中
					var numInder = $(this).parent().attr("numInder");
					$("#datikaCurrent"+numInder).addClass("current");
					$("#datikaCurrentMobile"+numInder).addClass("current");
				} else {
					$(this).parent().removeClass("current");
				}
			});
			//input["checkebox"]
			$(".t-p-is-options label .o-checkbox").each(function() {
				$(this).parent().click(function() {
					if ($(this).children("input").is(":checked")) {
						$(this).addClass("current");
						var numInder = $(this).attr("numInder");
						$("#datikaCurrent"+numInder).addClass("current");
						$("#datikaCurrentMobile"+numInder).addClass("current");
					} else {
						$(this).removeClass("current");
					}
				});
				//如果该选项是选择状态按钮选择答题卡选中
				if ($(this).parent().children("input").is(":checked")) {
					$(this).parent().addClass("current");
					var numInder = $(this).parent().attr("numInder");
					$("#datikaCurrent"+numInder).addClass("current");
					$("#datikaCurrentMobile"+numInder).addClass("current");
				} else {
					$(this).parent().removeClass("current");
				}
			});

            /*$("input[id^=aa]").each(function(){
                $(this).blur(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
                $(this).change(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
            })*/

            $("textarea[id^=textarea]").each(function(){
                $(this).blur(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
                $(this).change(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
            })
            $("input[id^=input_]").each(function(){
                $(this).blur(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
                $(this).change(function(){
                    var numInder = $(this).attr("numInder");
                    if($(this).val()!=null && $(this).val()!=''){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
            })

            /*$("input[id^=aa]").each(function(){
                $(this).blur();
            });*/
            $("textarea[id^=textarea]").each(function(){
                $(this).blur();
            });
            $("input[id^=input_]").each(function(){
                $(this).blur();
            });

            //填空题答题卡的样式
            $("input.tk-input").each(function(){
                $(this).blur(function(){
                    var numInder = $(this).attr("numInder");
                    var falg = true;
                    //判断一道填空题的所有选项都不为空时则出现选中效果
                    $(this).parent().find(".tk-input").each(function(){
                        if($(this).val()==""){
                            falg = false;
                        };
                    });
                    if(falg){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
                //填空题答题卡的样式
                $(this).change(function(){
                    var numInder = $(this).attr("numInder");
                    var falg = true;
                    $(this).parent().find(".tk-input").each(function(){
                        if($(this).val()==""){
                            falg = false;
                        };
                    });
                    if(falg){
                        $("#datikaCurrent"+numInder).addClass("current");
                        $("#datikaCurrentMobile"+numInder).addClass("current");
                    }else {
                        $("#datikaCurrent"+numInder).removeClass("current");
                        $("#datikaCurrentMobile"+numInder).removeClass("current");
                    }
                });
            })

            $("input.tk-input").each(function(){
                $(this).blur();
            });

        });
		
	
		
		//考点详细描述层
		$(".a-kj-show").hover(function(){
			str = "";
			var pointId = $(this).attr("pointId");
			var akjshow = $(this);
			if(pointId!=0){
				queryPointsNameByParentId(pointId);
				if(str.trim()!=""){
					akjshow.children(".a-kj-desc").show();
					akjshow.children(".a-kj-desc").children(".b-fff").children(".notetext").html(str);
				}
			}
		}, function(){
			$(this).children(".a-kj-desc").hide();
		});
		//所有二级三级科目
		$(".p-i-s-n-list dl").each(function() {
			$(this).hover(function() {
				$(this).addClass("hover");
				$(this).children("dd").show();
			}, function() {
				$(this).removeClass("hover");
				$(this).children("dd").hide();
			});
		});
	}
	var point="";
	var str = "";
	function queryPointsNameByParentId(pointId){
		$.ajax({
			type:"POST",
			dataType:"json",
			url:baselocation+"/point/queryPointsNameByParentId.do",
			data:{"point.id":pointId},
			async:false,
			cache:false,
			success:function(result){
				if(result.success==true){
					pointName = result.entity;
					if(str==null&&str.trim()==""){
						return false;
					}else{
						str=pointName;
					}
				}
			}
	});
	}
		//左右滚动
	function slideScroll(oBox, prev, next, oUl, speed, autoplay) {
		var oBox = $(oBox),
			prev = $(prev),
			next = $(next),
			oUl = $(oUl).find("ul"),
			ulW = oUl.find("li").outerWidth(true),
			oLi = oUl.find("li").length;
			s = speed,
			timer = null;
			oUl.css("width" , oLi * ulW + "px");
		//click prev
		prev.click(function() {
			oUl.animate({"margin-left" : -ulW}, function() {
				oUl.find("li").eq(0).appendTo(oUl);
				oUl.css("margin-left" , 0);
			});
		});
		//click next
		next.click(function() {
			oUl.find("li:last").prependTo(oUl);
			oUl.css("margin-left", -ulW);
			oUl.animate({"margin-left" : 0});
		});
		//autoplay
		if (autoplay === true) {
			timer = setInterval(function() {
				prev.click();
			}, s * 1000);
			oBox.hover(function() {
				clearInterval(timer);
			}, function() {
				timer = setInterval(function() {
					prev.click();
				}, s * 1000);
			});
		}
	}
		//点击全部科目类
	function allItem() {
		var oAi = $(".poin-item-sub-nav");
		document.onclick = function(e) {
			$(".poiter-item").removeClass("hover");
		};
		
		$(".poiter-item>a").click(function(e) {
			loadsubject(true);
			stopFunc(e);
		});
		
		
		/*$(".poiter-item>a").click(function(e) {
			if (oAi.is(":hidden")) {
				$(this).parent().addClass("hover");
			} else {
				$(this).parent().removeClass("hover");
			};
			stopFunc(e);
		});*/
		oAi.click(function(e) {
			stopFunc(e);
		});
	}
		//事件监听
	function stopFunc(e) {
		document.all ? event.cancelBubble = true : e.stopPropagation();
	}
	//leftMenu scroll
	/*function leftMenuScroll() {
		var lM = function() {
			var sTop = parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10);
			if (sTop > 185) {
				$(".left-float-wrap").css("position" , "fixed");
			} else {
				$(".left-float-wrap").css("position" , "absolute");
			}
		};
		$(window).bind("scroll" , lM);
	}*/
	//item subTitle scroll
	function subTitleScroll() {
		var sT = function() {
			var sTop = parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10);
			if (sTop > 235) {
				$(".t-p-sub-title").addClass("t-fixed");
			} else {
				$(".t-p-sub-title").removeClass("t-fixed");
			}
		};
		$(window).bind("scroll" , sT);
	}
	//answer scroll
	function answerScroll() {
		var marginBot = 0;
		var aS = function() {
			if (document.compatMode === "CSS1Compat") {
				marginBot = document.documentElement.scrollHeight - (document.documentElement.scrollTop + document.body.scrollTop) - document.documentElement.clientHeight;
			} else {
				marginBot = document.body.scrollHeight - document.body.scrollTop - document.body.clientHeight;
			}
			if (marginBot <= 190) {
				$(".answer").css({"position" : "absolute", "bottom" : "0"});
			} else {
				$(".answer").css({"position" : "fixed", "bottom" : "0"});
			}
		};
		$(window).bind("scroll" , aS);
	}

	//答题卡展开关闭
	function answerFun() {
		var aBar = $(".answer-bar");
		aBar.click(function() {
			if ($(".answer-list").is(":hidden")) {
				aBar.addClass("open").attr("title" , "关闭答题卡");
				$(".answer").animate({width : "802px"},100);
				$(".answer-list").show();
			} else {
				aBar.removeClass("open").attr("title" , "展开答题卡");
				$(".answer").animate({width : "42px"},100);
				$(".answer-list").hide();
			}
		});
	}
	//打开关闭试题解析层
	function analysis() {
		$(".jx-show-btn>a").click(function() {
			if (!$(this).parent().parent().siblings(".analysis-wrap").is(":hidden")) {
				$(this).text("展开解析");
				$(this).parent().addClass("a-close");
				$(this).parent().parent().siblings(".analysis-wrap").slideUp(150);
			} else {
				$(this).text("收起解析");
				$(this).parent().removeClass("a-close");
				$(this).parent().parent().siblings(".analysis-wrap").slideDown(150);
			}
		});
	}

	//登录注册切换
	function loginChage() {
		$(".go-e-register").click(function() {
			$(".e-login-ele").slideUp(220, function() {
				$(".e-register-ele").slideDown(220);
			});
		});
		$(".go-e-login").click(function() {
			$(".e-register-ele").slideUp(220, function() {
				$(".e-login-ele").slideDown(220);
			});
		});
	}
	/*//返回顶部
	function goTop() {
		var goTopElm = $('<div class="goTopBtn"><a href="javascript: void(0)">&nbsp;</a></div>').appendTo($("body"));
		$(".goTopBtn>a").click(function() {$("html,body").animate({"scrollTop" : 0}, 100);});
		var goTopFun = function() {
			var oSt = $(document).scrollTop(), winH = $(window).height();
			(oSt > 0) ? goTopElm.fadeIn(50) : goTopElm.fadeOut(50);
			if (!window.XMLHttpRequest) {
				goTopElm.css({"top": oSt + winH - 200});
			}
		};
		$(window).bind("scroll", goTopFun);
	}*/
	//公共弹出框
	function dialog(num) {
		//先删除之前的
		$(".d-tips-2").remove();
		$(".dialog-shadow").remove();
		$(".bg-shadow").remove();
		
		var oBg = $('<div class="bg-shadow"></div>').appendTo($("body")),
			dialogEle = $('<div id="dialog-shadow" class="dialog-shadow"><div class="dialog-ele"><div id="dcWrap" class="of">内容位置</div></div></div>').appendTo($("body"));

		var dCont = [
		    /*-0-*/
			'<div class="d-tips-1">' +
			'<section class="tac mt20"><p class="c-333 fsize14">欢迎进入《会计基础考试系统》，是否开始答题</p></section>'+
			'<section class="mt10 tac"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" title="开始答题" href="">开始答题</a></span></section>' +
			'<section class="mt10 tac mb20"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" title="取消本次答题" href="">取消本次答题</a></span>' +
			'</section></div>',
			/*-1-*/
			'<div class="d-tips-2">' +
			'<section class="tac mt20"><p class="c-333 fsize14"><span class="qj-icon">&nbsp;</span>确认要交卷吗？</p></section>'+
			'<section class="mt20 tac"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" title="确认" href="javascript:submit()">确认</a></span></section>' +
			'<section class="mt10 tac mb20"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" title="取消" href="javascript:jixuzuo()">取消</a></span>' +
			'</section></div>',
			/*-2-*/
			'<div class="d-tips-3">' +
			'<section class="tac mt20 ml20 mr20 mb20"><p class="c-333 fsize14 dialogText"><span class="bc-icon">&nbsp;</span>正在保存试卷请稍等...</p></section></div>',
			/*-3-*/
			'<div class="d-tips-4">' +
			'<section>' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">知识点练习</span></h4>' +
			'<div class="mt20 mb20 tac loading" style="margin-top:250px;margin-bottom:-250px"><img src="/static/exam/images/loading.gif" width="32" height="32"></div><section class="mt10 ztree" id="treeDemo"></section>' +
			'</section></div>',
			/*-4-*/
			'<div class="d-tips-5">' +
			'<section>' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt paperTypeName"></span></h4>' +
			'<section class="mt10 pageAfter"></section>' +
			'</section></div>',
			/*-5-*/
			'<div class="d-tips-6">' +
			'<section>' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt" id="headSubject">会计初级考试&nbsp;&gt;&nbsp;会试初级考试系列一</span></h4>' +
			'<section class="mt10 ml10 mr10 mb10"><ul class="thr-itme-list clearfix" id="addLi">' +
			'<li><em class="thr-itme-icon">&nbsp;</em><a href="" title="" class="vam c-666 fsize14" >会试初级考试A卷江苏省</a></li>' +
			'</ul></section></section></div>',
			/*-6-*/
			///继续做题 
			'<div class="d-tips-7">' +
			'<section class="tac mb20"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" title="继续做题" href="javascript:void(0)" onclick="timeStart()">继续做题</a></span></section></div>',
			'<div class="d-tips-8">' +
			/*-7-*/
			///编辑笔记
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">记录笔记</span></h4>' +
			'<section class="mt20 ml20 mr20 ana-bj-textarea"><textarea name="" id="noteContent" onkeyup="changetnote();" ></textarea></section>' +
			'<section class="mt10 clearfix mb20 ml20 mr20"><span class="fr"><label class="ana-bj-submit"><input type="button" id="notesubmit" name="" value="提交"></label><label class="ana-bj-reset"><input type="button" onclick="chongzhiNotOrCheck()" "name="" value="重置"></label></span><span class="fl c-666" id="notetips">你最多能输入200个字</span>' +
			'</section></div>',
			/*-8-*/
			//纠正答案
			'<div class="d-tips-8">' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">我要纠错</span></h4>' +
			'<section class="mt10 ana-bj-textarea ml20 mr20"><textarea name="" id="checkContent" onkeyup="changecheck();" ></textarea></section>' +
			'<section class="mt10 clearfix ml20 mr20 mb20"><span class="fr"><label class="ana-bj-submit"><input type="button" id="checksubmit" name="" value="提交"></label><label class="ana-bj-reset"><input type="button" onclick="chongzhiNotOrCheck()" "name="" value="重置"></label></span><span class="fl c-666" id="notetips">你最多能输入200个字</span>' +
			'</section></div>',
			/*-9-*/
			//用户自定义组卷
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">自定义组卷</span></h4>' +
			'<section class="mt10 custom-zj ml20 mr20"><ul>' +
			'<li><span class="vam c-333 fsize14 f-fM">难度：</span><span class="vam"><label class="ml10 c-666 hand vam"><input type="radio" name="level" value="1">容易</label><label class="ml10 c-666 hand vam"><input type="radio" name="level" value="2">中等</label><label class="ml10 c-666 hand vam"><input type="radio" name="level" value="3">困难</label><label class="ml10 c-666 hand vam"><font color="red" id="levelMessage"></font></label></span><span></li>' +
			'<li><span class="vam c-333 fsize14 f-fM">来源：</span><span class="vam"><label class="ml10 c-666 hand vam"><input type="checkbox" name="section" value="theSpecialTest">知识点练习</label><label class="ml10 c-666 hand vam"><input type="checkbox" name="section" value="examSprint">阶段测试</label><label class="ml10 c-666 hand vam"><input type="checkbox" name="section" value="zhenTi">真题练习</label><label class="ml10 c-666 hand vam"><font color="red" id="sectionMessage"></font></label></span></li>' +
			/*'<label class="ml10 c-666 hand vam"><input type="checkbox" name="qstType" value="2"></label></span></li>' +*/
			'<li><strong class="fsize14 f-fM c-333">提示：</strong><p class="c-333 mt10 tD30">1.自定义组卷单选题100道 ，论述题2道</p><p class="c-333 mt5 tD30">2.考试时间为3个小时</p><p class="c-333 mt5 tD30"></li>' +
			'</ul></section>' +
			'<section class="mt20 clearfix tac mb20"><span><label class="ana-bj-submit"><input type="button" onclick="getZujuanConditions()" value="提交"></label><label class="ana-bj-reset"><input type="button" onclick="clearZujuanConditions()" "name="" value="重置"></label></span>' +
			'</section></div>',
			/*-10-*/
			//登录弹出框
			'<div class="d-tips-1">' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">用户登录</span></h4>' +
			'<div class="mt20 mb20"><p class="e-l-jy" style="visibility: visible;display:none" id="loginMsg" ><font class="fsize12 c-orange" id="loginError"></font></p>' +
			'<div style=""><ol class="e-login-options"><li><label for="u-email">邮 箱：</label><input type="text" value="" name="" id="userEmail" ></li>' +
			'<li><label for="u-email">密 码：</label><input type="password" value="" name="" id="userPassword"></li>' +
			'</ol>' +
			'<section class="mt30 tac"><a class="e-login-btn" title="登 录" href="javascript:pageLogin(1,1)">登 录</a></section>' +
			'<section class="mt20 tar mr20"><a class="c-master fsize12" title="没有账号？去注册→" href="javascript:dialog(17)">没有账号？去注册→</a></section></div>' +
			'</div></div>',
			/*-11-*/
			//论述题自测
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">论述题自测<label id="quesNum"></label></span></h4>' +
			'<section class="mt10 custom-zj ml20 mr20"><ul>' +
			'<li id="questionsTest"><span class="vam c-333 fsize14 f-fM">论述题自测：</span><span class="vam"><label class="ml10 c-666 hand vam"><input type="radio" name="num" value="1" />随机一道</label><label class="ml10 c-666 hand vam"><input type="radio" name="num" value="2" />随机两道</label>'+
			'<label class="ml10 c-666 hand vam"><font color="red" id="numMessage"></font></label></section>' +
			'<section class="mt20 clearfix tac mb20" id="quesButton"><span><label class="ana-bj-submit"><input type="button" onclick="getQuestionTestNum()" value="提交" /></label><label class="ana-bj-reset"><input type="button" onclick="clearQuestionConditions()" "name="" value="重置" /></label></span>' +
			'</section></div>',
			/*-12-*/
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dtClose icon14 pa" style="top:-10px">&nbsp;</a></h4><div class="d-tips-10"><div style="width: 600px; height: 440px;" id="vHtml"></div></div>',
			/*-13-*/
			//答疑提交
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">答疑提交</span></h4>' +
			'<section class="mt10 ana-bj-textarea ml20 mr20"><textarea name="" id="checkContent" onkeyup="changecheck();" ></textarea></section>' +
			'<section class="mt10 ml20 mr20 mb20 clearfix"><span class="fr"><label class="ana-bj-submit"><input type="button" id="checksubmit" name="" value="提交" /></label><label class="ana-bj-reset"><input type="button" onclick="chongzhi()" "name="" value="重置" /></label></span><span class="fl c-666" id="notetips">你最多能输入255个字</span></section>' ,
			/*-14-*/
			//计算器
			'<section>'+
			'<div class="calcu-box">'+
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa" style="top:-10px">&nbsp;</a></h4>'+
			'<div class="calculator_re mt20 ml20 mr20"><input name="calculator_input" type="text" readonly="readonly" maxlength="50" value="0" /> <input type="button" name="calculator_input" value="" class="button" /></div>'+
			'<table border="0" cellspacing="1" cellpadding="0" class="calculator mb20 ml20 mr20">'+
			  '<tr>'+
			    '<td><input type="button" name="calculator_input" value="CE" /></td>'+
			    '<td><input type="button" name="calculator_input" value="C" /></td>'+
			    '<td><input type="button" name="calculator_input" value="退格" /></td>'+
			    '<td class="w"><input type="text" name="calculator_input" value="Null" class="char" /></td>'+
			    '<td><input type="button" name="calculator_input" value="7" /></td>'+
			    '<td><input type="button" name="calculator_input" value="8" /></td>'+
			    '<td><input type="button" name="calculator_input" value="9" /></td>'+
			    '<td><input type="button" name="calculator_input" value="+" /></td>'+
			  '</tr>'+
			  '<tr>'+
			    '<td><input type="button" name="calculator_input" value="sin" /></td>'+
			    '<td><input type="button" name="calculator_input" value="sqrt" /></td>'+
			    '<td><input type="button" name="calculator_input" value="取余" /></td>'+
			    '<td class="w"><input type="button" name="calculator_input" value="暂存"  /></td>'+
			    '<td><input type="button" name="calculator_input" value="4" /></td>'+
			    '<td><input type="button" name="calculator_input" value="5" /></td>'+
			    '<td><input type="button" name="calculator_input" value="6" /></td>'+
			    '<td><input type="button" name="calculator_input" value="-" /></td>'+
			  '</tr>'+
			  '<tr>'+
			    '<td><input type="button" name="calculator_input" value="cos" /></td>'+
			    '<td><input type="button" name="calculator_input" value="1/x" /></td>'+
			    '<td><input type="button" name="calculator_input" value="取整" /></td>'+
			    '<td class="w"><input type="button" name="calculator_input" value="取存" /></td>'+
			    '<td><input type="button" name="calculator_input" value="1" /></td>'+
			    '<td><input type="button" name="calculator_input" value="2" /></td>'+
			    '<td><input type="button" name="calculator_input" value="3" /></td>'+
			    '<td><input type="button" name="calculator_input" value="*" /></td>'+
			  '</tr>'+
			  '<tr>'+
			    '<td><input type="button" name="calculator_input" value="tan" /></td>'+
			    '<td><input type="button" name="calculator_input" value="x^y" /></td>'+
			    '<td><input type="button" name="calculator_input" value="百分数" /></td>'+
			    '<td class="w"><input type="button" name="calculator_input" value="累存" /></td>'+
			    '<td><input type="button" name="calculator_input" value="0" /></td>'+
			    '<td><input type="button" name="calculator_input" value="." /></td>'+
			    '<td><input type="button" name="calculator_input" value="+/-" /></td>'+
			    '<td><input type="button" name="calculator_input" value="/" /></td>'+
			  '</tr>'+
			  '<tr>'+
			    '<td><input type="button" name="calculator_input" value="log" /></td>'+
			    '<td><input type="button" name="calculator_input" value="n!" /></td>'+
			    '<td><input type="button" name="calculator_input" value="积存" /></td>'+
			    '<td class="w"><input type="button" name="calculator_input" value="清存" /></td>'+
			    '<td><input type="button" name="calculator_input" value="PI" /></td>'+
			    '<td><input type="button" name="calculator_input" value="E" /></td>'+
			    '<td colspan="2" class="re"><input type="button" name="calculator_input" value="=" class="result" /></td>'+
			  '</tr>'+
			'</table>'+
			'</div>'+
			'</section>',
	         /*-15-*/
	         //错误提示
			'<div class="d-tips-2">' +
				'<section>' +
				'<h4 class="d-s-head pr c-fff">提示：<a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt paperTypeName"></span></h4>' +
			'<section class="mt10 pageAfter ml20 mr20">中文练习正在核对当中，暂不开放。如造成不便，敬请谅解。</section>'+
			'<section class="mt10 tac"><span class="comm-btn-wrap"><a id="dClose" class="comm-btn c-btn-1" title="确定" href="javascript:void(0)">确定</a></span>' +
			'</section></section></div>'+
            '<section><input type="text" id="per" style="display:none"><input type="text" id="text1" style="display:none"></section>',
           /*-16-*/
            '<div class="d-tips-2">' +
            '<section>' +
            '<h4 class="d-s-head pr c-fff">选择模式：<a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt paperTypeName"></span></h4>' +
            '<section class="mt20 mb20 ml20 mr20 tac"><span class="comm-btn-wrap"><a class="comm-btn c-btn-1" onclick="selectExamMode(1)"  title="考试模式" href="javascript:void(0)">考试模式</a><a class="comm-btn c-btn-1 mt10" onclick="selectExamMode(2)" title="练习模式" href="javascript:void(0)">练习模式</a></span>' +
            '</section></section></div>'+
            '<section><input type="text" id="per" style="display:none"><input type="text" id="text1" style="display:none"></section>',
			/*-17-*/
			//注册弹出框
			'<div class="d-tips-1">' +
			'<form method="post" name="regForm" id="regForm" novalidate="novalidate"> ' +
			'<input type="hidden" id="source" value="exam" name="userForm.source">' +
			'<h4 class="d-s-head pr"><a href="javascript:void(0)" title="关闭" class="dClose icon14 pa">&nbsp;</a><span class="d-s-head-txt">用户注册</span></h4>' +
			'<div class="mt20 mb20"><p class="e-l-jy" style="visibility: visible;display:none" id="loginMsg" ><font class="fsize12 c-orange" id="regError"></font></p>' +
			'<div class="ml20 mr20"><ol class="e-login-options">' +
			'<li><label for="u-email">邮 箱：</label><input type="text" value="" onblur="emailCheck()" name="userForm.email" id="regEmail"></li>' +
			'<li><label for="u-email">密 码：</label><input type="password" value=""  name="userForm.password" id="regPwd"></li>' +
			'<li><label for="u-email">确认密码：</label><input type="password" value=""  name="userForm.confirmPassword" id="cusPwdConfirm"></li>' +
			'<li><label for="u-email">手机号码：</label><input type="text" value="" name="userForm.mobile" onblur="mobileCheck()" id="regMobile"></li>' +
			'<li><label for="u-email">验证码：</label><input type="text" value=""  name="randomCode" id="randomcode" style="width: 140px"><img border="0" onclick="this.src=\'/ran/ajax/random?v=\'+Math.random()" alt="验证码，点击图片更换" src="/ran/ajax/random" style="vertical-align:middle;margin-left: 10px;" id="img" height="34"></li>' +
			'</ol>' +
			'<section class="mt30 tac"><a class="e-login-btn" title="注 册" href="javascript:register()">注 册</a></section>' +
			'<section class="mt20 tar mr20"><a class="c-master fsize12" title="去登陆→" href="javascript:dialog(10)">去登陆→</a></section></div>' +
			'</div>' +
			'</form>' +
			'</div>',
			];
		$("#dcWrap").html(dCont[num]);

		var dTop = (parseInt(document.documentElement.clientHeight, 10)/2) + (parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10)),
			dH = dialogEle.height(),
			dW = dialogEle.width(),
			timer = null,
			dClose;
		dialogEle.css({"top" : (dTop-(dH/2)) , "margin-left" : -(dW/2)});
		dClose = function() {dialogEle.remove();oBg.remove();};
		
		$(".dClose").bind("click", dClose);
		$("#dClose").bind("click", function() {dialogEle.remove();oBg.remove();});
	}
	
	
	function killIe6() {
		if (!window.XMLHttpRequest) {
			alert("您的浏览器版本太旧，请升级您的浏览器，推荐使用谷歌、火狐浏览器！或IE8以上");
		}
	}
	
	function trBg() {
		$("#treeDemo>li:odd").css({"background-color" : "#f4f4f4"});
	}
	
	//加载观看记录
	function querypaperRecordByCusIdAndSubjectId(){
		$.ajax({
			type:"POST",
			dataType:"json",
			url:baselocation+"/paper/querypaperRecordByCusIdAndSubjectId",
			data:{},
			async:false,
			success:function(result){
				if(result.success==true){ 
					var str = '<div class="kg-list png" ><section class="dis tac"><section class="no-data-wrap"><em class="icon30 no-data-ico">&nbsp;</em> <span class="c-666 fsize14 ml10 vam">你还没有进行过测试...</span></section></section></div>';
					var paperRecordList = result.entity;
					if(paperRecordList!=null&&paperRecordList.lenght!=0){
						str = '<div class="kg-list png" ><section class="dis" >';
						str+='<dl>';
						for(var i=0;i<paperRecordList.length;i++){
							var paperRecordNow = paperRecordList[i];
							var dateNow = paperRecordNow.addTime;
							dateNow = dateNow.substring(5, 10);
							var dateLast ="";
							if(i!=0){
								dateLast = paperRecordList[i-1].addTime;
								dateLast = dateLast.substring(5, 10);
							}
							if(dateNow!=dateLast){
								str+='<dt><span title="'+dateNow+'">'+dateNow+'</span></dt>';
							}
							if(paperRecordNow.status==1){
								str+='<dd><a class="m-c-go fr" title="继续考试" href="javascript:void(0)" onclick="javascript:window.open(\'/paper/toExamPaperRecord/'+paperRecordNow.id+'\');">继续考试</a>';
							}else{
								str+='<dd><a class="m-c-go fr" title="查看报告" href="javascript:void(0)" onclick="javascript:window.open(\'/paper/toExamPaperRecord/'+paperRecordNow.id+'\');">查看报告</a>';
							}
							str +='<a class="m-c-link" title="'+paperRecordNow.paperName+'" href="javascript:void(0)" onclick="javascript:window.open(\'/paper/toExamPaperRecord/'+paperRecordNow.id+'\');">'+paperRecordNow.paperName+'</a>';
							str+='</dd>';
						}
						str+='</dl><div class="kg-more"><a href="/paper/toExamPaperRecordList" title="更多">更多&gt;&gt;</a></div></section></div>';
						$("#paperRecordList").html(str);
						$("#mypaperRecordList").html(str);
					}
				}
				
			}
		});
	}
	
	//公共弹出框
	function dialoghtml(html,change) {
		//先删除之前的
		$(".dialog-shadow").remove();
		$(".bg-shadow").remove();
		var oBg = $('<div class="bg-shadow"></div>').appendTo($("body")),
			dialogEle = $('<div class="dialog-shadow"><div class="dialog-ele"><div id="dcWrap" class="pt20 pb20 pl20 pr20 of">内容位置</div></div></div>').appendTo($("body"));
		$("#dcWrap").html(html);
		var dTop = (parseInt(document.documentElement.clientHeight, 10)/2) + (parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10)),
			dH = dialogEle.height(),
			dW = dialogEle.width(),
			timer = null,
			dClose;
		dialogEle.css({"top" : (dTop-(dH/2)) , "margin-left" : -(dW/2)});
		dClose = function() {dialogEle.remove();oBg.remove();};
		if(change){
			$(".dtClose").bind("click", dClose);
		}else{
			$(".dtClose").hide();
		}
	}
	
	//判断是否已经选择了专业，未选择弹出
	function loadsubject(change){
		var subject =getCookie("e.subject");
		if(change || isNull(subject)){
			$.ajax({
				type:"post",
				dataType:"text",
				url:baselocation+"/subj/ajax/getSubject",
				data:{},
				async:false,
				success:function(result){
					dialoghtml(result,change);
				},error:function(error){
					alert("加载错误");
				}
			});
		}
	}
	
	//拖动弹出框&提示框方法
	function dragFun() {
		var eDrag = document.getElementById("dialog-shadow"),
		    oDrag = document.getElementById("dcWrap"),
	        bDrag = false,
	        disX = disY = 0;
		oDrag.onmousedown = function(event) {
			var event = event || window.event;
			bDrag = true;
			disX = event.clientX - eDrag.offsetLeft;
			disY = event.clientY - eDrag.offsetTop;
			this.setCapture && this.setCapture();
			return false;
		};
		document.onmousemove = function(event) {
			if(!bDrag) return;
			var event = event || window.event;
			var dL = event.clientX - disX;
			var dT = event.clientY - disY;
			var maxL = document.documentElement.clientWidth + (document.documentElement.scrollLeft || document.body.scrollLeft) - eDrag.offsetWidth;
			var maxT = document.documentElement.clientHeight + (document.documentElement.scrollTop || document.body.scrollTop) - eDrag.offsetHeight;
			dL = dL < 0 ? 0 : dL;
			dL = dL > maxL ? maxL : dL;
			dT = dT <0 ? 0 : dT;
			dT = dT > maxT ? maxT : dT;
			eDrag.style.marginTop = eDrag.style.marginLeft = 0;
			eDrag.style.left = dL + "px";
			eDrag.style.top = dT + "px";
			return false;
		};
		document.onmouseup = window.onblur = oDrag.onlosecapture = function() {
			bDrag = false;
			oDrag.releaseCapture && oDrag.releaseCapture();
		};
	}
	function quesCard(){
		var _qBtn=$(".q-card-box").children("dt").children("a"),
			_qBox=$(".q-card-box").children("dd");
		_qBtn.click(function(){
			if(!_qBtn.hasClass("q-car-wrap")){
				_qBox.slideUp();
				_qBtn.addClass("q-car-wrap");
			}else{
				_qBox.slideDown();
				_qBtn.removeClass("q-car-wrap");
			}
		})
		
	}
	function leftMenuScroll() {
		var lM = function() {
			var sTop = parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10);
			var footerHeight=$("#footer").height();
			//当滚动条滑动到据底部 #footer  并且  $("#p-test-box")距离 底部的距离 小于 #footer 的高度    时触发
			if($(document).scrollTop()>= $(document).height()-$(window).height()-footerHeight-92 && $(window).height()-$("#p-test-box").height()+( $("#p-test-box").offset().top-$(document).scrollTop() )<footerHeight+92){
                $("#p-test-box").css("position" , "fixed");
				$("#p-test-box").removeClass("p-test-box").css("bottom",footerHeight+92+"px");
			}
			else if (sTop > 165) {
                $("#p-test-box").attr("style","").addClass("p-test-box");
				$("#p-test-box").css("position" , "fixed");
			} else {
                $("#p-test-box").attr("style","").addClass("p-test-box");
				$("#p-test-box").css("position" , "absolute");
			}
		};
		if($("#p-test-box").length>0){
            $(window).bind("scroll" , lM);
		}
	}
	function cTabFun(op) {
	    var cTab = op;
	    cTab.each(function() {
	        var _this = $(this),
	            _tName = _this.attr("name");
	        _this.click(function() {
	            _this.parent().addClass("current").siblings().removeClass("current");
	            $("html,body").animate({"scrollTop":$("."+_tName+"-content").offset().top}, 500);
	        })
	    })
	}