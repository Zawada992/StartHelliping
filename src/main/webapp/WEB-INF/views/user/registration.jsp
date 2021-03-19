<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../header.jsp" %>
<spring:message code="app.login.registration" var="register"/>
<spring:message code="app.login.firstName" var="firstName"/>
<spring:message code="app.login.lastName" var="lastName"/>
<spring:message code="app.login.userName" var="userName"/>
<spring:message code="app.login.password" var="password"/>
<spring:message code="app.login.password2" var="password2"/>
<spring:message code="app.register.email" var="email"/>
<spring:message code="app.register.info" var="info"/>
<spring:message code="app.login.loginButton" var="logs"/>



    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Załóż konto
            </h1>
        </div>
    </div>
</header>
<section class="login-page">

    <form:form method="post" modelAttribute="user">
        <div>
            <h2>${register}</h2>

            <div class="form-group row">
                <div class="col-first">
                    <form:input path="firstName" placeholder="${firstName}"
                                class="form-control form-control-user"/>
                    <form:errors path="firstName"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-last">
                    <form:input path="lastName" placeholder="${lastName}"
                                class="form-control form-control-user"/>
                    <form:errors path="lastName"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path="email" placeholder="${email}"
                                class="form-control form-control-user"/>
                    <form:errors path="email"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:password path="password"  placeholder="${password}"
                                class="form-control form-control-user"/>
                    <form:errors path="password"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" name="password2" placeholder="${password2}"
                           class="form-control form-control-user"/>
                    <form:errors path="password"/>
                </div>
            </div>
        </div>
        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">${logs}</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>
<%@ include file="../footer.jsp" %>