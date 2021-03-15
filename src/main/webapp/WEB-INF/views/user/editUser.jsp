<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../headerLog.jsp" %>
<body>

<div class="container mt-4">
    <!-- Account page navigation-->
    <nav class="nav nav-borders">
        <a class="nav-link active ml-0" href="<c:url value="/app/user/edit"/>">Profile</a>
        <a class="nav-link" href="<c:url value="/app/security"/>">Security</a>
    </nav>
    <hr class="mt-0 mb-4">
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

                        </form:form>
                    </div>
                </div>
            </div>
        </center>
    </div>
</div>

</body>
<%@include file="../footer.jsp" %>
</html>
