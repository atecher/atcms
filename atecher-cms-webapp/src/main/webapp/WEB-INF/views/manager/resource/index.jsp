<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - Bootstrap Table</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/animate.css/3.5.1/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/console/css/style.min.css" rel="stylesheet"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>显示：</h5>
                        <a href="file_manager.html#" class="file-control active">所有</a>
                        <a href="file_manager.html#" class="file-control">文档</a>
                        <a href="file_manager.html#" class="file-control">视频</a>
                        <a href="file_manager.html#" class="file-control">图片</a>
                        <div class="hr-line-dashed"></div>
                        <button class="btn btn-primary btn-block">上传文件</button>
                        <div class="hr-line-dashed"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list" style="padding: 0;">
                            <c:forEach items="${resourceRoots}" var="rr">
                                <li><a href="javascript:;" data-path="${rr.path}" data-file-type="folder"><i class="fa fa-folder"></i> ${rr.name}</a></li>
                            </c:forEach>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12 file-container"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/content.min.js"></script>
<script type="text/javascript">var basePath = "${pageContext.request.contextPath}";</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/resource-manager.min.js?v=4.4"></script>
</body>
</html>