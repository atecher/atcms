<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
    <title>ATecher | 关注科技和程序员的那些事儿</title>
    <meta name="keywords" content=" ${keywords}"/>
    <meta name="description" content="${description}"/>
    <jsp:include page="common/head.jsp" flush="true"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/search.gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/sticky.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/slideshow.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/slidenav.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/custom/custom.css">
    <link href="http://cdn.bootcss.com/animate.css/3.5.1/animate.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="common/navigation.jsp" flush="true"/>
<div class="at-content">
    <div class="uk-container uk-container-center uk-margin-top uk-margin-bottom">
        <div class="uk-grid" >
            <section class="uk-width-medium-1-1 uk-width-large-3-4">
                <article class="uk-grid uk-article uk-visible-large">
                    <div class="uk-width-1-1 uk-slidenav-position" data-uk-slideshow="{animation: 'random-fx',autoplay:true}">
                        <ul class="uk-slideshow" >
                            <c:forEach items="${sticky}" var="article">
                                <li>
                                    <div class="uk-panel uk-panel-box at-slide-detail">
                                        <div class="uk-grid">
                                            <div class="uk-width-medium-2-5 uk-width-small-1-3">
                                                <img src="${article.cover_path}" alt="${article.title}" width="320" height="240" onerror="this.src='${pageContext.request.contextPath}/asset/website/custom/images/default.png'"/>
                                            </div>
                                            <div class="uk-width-medium-3-5 uk-width-small-2-3">
                                                <h2 class="uk-panel-title"><a href="${pageContext.request.contextPath}/article/${article.article_id}">${article.title}</a></h2>
                                                <p>${article.summary}</p>
                                                <a class="uk-button uk-button-primary sliderlink uk-float-right" href="${pageContext.request.contextPath}/article/${article.article_id}">阅读全部</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                            </c:forEach>
                        </ul>
                        <a href="#" class="uk-slidenav uk-slidenav-contrast uk-slidenav-previous" data-uk-slideshow-item="previous"></a>
                        <a href="#" class="uk-slidenav uk-slidenav-contrast uk-slidenav-next" data-uk-slideshow-item="next"></a>
                    </div>
                </article>
                <div class="uk-panel">
                    <h3 class="uk-panel-title">新鲜货色</h3>
                    <c:forEach items="${articleList}" var="article">
                        <article class="uk-grid uk-article bounceInLeft animated" >
                            <div class="uk-width-medium-1-4 uk-width-small-1-3 sidebar">
                                <a class="thumbnail" href="${pageContext.request.contextPath}/article/${article.article_id}"><img width="660" height="400" alt="${article.title}" src="${article.cover_path}" onerror="this.src='${pageContext.request.contextPath}/asset/website/custom/images/default.png'"></a>
                            </div>
                            <div class="uk-width-medium-3-4 uk-width-small-2-3">
                                <h2><a href="${pageContext.request.contextPath}/article/${article.article_id}">${article.title}</a></h2>
                                <p class="summary">${article.summary}</p>
                                <p class="uk-article-meta"><span><a class="at-category" href="${pageContext.request.contextPath}/category/${article.category_path}">${article.category_name}</a></span><span><i class="uk-icon-user"></i>${article.author}</span> <span><i class="uk-icon-calendar"></i><fmt:formatDate value="${article.create_time}" pattern="yyyy.MM.dd"/></span> <span><i class="uk-icon-eye"></i> ${article.total_clicks}次阅读</span></p>
                            </div>
                        </article>
                        <hr class="uk-grid-divider">
                    </c:forEach>
                </div>
                <ul class="uk-pagination uk-margin-bottom" data-uk-pagination="{items:${totalRows}, itemsOnPage:${displayRows}, currentPage:${page-1}}" data-base-url="${pageContext.request.contextPath}"></ul>
            </section>
            <aside class="uk-width-large-1-4">
                <jsp:include page="slide/spec.jsp" flush="true"/>
                <jsp:include page="slide/hots.jsp" flush="true"/>
                <jsp:include page="slide/read.jsp" flush="true"/>
                <jsp:include page="slide/tags.jsp" flush="true"/>
            </aside>
        </div>

    </div>
</div>
<jsp:include page="common/foot.jsp" flush="true"/>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/sticky.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/slideshow.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/slideshow-fx.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/pagination.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/custom/custom.js"></script>
</body>
</html>