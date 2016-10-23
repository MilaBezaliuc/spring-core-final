<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Party!</title>
    <style type="text/css">
        <%@include file="../resources/style.css" %>
    </style>
</head>

<body>
<h1><img src="${pageContext.request.contextPath}/resources/dance.png" width="50"><a href="../women"> |  Show list of women  | </a>
    <a href="../men">  Show list of men  |</a></h1>
<br>
<hr color="#0b8007">
<br>

<a href="#d-openModal" ><button class="button"><span>ADD NEW DANCE</span></button></a>
<br>
<br>

<!--MAIN-->
<c:if test="${!empty listOfDances}">
    <table>
        <tr>
            <th width="20"></th>
            <th width="100">Dance style</th>
            <th width="100">Man</th>
            <th width="100">Woman</th>
            <th width="30">Delete</th>
        </tr>
        <c:forEach items="${listOfDances}" var="item" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${item.style}</td>
                <td>${item.man.name}</td>
                <td>${item.woman.name}</td>
                <td><a href="/party/delete-dance/${item.id}"><img
                        src="${pageContext.request.contextPath}/resources/delete.png" width="25" height="25"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<!--Add dance block -->
<div id="d-openModal" class="modalDialog">
    <div align="center">
        <a href="${pageContext.request.contextPath}/party" title="Close" class="close">X</a>

        <h2>Add new Dance</h2>
        <form:form action="/party/add-dance" commandName="dance">
            <table style="text-align: left">
                <tr bgcolor="white">
                    <td><form:input path="style"/></td>
                </tr>
                <tr bgcolor="white">
                    <td>
                        <form:select path="woman.id" items="${listOfWomen}" itemValue="id">
                        </form:select>
                        <form:select path="man.id" items="${listOfMen}" itemValue="id">
                        </form:select>
                    </td>
                </tr>
                <tr bgcolor="white">
                    <td colspan="2">
                        <input type="submit"
                               value="<spring:message text="Add dance"/>"/>
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