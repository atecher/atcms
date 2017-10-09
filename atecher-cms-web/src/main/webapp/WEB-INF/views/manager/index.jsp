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
                            <span><img alt="image" class="img-circle" src="${website_current_user.avatar}" width="80" height="80"></span>
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
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/index_v1.html" data-index="0">主页示例一</a></li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/index_v2.html" data-index="5">主页示例二</a></li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/index_v3.html" data-index="6">主页示例三</a></li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/index_v4.html" data-index="7">主页示例四</a></li>
                            <li><a href="http://www.zi-han.net/theme/hplus/index_v5.html" target="_blank">主页示例五</a></li>
                        </ul>

                    </li>
                    <li>
                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layouts.html" data-index="8"><i class="fa fa-columns"></i> <span class="nav-label">布局</span></a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse">
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_echarts.html" data-index="9">百度ECharts</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_flot.html" data-index="10">Flot</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_morris.html" data-index="11">Morris.js</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_rickshaw.html" data-index="12">Rickshaw</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_peity.html" data-index="13">Peity</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_sparkline.html" data-index="14">Sparkline</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_metrics.html" data-index="15">图表组合</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mailbox.html" data-index="16">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mail_detail.html" data-index="17">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mail_compose.html" data-index="18">写信</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_basic.html" data-index="19">基本表单</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_validate.html" data-index="20">表单验证</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_advanced.html" data-index="21">高级插件</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_wizard.html" data-index="22">表单向导</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">文件上传 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_webuploader.html" data-index="23">百度WebUploader</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_file_upload.html" data-index="24">DropzoneJS</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_avatar.html" data-index="25">头像裁剪上传</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">编辑器 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_editors.html" data-index="26">富文本编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_simditor.html" data-index="27">simditor</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_markdown.html" data-index="28">MarkDown编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/code_editor.html" data-index="29">代码编辑器</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/suggest.html" data-index="30">搜索自动补全</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layerdate.html" data-index="31">日期选择器layerDate</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/index.html#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/contacts.html" data-index="32">联系人</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/profile.html" data-index="33">个人资料</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">项目管理 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/projects.html" data-index="34">项目</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/project_detail.html" data-index="35">项目详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/teams_board.html" data-index="36">团队管理</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/social_feed.html" data-index="37">信息流</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/clients.html" data-index="38">客户管理</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/file_manager.html" data-index="39">文件管理器</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/calendar.html" data-index="40">日历</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">博客 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/blog.html" data-index="41">文章列表</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/article.html" data-index="42">文章详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/faq.html" data-index="43">FAQ</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">时间轴 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/timeline.html" data-index="44">时间轴</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/timeline_v2.html" data-index="45">时间轴v2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/pin_board.html" data-index="46">标签墙</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">单据 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/invoice.html" data-index="47">单据</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/invoice_print.html" data-index="48">单据打印</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/search_results.html" data-index="49">搜索结果</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/forum_main.html" data-index="50">论坛</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">即时通讯 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/chat_view.html" data-index="51">聊天窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/webim.html" data-index="52">layIM</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">登录注册相关 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a href="http://www.zi-han.net/theme/hplus/login.html" target="_blank">登录页面</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/login_v2.html" target="_blank">登录页面v2</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/register.html" target="_blank">注册页面</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/lockscreen.html" target="_blank">登录超时</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/404.html" data-index="53">404页面</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/500.html" data-index="54">500页面</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/empty_page.html" data-index="55">空白页</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/index.html#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/typography.html" data-index="56">排版</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">字体图标 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/fontawesome.html" data-index="57">Font Awesome</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/glyphicons.html" data-index="58">Glyphicon</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/iconfont.html" data-index="59">阿里巴巴矢量图标库</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">拖动排序 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/draggable_panels.html" data-index="60">拖动面板</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/agile_board.html" data-index="61">任务清单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/buttons.html" data-index="62">按钮</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/tabs_panels.html" data-index="63">选项卡 &amp; 面板</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/notifications.html" data-index="64">通知 &amp; 提示</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/badges_labels.html" data-index="65">徽章，标签，进度条</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/grid_options.html" data-index="66">栅格</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/plyr.html" data-index="67">视频、音频</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">弹框插件 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layer.html" data-index="68">Web弹层组件layer</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/modal_window.html" data-index="69">模态窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/sweetalert.html" data-index="70">SweetAlert</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">树形视图 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level collapse">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/jstree.html" data-index="71">jsTree</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/tree_view.html" data-index="72">Bootstrap Tree View</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/nestable_list.html" data-index="73">nestable</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/toastr_notifications.html" data-index="74">Toastr通知</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/diff.html" data-index="75">文本对比</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/spinners.html" data-index="76">加载动画</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/widgets.html" data-index="77">小部件</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/index.html#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_basic.html" data-index="78">基本表格</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_data_tables.html" data-index="79">DataTables</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_jqgrid.html" data-index="80">jqGrid</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_foo_table.html" data-index="81">Foo Tables</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_bootstrap.html" data-index="82">Bootstrap Table
                                <span class="label label-danger pull-right">推荐</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/index.html#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/basic_gallery.html" data-index="83">基本图库</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/carousel.html" data-index="84">图片切换</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/blueimp.html" data-index="85">Blueimp相册</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/css_animation.html" data-index="86"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/index.html#"><i class="fa fa-cutlery"></i> <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_builder.html" data-index="87">表单构建器</a>
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
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="http://www.zi-han.net/theme/hplus/index.html#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="http://www.zi-han.net/theme/hplus/profile.html" class="pull-left">
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
                                        <a href="http://www.zi-han.net/theme/hplus/profile.html" class="pull-left">
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
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mailbox.html" data-index="88">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="http://www.zi-han.net/theme/hplus/index.html#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="http://www.zi-han.net/theme/hplus/mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="http://www.zi-han.net/theme/hplus/profile.html">
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="http://www.zi-han.net/theme/hplus/index.html#">
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
                        <a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/index.html#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/index.html#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/index.html#tab-3">
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
                         <a href="http://www.zi-han.net/theme/hplus/index.html#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="http://www.zi-han.net/theme/hplus/index.html#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="http://www.zi-han.net/theme/hplus/index.html#" class="s-skin-3">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/index.html#">
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