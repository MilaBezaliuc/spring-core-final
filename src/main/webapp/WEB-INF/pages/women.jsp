<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of women</title>
    <style type="text/css">
        <%@include file="../resources/style.css" %>
    </style>
</head>
<body>

<h1><a href="/party"><img src="${pageContext.request.contextPath}/resources/dance.png" width="50"> <--- Back to the
    party | </a>
    <a href="../men"> Show list of men |</a></h1>
<br>
<hr color="#0b8007">
<br>

<a href="#w-openModal">
    <button class="button"><span>ADD WOMAN</span></button>
</a>
<br>
<br>
<table>
    <th width="20"></th>
    <th width="190">Lady's name</th>
    <th width="30">Edit</th>
    <th width="30">Delete</th>

    <c:forEach items="${listOfWomen}" var="v" varStatus="status">
        <tr>
            <td>${status.index+1}</td>
            <td>${v.name}</td>
            <td><a href="/women/edit-woman/${v.id}#w-openModal"><img
                    src="${pageContext.request.contextPath}/resources/edit.ico" width="25" height="25"></a></td>
            <td><a href="/women/delete-woman/${v.name}"><img
                    src="${pageContext.request.contextPath}/resources/remove-female.png" width="25" height="25"></a>
            </td>
        </tr>
    </c:forEach>
</table>

<%--Add woman block --%>
<div id="w-openModal" class="modalDialog">
    <div align="center">
        <a href="${pageContext.request.contextPath}/women" title="Close" class="close">X</a>

        <c:if test="${empty woman.name}"><h2>Add new woman</h2></c:if>
        <c:if test="${!empty woman.name}"><h2>Edit woman's name</h2></c:if>

        <c:url var="addAction" value="/women/add-woman"/>

        <form:form action="${addAction}" modelAttribute="woman">
            <table style="text-align: left">
                <c:if test="${!empty woman.name}">
                    <tr bgcolor="white">
                        <td>
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/></td>
                    </tr>
                </c:if>

                <tr bgcolor="white">
                    <td><form:input path="name"/></td>
                </tr>

                <tr bgcolor="white">
                    <td colspan="2">
                        <c:if test="${!empty woman.name}">
                            <input type="submit"
                                   value="<spring:message text="Edit"/>"/>
                        </c:if>

                        <c:if test="${empty woman.name}">
                            <input type="submit"
                                   value="<spring:message text="Add"/>"/>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</div>

<!-- Footer -->
<div style=" position: absolute; bottom: 0; width: 99%; height: 30px; background-color: #0b8007; text-align:center;">
    <span style="line-height: 30px; font-size: small; color: #c2f7b5">PartyTime &copy; Mila Bezaliuc
        2016.</span>
</div>

</body>
</html>
