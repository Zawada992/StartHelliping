<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<spring:message code="app.description" var="description"/>
<spring:message code="app.name" var="name"/>
<spring:message code="app.add" var="add"/>
<spring:message code="app.fundation" var="fundation"/>
<spring:message code="app.create.fundation" var="create"/>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="../headerLog.jsp" %>
<body>
<section class="login-page">
    <h2>${create}</h2>
    <form:form method="post" modelAttribute="inst">
        <div>
            <h2>${fundation}</h2>

            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path="name" placeholder="${name}"
                                class="form-control form-control-user"/>
                    <form:errors path="name"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path="description" placeholder="${description}"
                                class="form-control form-control-user"/>
                    <form:errors path="description"/>
                </div>
            </div>

        </div>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">${add}</button>
            <a href="/admin/institution" class="btn btn--without-border">Powrót</a>
        </div>
    </form:form>
</section>
</body>
<%@ include file="../footer.jsp" %>
</html>
