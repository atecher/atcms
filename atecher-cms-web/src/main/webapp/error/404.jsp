<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 页面不见了-ATecher | 关注科技和程序员的那些事儿</title>
<meta name="viewport" content="initial-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<style type="text/css">
body, html {
	background: #363d4d !important
}
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
#error404 {
    color: #505c73;
    text-align: center;
    font-size: 22px;
}

p.errorfour {
    margin: 150px auto 40px auto;
    width: 504px;
    height: 215px;
    background: url(${pageContext.request.contextPath}/asset/console/img/page404.png) no-repeat;
}

#error404 a {
    display: inline-block;
    margin-top: 80px;
    width: 200px;
    height: 50px;
    border: 1px solid #475266;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    color: #505c73;
    text-align: center;
    font-size: 20px;
    line-height: 50px;
    -webkit-transition: all .3s linear;
    -moz-transition: all .3s linear;
    -o-transition: all .3s linear;
    transition: all .3s linear;
    -o-border-radius: 5px;
    -ms-border-radius: 5px;
}

#error404 a:hover {
    border: 1px solid #737f99;
    color: #737f99;
}
</style>

</head>
<body class="error404" >
	<div id="error404">
		<p class="errorfour"></p>
		<p>页面出错或者没有此页面，点击下面的按钮返回首页。</p>
<!-- 		<a href="">返回首页</a> -->
	</div>
</body>
</html>