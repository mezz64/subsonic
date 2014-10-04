<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<%@ include file="include.jsp" %>

<%--
Creates HTML for displaying the rating stars.
PARAMETERS
  path: Album path. May be null if readonly.
  readonly: Whether rating can be changed.
  rating: The rating, an integer from 0 (no rating), through 10 (lowest rating), to 50 (highest rating).
--%>

<c:forEach var="i" begin="1" end="5">

    <sub:url value="setRating.view" var="ratingUrl">
        <sub:param name="path" value="${param.path}"/>
        <sub:param name="action" value="rating"/>
        <sub:param name="rating" value="${i}"/>
    </sub:url>

    <c:choose>
        <c:when test="${param.rating ge i}">
            <spring:theme code="ratingOnImage" var="imageUrl"/>
        </c:when>
        <c:otherwise>
            <spring:theme code="ratingOffImage" var="imageUrl"/>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${param.readonly}">
            <img src="${imageUrl}" style="margin-right:-3px" alt="" title="<fmt:message key="rating.rating"/> ${param.rating}">
        </c:when>
        <c:otherwise>
            <a href="${ratingUrl}"><img src="${imageUrl}" style="margin-right:-3px" alt="" title="<fmt:message key="rating.rating"/> ${i}"></a>
        </c:otherwise>
    </c:choose>

</c:forEach>

<sub:url value="setRating.view" var="clearRatingUrl">
    <sub:param name="path" value="${param.path}"/>
    <sub:param name="action" value="rating"/>
    <sub:param name="rating" value="0"/>
</sub:url>

<c:if test="${not param.readonly}">
    | <a href="${clearRatingUrl}"><img src="<spring:theme code="clearRatingImage"/>" alt="" title="<fmt:message key="rating.clearrating"/>" style="margin-left:-3px; margin-right:5px"></a>
</c:if>
