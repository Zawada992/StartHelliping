<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../headerLog.jsp" %>
<body>


<div class="row">
    <center>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form:form method="post" modelAttribute="users" action="/app/user/update">

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
                            <form:input path="email" class="form-control "/>
                            <form:errors path="email"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                <spring:message code="app.edit"/></button>
                        </div>
                        <div class="form-group form-group--50">
                            <a href="/app/home" class="btn btn--without-border">Powrót</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </center>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>
