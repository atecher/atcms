<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<head>
	<base href="${pageContext.request.contextPath}"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>${web_manager_title} - 后台</title>
    <meta name="keywords" content="${keywords}">
    <meta name="description" content="${description}">
    <link href="${pageContext.request.contextPath}/asset/favicon/favicon.png" rel="Shortcut Icon" type="image/x-icon"/>
    <link href="${pageContext.request.contextPath}/asset/favicon/favicon.png" rel="Bookmark"/>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/animate.css/3.5.1/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/console/css/style.min.css" rel="stylesheet"/>
</head>
<body class="fixed-sidebar full-height-layout gray-bg  pace-done" style="overflow:hidden" >
<div class="pace  pace-inactive">
	<div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
	  <div class="pace-progress-inner"></div>
	</div>
	<div class="pace-activity"></div>
</div>
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse" style="width: auto; height: 100%;">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="profile-element" style="margin-left: 20px;">
                            <span><img alt="image" class="img-circle" src="${website_current_user.avatar}" width="80" height="80" onerror="this.src='${pageContext.request.contextPath}/asset/console/img/a8.jpg'"></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="http://www.zi-han.net/theme/hplus/index.html#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${website_current_user.name},欢迎您~</strong></span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <c:forEach items="${menu}" var="menu">
                    	<li>
			                <a href="${pageContext.request.contextPath}${menu.url}"><c:if test="${not empty menu.icon}"><i class="${menu.icon}"></i></c:if><span class="nav-label">${menu.name}</span><span class="fa arrow"></span></a>
                         <c:if test="${not empty menu.children}">
                            <ul class="nav nav-second-level collapse">
                            <c:forEach items="${menu.children}" var="child">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}${child.url}" data-index="${child.id}"><c:if test="${not empty child.icon}"><i class="${child.icon}"></i></c:if>${child.name}</a></li>
                            </c:forEach>
                            </ul>
                         </c:if>
                    </li>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/asset/console/index.html#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/typography.html" data-index="56">排版</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">字体图标 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li>
                                        <a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/fontawesome.html" data-index="57">Font Awesome</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/glyphicons.html" data-index="58">Glyphicon</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/iconfont.html" data-index="59">阿里巴巴矢量图标库</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">拖动排序 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/draggable_panels.html" data-index="60">拖动面板</a>
                                    </li>
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/agile_board.html" data-index="61">任务清单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/buttons.html" data-index="62">按钮</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/tabs_panels.html" data-index="63">选项卡 &amp; 面板</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/notifications.html" data-index="64">通知 &amp; 提示</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/badges_labels.html" data-index="65">徽章，标签，进度条</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/grid_options.html" data-index="66">栅格</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/plyr.html" data-index="67">视频、音频</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">弹框插件 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/layer.html" data-index="68">Web弹层组件layer</a>
                                    </li>
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/modal_window.html" data-index="69">模态窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/sweetalert.html" data-index="70">SweetAlert</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">树形视图 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/jstree.html" data-index="71">jsTree</a>
                                    </li>
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/tree_view.html" data-index="72">Bootstrap Tree View</a>
                                    </li>
                                    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/nestable_list.html" data-index="73">nestable</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/toastr_notifications.html" data-index="74">Toastr通知</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/diff.html" data-index="75">文本对比</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/spinners.html" data-index="76">加载动画</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/widgets.html" data-index="77">小部件</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div><div class="slimScrollBar" style="width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 956px; background: rgb(0, 0, 0);"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a></div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="${pageContext.request.contextPath}/asset/console/index.html#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="${pageContext.request.contextPath}/asset/console/profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/asset/console/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="${pageContext.request.contextPath}/asset/console/profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/asset/console/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="${pageContext.request.contextPath}/asset/console/mailbox.html" data-index="88">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="${pageContext.request.contextPath}/asset/console/index.html#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="${pageContext.request.contextPath}/asset/console/mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/asset/console/profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/notifications.html" data-index="89">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/asset/console/index.html#">
                               个人设置
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="J_menuItem"  href="${pageContext.request.contextPath}/user/avatar" data-index="0">
                                        <div>修改头像</div>
                                    </a>
                                </li>
                                <li>
                                    <a  class="J_menuItem"  href="${pageContext.request.contextPath}/user/avatar" data-index="0">
                                        修改头像
                                    </a>
                                </li>
                                <li>
                                    <a class="J_menuItem"  href="${pageContext.request.contextPath}/user/avatar" data-index="0">
                                        修改头像
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false"><i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${pageContext.request.contextPath}/account/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/admin/dashboard" frameborder="0" data-id="index_v1.html" seamless=""></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">© 2014-2015 <a href="http://www.zi-han.net/" target="_blank">zihan's blog</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container" style="width: auto; height: 100%;">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="${pageContext.request.contextPath}/asset/console/index.html#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="${pageContext.request.contextPath}/asset/console/index.html#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="${pageContext.request.contextPath}/asset/console/index.html#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="${pageContext.request.contextPath}/asset/console/index.html#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="${pageContext.request.contextPath}/asset/console/index.html#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="${pageContext.request.contextPath}/asset/console/index.html#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        写的好！与您分享
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        最近在补追此剧，特别喜欢这段表白。
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/asset/console/img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        我发起了一个投票 【你认为下午大盘会翻红吗？】
                                        <br>
                                        <small class="text-muted">星期一 8:37</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>市场调研</h4> 按要求接收教材；

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asset/console/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>

                        </ul>

                    </div>
                </div>

            </div>
            <div class="slimScrollBar" style="width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 895px; background: rgb(0, 0, 0);"></div>
            <div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.4; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
        </div>
        
        <!--右侧边栏结束-->

    </div>
    <script type="text/javascript"  src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript"  src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript"  src="http://cdn.bootcss.com/metisMenu/2.1.0/metisMenu.min.js"></script>
    <script src="http://cdn.bootcss.com/jQuery-slimScroll/1.3.7/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/hplus.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/contabs.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/asset/console/js/pace.min.js"></script>

</body>
</html>
