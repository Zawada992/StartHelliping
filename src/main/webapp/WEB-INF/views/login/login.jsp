
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<spring:message code="app.login.loginButton" var="loginButton"/>
<spring:message code="app.email" var="email"/>
<spring:message code="app.login.password" var="password"/>
<spring:message code="app.login.userName" var="username"/>
<spring:message code="app.login.rememberMe" var="rememberMe"/>
<spring:message code="app.login.createAccount" var="createAccount"/>
<spring:message code="app.login" var="login"/>

<section class="login-page">
    <h2><spring:message code="app.login.logs"/></h2>
    <form class="user" method="post">
        <div class="form-group">
            <input type="text" name="email" placeholder="${email}" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="${password}" />
            <a href="/register/forgot-pass" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/user/add" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">${loginButton}</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</section>
<%@ include file="../footer.jsp" %>