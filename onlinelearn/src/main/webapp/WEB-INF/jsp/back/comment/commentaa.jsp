<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<style type="">

#in{
width: 150px;
height: 25px;

}


#d1{
width: 150px;
height: 100px;


}
</style>
</head> 

<from>

评论类型:<input class="in" type="text" name=""  >
<br/>

评论内容：<div id="d1">
<input type="" name="content" value="${Comment.content}" />





</div>

父级评论内容：<div >

	<input type="" name="content" value="${Comment.content}" />

</div>
</from>

</body>
</html>