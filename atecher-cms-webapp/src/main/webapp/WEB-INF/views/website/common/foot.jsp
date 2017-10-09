<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<footer class="at-footer">
    <div class="uk-container uk-container-center uk-text-center">
        <ul class="uk-subnav uk-subnav-line uk-flex-center">
            <li><a href="${pageContext.request.contextPath}/about"> 关于我们</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">联系我们</a></li>
            <li><a href="${pageContext.request.contextPath}/notice">网站公告</a></li>
        </ul>
        <div class="uk-panel">
            <p> Copyright © 2015 Atecher All Rights Reserved 备案号：京ICP备15011567号</p>
            <p><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1259916199'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1259916199' type='text/javascript'%3E%3C/script%3E"));</script></p>
        </div>
    </div>
</footer>
<div id="offcanvas" class="uk-offcanvas">
    <div class="uk-offcanvas-bar">
        <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon uk-nav-offcanvas" data-uk-nav="{multiple:true}">
            <li class="uk-nav-header"></li>
            <li><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/category/openSource">开源</a></li>
            <li class="uk-parent .uk-open"aria-expanded="true"><a href="#">程序员</a>
                <ul class="uk-nav-sub">
                    <li><a href="${pageContext.request.contextPath}/category/programmer">程序员</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/language">编程语言</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/devskills">开发技巧</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/codersworld">程序员的世界</a></li>
               </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/category/industry">行业</a></li>
            <li><a href="${pageContext.request.contextPath}/category/find">发现</a></li>
        </ul>

    </div>
</div>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/uikit.min.js"></script>
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "//hm.baidu.com/hm.js?321388b21c43bc5a2ac615d12925c33c";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>