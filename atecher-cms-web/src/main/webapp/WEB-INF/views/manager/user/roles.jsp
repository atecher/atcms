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
<input type="hidden" id="user_id" value="${user_id}"/>
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox">
                <div class="ibox-content">
                    <h3>待选用户组</h3>
                    <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动任务面板</p>
                    <ul class="sortable-list connectList agile-list">
                        <c:forEach items="${otherRoles}" var="role">
                            <li class="warning-element" role-id="${role.role_id}">
                                    ${role.role_name}[代码:${role.role_code}]
                                <div class="agile-detail">
                                        ${role.role_desc}
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox">
                <div class="ibox-content role_selected">
                    <h3>已选用户组</h3>
                    <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动任务面板</p>
                    <ul class="sortable-list connectList agile-list">
                        <c:forEach items="${ownRoles}" var="role">
                            <li class="success-element" role-id="${role.role_id}">
                                    ${role.role_name}[代码:${role.role_code}]
                                <div class="agile-detail">
                                        ${role.role_desc}
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <button type="button" class="btn btn-danger btn-block" id="btn_submit">保存</button>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/content.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".sortable-list").sortable({connectWith: ".connectList"}).disableSelection();
        $("#btn_submit").on("click", function () {
            var user_id = $("#user_id").val();
            var $selecteds = $(".role_selected li");
            var array = new Array();
            $selecteds.each(function () {
                array.push($(this).attr("role-id"));
            });
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/user/roles/' + user_id,
                method: "post",
                data: {"role_ids": array},
                dataType: 'json',
                traditional: true,
                success: function (rData) {
                    parent.layer.closeAll('iframe');
                }
            });
        });
    });
</script>
</body>
</html>