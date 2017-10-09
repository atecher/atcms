<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="uk-panel at-panel-tag uk-margin-bottom">
    <h3 class="uk-panel-title">热门标签</h3>
    <ul class="uk-list">
        <c:forEach items="${tags}" var="tag"> <li><a  href="${pageContext.request.contextPath}/tag/${tag.code}">${tag.tag}(${tag.counts})</a></li></c:forEach>
    </ul>
</div>