<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="${pageContext.request.contextPath}/asset/console/css/plugins/codemirror/codemirror.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/console/css/plugins/codemirror/ambiance.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/console/css/style.min.css" rel="stylesheet"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-9 animated fadeInLeft">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>查看文件</h5>
                </div>
                <div class="ibox-content">
                    <c:choose>
                    <c:when test="${fn:contains('txt,jsp,css,properties,js,json',fileInfo.suffix)}"><textarea id="editor"><c:out value="${fileContent}"/></textarea></c:when>
                    <c:when test="${fn:contains('bmp,png,gif,jpg,jpeg',fileInfo.suffix)}"><img src="${pageContext.request.contextPath}${fileInfo.path}"/></c:when>
                        <%--<c:when test="${fn:contains('bmp,png,gif,jpg,jpeg',fileInfo.suffix)}"><textarea id="editor"><img src="${pageContext.request.contextPath}${fileInfo.path}"/></c:when>--%>
                    <c:otherwise><textarea id="editor">请点击<a href="${pageContext.request.contextPath}${fileInfo.path}" target="_blank">${fileInfo.name}</a>进行查看</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="col-sm-3 animated fadeInRight">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>文件信息</h5>
                        <p>文件名：${fileInfo.name}</p>
                        <p>文件大小：${fileInfo.size}</p>
                        <p>修改时间：${fileInfo.lastModified}</p>
                        <c:if test="${fn:contains('txt,jsp,css,properties,js,json',fileInfo.suffix)}">
                            <div class="hr-line-dashed"></div>
                            <button class="btn btn-primary btn-block">保存文件</button>
                        </c:if>
                        <div class="hr-line-dashed"></div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/console/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/console/js/plugins/codemirror/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/asset/console/js/plugins/codemirror/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/content.min.js"></script>
<script>
    $(document).ready(function () {
        var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
            lineNumbers: true,
            matchBrackets: true,
            styleActiveLine: true,
            lineWrapping: true,
            theme: "ambiance"
        });
    });
</script>

</body>
</html>