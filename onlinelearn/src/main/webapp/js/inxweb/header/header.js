$(function() {
	cssNavigation();
	showUserInfo();
	//queryUnReadNum();// 查询未读消息
});

/**
 * 头部显示用户信息
 */
function showUserInfo() {
		$("#no-login").show();
}
/**
 * 设置导航选中样式
 */
function cssNavigation() {
	var url = window.document.location.pathname;
	$("a[href$='" + url + "']").parent().addClass("current");
}
