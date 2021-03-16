<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 05.03.2021
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../headerAdmin.jsp" %>


<div class="contact" id="contact">
    <h2>Edytuj ${user.firstName} ${user.lastName}</h2>

    <form:form modelAttribute="user" cssClass="form--contact" method="post" action="/admin/user/edit">
        <form:hidden path="id"/>
        <div class="form-group form-group--50">
            <form:input path="firstName"/>
        </div>
        <div class="form-group form-group--50">
            <form:input path="lastName"/>
        </div>
        <div class="form-group">
            <form:input path="email"/>
        </div>
        <div class="form-group form-group--50">

            <c:forEach items="${roles}" var="role">
                <input id="roles${role.id}" type="checkbox" name="roles" value="${role.id}">
                <label for="roles${role.id}">${role.roleType.toString()}</label>
            </c:forEach>
        </div>
        <div class="form-group form-group--50"></div>
        <form:hidden path="enabled"/>


        <button class="btn" type="submit">Edytuj</button>
        <div class="form-group form-group--50">
            <a href="/admin" class="btn btn--without-border">Powrót</a>
        </div>
    </form:form>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>
