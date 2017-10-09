<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="uk-panel at-recommend">
    <h3 class="uk-panel-title">特别推荐</h3>
    <c:forEach items="${specCommend}" var="sc">
        <a class="style01" href="${pageContext.request.contextPath}/article/${sc.article_id}"  target="_blank">
            <h2 class="at-rec-title">${sc.title}</h2>
            <p class="at-rec-summary">${sc.summary} </p>
        </a>
    </c:forEach>
</div>