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
    <link href="http://cdn.bootcss.com/bootstrap-table/1.9.0/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/console/css/style.min.css" rel="stylesheet"/>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-9 animated fadeInLeft">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>设置URL</h5>
                </div>
                <div class="ibox-content">
                    <div class="tabs-container">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/urlrewrite/save" method="post" id="rewriteRuleForm">
                            <input type="hidden" name="id" value="${rewriteRule.id}"/>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">URL_FROM</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="urlFrom" value="${rewriteRule.urlFrom}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">URL_TO</label>
                                    <div class="col-sm-10">
                                        <input name="urlTo" type="text" value="${rewriteRule.urlTo}" class="form-control" placeholder="请输入要重写成的URL..."/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">重写类型</label>
                                    <div class="col-sm-10">
                                        <select class="form-control m-b" name="template">
                                            <option value="forward" <c:if test="${rewriteRule.urlToType=='forward'}">selected</c:if>>FORWARD</option>
                                            <option value="redirect" <c:if test="${rewriteRule.urlToType=='redirect'}">selected</c:if>>REDIRECT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 animated fadeInRight">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>操作</h5>
                    <div class="ibox-tools">
                        <button class="btn btn-primary btn-xs" id="returnList">返回列表</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="file-manager">
                        <div class="form-group">
                            <button class="btn btn-danger btn-block " id="saveRule">保存</button>
                            <button class="btn btn-primary btn-block " id="resetRule">重置</button>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Panel Other -->
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/content.min.js"></script>
<script type="text/javascript">
    $("#saveRule").click(function () {
        $("#rewriteRuleForm").submit();
    });
    $("#resetRule").click(function () {
        $("#rewriteRuleForm")[0].reset();
    });
    $("#returnList").click(function () {
        window.location.href = "${pageContext.request.contextPath}/admin/urlrewrite";
    });
</script>
</body>
</html>