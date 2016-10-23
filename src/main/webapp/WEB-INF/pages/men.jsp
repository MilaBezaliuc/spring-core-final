<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Men's list</title>
    <style type="text/css">
        <%@include file="../resources/style.css" %>
    </style>
</head>
<body>

<h1><a href="/party"><img src="${pageContext.request.contextPath}/resources/dance.png" width="50"> <--- Back to the
    party</a>
    <a href="../women"> | Show list of women | </a></h1>
<br>
<hr color="#0b8007">
<br>
<a href="#m-openModal">
    <button class="button"><span>ADD MAN</span></button>
</a>
<br>
<br>
<table>
    <th width="20"></th>
    <th width="190">Man's name</th>
    <th width="30">Edit</th>
    <th width="30">Delete</th>
    <c:forEach items="${listOfMen}" var="v" varStatus="status">
        <tr>
            <td width="">${status.index+1}</td>
            <td width="190">${v.name}</td>
            <td width="30"><a href="men/edit-man/${v.id}#m-openModal"><img
                    src="${pageContext.request.contextPath}/resources/edit.ico" width="25" height="25"></a></td>
            <td width="30"><a href="/men/delete-man/${v.name}"><img
                    src="${pageContext.request.contextPath}/resources/remove-male.png" width="25" height="25"></a></td>
        </tr>
    </c:forEach>
</table>

<%--Add man block --%>
<div id="m-openModal" class="modalDialog">
    <div align="center">
        <a href="${pageContext.request.contextPath}/men" title="Close" class="close">X</a>

        <c:if test="${empty man.name}"><h2>Add new man</h2></c:if>
        <c:if test="${!empty man.name}"><h2>Edit man's name</h2></c:if>

        <c:url var="addAction" value="/men/add-man"/>

        <form:form action="${addAction}" modelAttribute="man">
            <table style="text-align: left">
                <c:if test="${!empty man.name}">
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
                        <c:if test="${!empty man.name}">
                            <input type="submit"
                                   value="<spring:message text="Edit"/>"/>
                        </c:if>

                        <c:if test="${empty man.name}">
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
