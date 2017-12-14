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
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>网站用户</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <div class="example-wrap">
                        <div class="example">
                            <div class="hidden-xs" id="dataTableEventsToolbar" role="group">
                                <button type="button" class="btn  btn-info  btn-bitbucket btn-circle" id="newUser"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i></button>
                                <button type="button" class="btn btn-danger  btn-bitbucket btn-circle"><i class="glyphicon glyphicon-trash" aria-hidden="true"></i></button>
                            </div>
                            <table id="dataTableEvents"
                                   data-height="600" data-mobile-responsive="true"
                                   data-url="${pageContext.request.contextPath}/admin/user/data" data-cache="false" data-striped="true" data-method="post" data-data-type="json" data-content-type="application/x-www-form-urlencoded"
                                   data-pagination="true" data-page-number="1" data-page-size="20" data-page-list="[10, 20, 50, 100]" data-side-pagination="server" data-query-params="queryParams"
                                   data-toggle="table" data-show-toggle=“true”
                                   data-search="true" data-show-columns="true" data-show-refresh="true" data-icon-size="outline" data-toolbar="#dataTableEventsToolbar" data-sortable="true"
                            >
                                <thead>
                                <tr>
                                    <th data-field="check" data-checkbox="true"></th>
                                    <th data-field="nick_name" data-align="center" data-valign="middle" data-sortable="true">用户名</th>
                                    <th data-field="reg_email" data-align="center" data-valign="middle">注册邮箱</th>
                                    <th data-field="real_name" data-align="center" data-valign="middle">真实姓名</th>
                                    <th data-field="logins" data-align="center" data-valign="middle">登录次数</th>
                                    <th data-field="operate" data-align="center" data-valign="middle" data-formatter="operateFormatter" data-events="operateEvents">操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/content.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-table/1.9.0/bootstrap-table.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-table/1.9.0/extensions/mobile/bootstrap-table-mobile.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-table/1.9.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#dataTableEvents').bootstrapTable('resetView');
        });
        $("#newUser").on("click", function () {
            window.location.href = '${pageContext.request.contextPath}/admin/user/add';
        });
    });

    function operateFormatter(value, row, index) {
        return [
            '<button class="edit  btn btn-warning btn-circle btn-tb" title="编辑">',
            '<i class="fa fa-users"></i>',
            '</button>  ',
            '<button class="role  btn btn-info btn-circle btn-tb" title="授权">',
            '<i class="fa fa-users"></i>',
            '</button>  ',
            '<button class="remove  btn btn-danger btn-circle btn-tb" title="删除">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</button>'
        ].join('');
    }
    function queryParams(params) {  //配置参数
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            search: params.search,
            sort: params.sort,  //排序列名
            order: params.order//排位命令（desc，asc）
        };
        return temp;
    }
    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
            window.location.href="${pageContext.request.contextPath}/admin/user/edit/"+row.user_id;
        },
        'click .role': function (e, value, row, index) {
            parent.layer.open({
                type: 2,
                title: '分配用户组',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['1150px', '650px'],
                content: ['${pageContext.request.contextPath}/admin/user/roles/' + row.user_id], //iframe的url，no代表不显示滚动条
                end: function () { //此处用于演示
                    $('#dataTableEvents').bootstrapTable('refresh');
                    //.layer.msg('分配完成', {icon: 6,shift:3});
                }
            });
        },
        'click .remove': function (e, value, row, index) {
            parent.layer.confirm('您确认要删除这条数据吗？', {
                btn: ['确认', '算了'],
                shade: false
            }, function () {
                parent.layer.closeAll();
                $.getJSON("${pageContext.request.contextPath}/admin/user/remove/" + row.user_id, function (data) {
                    alert(data.code);
                    if (data.code == "success") {
                        $('#dataTableEvents').bootstrapTable('refresh');
                    }
                });
            }, function () {
                parent.layer.closeAll();
            });

        }
    };
</script>
</body>
</html>