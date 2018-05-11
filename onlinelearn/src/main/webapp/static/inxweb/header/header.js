$(function() {
	cssNavigation();
	showUserInfo();
	queryUnReadNum();// 查询未读消息
});

/**
 * 头部显示用户信息
 */
function showUserInfo() {
	var user = getLoginUser();
	if(user!=null && user.user_id>0){
		var user_name = user.user_name;
		if (user_name == null || $.trim(user_name) == '') {
			user_name = user_name;
		}
		// 头像
		var pic_img = user.pic_img;
		if (pic_img == null || $.trim(pic_img) == '') {
			pic_img = baselocation + '/static/inxweb/img/avatar-boy.gif';
		} else {
			pic_img = imagesPath + pic_img;
		}
		$("#userName").text(user_name);
		$(".userImgPhoto").attr("src", pic_img);
		$(".userImgPhoto").attr("alt", user_name);
		$(".userNameClass").html(user_name);
		$("#showName").text(user_name);
		$("#showName").attr('title', user_name);
		userBannerImage = user.banner_url;
		// 头部显示
		$("#userName").text(user_name);
		$("#userName").attr('title', user_name);
		$("#is-login-one,#is-login-two,#mobileExitDiv").show();
		$(".picImg").attr("src", pic_img);
	} else {
		$("#no-login").show();
	}
}
/**
 * 设置导航选中样式
 */
function cssNavigation() {
	var url = window.document.location.pathname;
	$("a[href$='" + url + "']").parent().addClass("current");
}
