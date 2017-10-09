<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
    <title>${single.title} - ATecher|关注科技和程序员的那些事儿</title>
    <jsp:include page="common/head.jsp" flush="true"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/css/components/search.gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/website/custom/custom.css">
</head>
<body>
<jsp:include page="common/navigation.jsp" flush="true"/>
<div class="at-content">
    <div class="uk-container uk-container-center uk-margin-top uk-margin-bottom">
        <div class="uk-grid" >
            <section class="uk-width-medium-1-1 uk-width-large-3-4">
                <div class="custom-panel-title"><ul class="uk-breadcrumb"><li><span>您的位置：</span><a href="${pageContext.request.contextPath}/">首页</a></li><li class="uk-active"><span>${single.title}</span></li></ul></div>
                <article class="uk-grid uk-article" >
                    <div class="uk-width-medium-1-1 ">
                        <article class="article-content">
                            ${single.content}
                        </article>
                    </div>
                </article>
                <hr class="uk-grid-divider">
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
<script type="application/javascript" src="${pageContext.request.contextPath}/asset/website/custom/custom.js"></script>
</body></html>