<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header class="at-header " data-uk-sticky="{top:-200}">
    <div class="uk-container uk-container-center">
        <nav class="tm-navbar uk-navbar uk-navbar-attached uk-clearfix">
            <a class="uk-navbar-brand uk-visible-large" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/asset/logo/logo.png" width="150" height="40"/></a>
            <ul class="uk-navbar-nav uk-visible-large" >
                <li class="uk-parent" data-uk-dropdown="{remaintime:100}"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="uk-parent" data-uk-dropdown="{remaintime:100}"><a href="${pageContext.request.contextPath}/category/openSource">开源</a></li>
                <li class="uk-parent" data-uk-dropdown="{remaintime:100}"><a href="${pageContext.request.contextPath}/category/programmer">程序员+</a>
                    <div class="uk-dropdown uk-dropdown-navbar uk-dropdown-width-1">
                        <div class="uk-grid uk-dropdown-grid">
                            <div class="uk-width-1-1">
                                <ul class="uk-nav uk-nav-navbar">
                                    <li ><a href="${pageContext.request.contextPath}/category/language">编程语言</a></li>
                                    <li ><a href="${pageContext.request.contextPath}/category/devskills">开发技巧</a></li>
                                    <li ><a href="${pageContext.request.contextPath}/category/codersworld">程序员的世界</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="uk-parent" data-uk-dropdown="{remaintime:100}"><a href="${pageContext.request.contextPath}/category/industry">行业</a></li>
                <li class="" data-uk-dropdown="{remaintime:100}"><a href="${pageContext.request.contextPath}/category/find">发现</a></li>
            </ul>
            <a href="#offcanvas" class="uk-navbar-toggle uk-hidden-large" data-uk-offcanvas=""></a>
            <div class="uk-navbar-brand uk-navbar-center uk-hidden-large"><img src="${pageContext.request.contextPath}/asset/logo/logo.png" width="150" height="40"/></div>
            <div class="uk-navbar-content uk-visible-large uk-float-right" >
                <form class="uk-search" id="search-3" action="${pageContext.request.contextPath}/search" method="get" role="search" >
                    <input class="uk-search-field" type="text" value="" name="s" placeholder="要搜索的内容...">
                </form>
            </div>
        </nav>
    </div>
</header>