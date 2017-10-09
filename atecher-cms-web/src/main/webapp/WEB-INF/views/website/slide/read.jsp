<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="uk-panel at-panel-hot uk-width-medium-none">
    <h3 class="uk-panel-title">推荐阅读</h3>
    <ol class="uk-list">
        <c:forEach items="${readCommend}" var="hot" varStatus="status"><li><span class="num">${status.count}</span><p class="title"><a title="${hot.title}"  href="${pageContext.request.contextPath}/article/${hot.article_id}">${hot.title}</a></p></li></c:forEach>
    </ol>
</div>