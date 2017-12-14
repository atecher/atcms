<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
    <title>${article.title} - ATecher | 关注科技和程序员的那些事儿</title>
    <meta name="keywords" content=" ${article.keywords}"/>
    <meta name="description" content="${article.summary}"/>
    <jsp:include page="common/head.jsp" flush="true"/>
    <script>
        var baseUrl="${pageContext.request.contextPath}";
    </script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/search.gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/custom/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/custom/share_style.css">
</head>
<body>
<jsp:include page="common/navigation.jsp" flush="true"/>
<div class="at-content">
    <div class="uk-container uk-container-center uk-margin-top uk-margin-bottom">
        <div class="uk-grid" >
            <section class="uk-width-medium-1-1 uk-width-large-3-4">
                <div class="custom-panel-title"><ul class="uk-breadcrumb"><li><span>您的位置：</span><a href="${pageContext.request.contextPath}/">首页</a></li><li class="uk-active"><a href="${pageContext.request.contextPath}/category/${article.category_path}" title="查看${article.category_name}中的全部文章"><span>${article.category_name}</span></a></li></ul></div>
                <article class="uk-grid uk-article" >
                    <div class="uk-width-medium-1-1 ">
                        <h1><a>${article.title}</a></h1>
                        <p class="uk-article-meta"><span><i class="uk-icon-user"></i>${article.author}</span> <span><i class="uk-icon-calendar"></i><fmt:formatDate value="${article.create_time}" pattern="yyyy.MM.dd"/></span> <span><i class="uk-icon-eye"></i>${article.total_clicks}次阅读</span></p>
                        <article class="article-content">
                            ${article.content}
                        </article>
                    </div>
                </article>
                <footer class="article-footer">
                    <div class="article-tags">继续浏览有关 <c:forEach items="${article.tags}" var="tag"><a  href="${pageContext.request.contextPath}/tag/${tag.code}"  rel="tag">${tag.tag}</a></c:forEach>的文章</div>
                </footer>
                <hr class="uk-grid-divider">
                <nav class="article-nav">
                    <c:if test="${fn:length(preNext)>0}">
                        <c:forEach items="${preNext}" var="pn">
                            <c:if test="${pn.pre eq true}"><c:set var="pre" value="${pn}" scope="page"/></c:if>
                            <c:if test="${pn.next eq true}"><c:set var="next" value="${pn}" scope="page"/></c:if>
                        </c:forEach>
                        <span class="uk-width-medium-1-1 uk-width-large-1-2 pre">上一篇：<c:choose><c:when test="${not empty pre}"><a href="${pageContext.request.contextPath}/article/${pre.article_id}" rel="prev">${pre.title}</a></c:when><c:otherwise>没有啦</c:otherwise></c:choose></span>
                        <span class="uk-width-medium-1-1 uk-width-large-1-2 next">下一篇：<c:choose><c:when test="${not empty next}"><a href="${pageContext.request.contextPath}/article/${next.article_id}" rel="next">${next.title}</a></c:when><c:otherwise>没有啦</c:otherwise></c:choose></span>
                    </c:if>
                </nav>
                <div class="bdsharebuttonbox">
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                    <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="#" class="bds_more" data-cmd="more"></a>
                </div>
                <!--高速版-->
                <div id="SOHUCS"></div>
                <script charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/changyan.js" ></script>
                <script type="text/javascript">
                    window.changyan.api.config({
                        appid: 'cyrbtS4K4',
                        conf: 'prod_84542c496902ff016781c3cbad0b84bc'
                    });
                </script>

            </section>
            <aside class="uk-width-large-1-4">
                <jsp:include page="slide/hots.jsp" flush="true"/>
                <jsp:include page="slide/read.jsp" flush="true"/>
                <jsp:include page="slide/tags.jsp" flush="true"/>
            </aside>
        </div>

    </div>
</div>
<jsp:include page="common/foot.jsp" flush="true"/>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/custom/custom.js"></script>
</body></html>