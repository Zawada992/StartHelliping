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
                <h2>Edytuj ${users.firstName} ${users.lastName}</h2>
                <div class="card-body">
                    <form:form method="post" modelAttribute="users" action="/app/user/update">

                        <form:hidden path="id"/>
                        <form:hidden path="password"/>
                        <form:hidden path="roles"/>
                        <div class="form-group">
                            <form:input path="firstName" class="form-control"/>
                            <form:errors path="firstName"/>
                        </div>
                        <div class="form-group">
                            <form:input path="lastName" class="form-control"/>
                            <form:errors path="lastName"/>
                        </div>

                        <div class="form-group">
                            <form:input path="email" class="form-control "/>
                            <form:errors path="email"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                <spring:message code="app.edit"/></button>
                            <a href="/app/home" class="btn btn--without-border">Powrót</a>
                        </div>
                        <div class="form-group form-group--50">

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
