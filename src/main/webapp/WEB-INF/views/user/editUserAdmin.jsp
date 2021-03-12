<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<%@include file="../header.jsp" %>
<div class="container mt-4">
    <div class="row">
        <div class="col-xl-8">
            <center>

                <div class="card mb-4">
                    <div class="card-body">
                        <form:form method="post" modelAttribute="user" action="/admin/user/edit/${user.id}">

                            <form:hidden path="id"/>
                            <form:hidden path="password"/>
                            <form:hidden path="roles"/>
                            <div class="form-group">
                                <td><spring:message code="app.login.firstName"/></td>
                                <form:input path="firstName" class="form-control"/>
                                <form:errors path="firstName"/>
                            </div>
                            <div class="form-group">
                                <td><spring:message code="app.login.lastName"/></td>
                                <form:input path="lastName" class="form-control"/>
                                <form:errors path="lastName"/>
                            </div>
                            <div class="form-group">
                                <td><spring:message code="app.email"/></td>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email"/>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">
                                    <spring:message code="app.edit"/></button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </center>
        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>
