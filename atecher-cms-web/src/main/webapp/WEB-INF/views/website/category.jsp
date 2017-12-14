<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
    <title>${category.category_name} - ATecher | 关注科技和程序员的那些事儿</title>
    <meta name="keywords" content=" ${keywords}"/>
    <meta name="description" content="${description}"/>
    <jsp:include page="common/head.jsp" flush="true"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/search.gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/sticky.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/custom/custom.css">
</head>
<body>
<jsp:include page="common/navigation.jsp" flush="true"/>
<div class="at-content">
    <div class="uk-container uk-container-center uk-margin-top uk-margin-bottom">
        <div class="uk-grid" >
            <section class="uk-width-medium-1-1 uk-width-large-3-4">
                <div class="custom-panel-title"><ul class="uk-breadcrumb"><li><span>您的位置：</span>
                    <a href="${pageContext.request.contextPath}/">首页</a></li><c:forEach items="${categoryNav}" var="nav"><li class="uk-active"><a href="${pageContext.request.contextPath}/category/${nav.category_path}">${nav.category_name}</a></li></c:forEach></ul></div>
                <c:forEach items="${articleList}" var="article">
                    <article class="uk-grid uk-article" >
                        <div class="uk-width-medium-1-4 uk-width-small-1-3 sidebar">
                            <a class="thumbnail" href="${pageContext.request.contextPath}/article/${article.article_id}"><img width="660" height="400" alt="${article.title}" src="${article.cover_path}" onerror="this.src='${pageContext.request.contextPath}/asset/website/custom/images/default.png'"></a>
                        </div>
                        <div class="uk-width-medium-3-4 uk-width-small-2-3">
                            <h2><a href="${pageContext.request.contextPath}/article/${article.article_id}">${article.title}</a></h2>
                            <p class="summary">${article.summary}</p>
                            <p class="uk-article-meta"><span><a class="at-category" href="${pageContext.request.contextPath}/category/${article.category_path}">${article.category_name}</a></span> <span><i class="uk-icon-user"></i>${article.author}</span> <span><i class="uk-icon-calendar"></i><fmt:formatDate value="${article.create_time}" pattern="yyyy.MM.dd"/></span> <span><i class="uk-icon-eye"></i> ${article.total_clicks}次阅读</span></p>
                        </div>
                    </article>
                    <hr class="uk-grid-divider">
                </c:forEach>
                <ul class="uk-pagination uk-margin-bottom" data-uk-pagination="{items:${totalRows}, itemsOnPage:${displayRows}, currentPage:${page-1}}" data-base-url="${pageContext.request.contextPath}/category/${menuId}"></ul>
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
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/sticky.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/js/components/pagination.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/custom/custom.js"></script>
</body>
</html>