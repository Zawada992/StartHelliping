<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="pl.coderslab.charity.service.UserService" %>
<%@ page import="pl.coderslab.charity.model.Users" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />

</head>
<body>
    <%
                String name = SecurityContextHolder.getContext().getAuthentication().getName();
                WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
                UserService userService = context.getBean(UserService.class);
                Users currentUser = userService.findByUserEmail(name);
                pageContext.setAttribute("currentUser", currentUser);
    %>


<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">

                <p>Witaj ${currentUser.firstName}</p>

                <ul class="dropdown">
                    <li><a href="/app/user/edit">Profil</a></li>
                    <li><a href="/app/user/profile/change-pass">Zmień Hasło</a></li>
                    <li><a href="/app/donations/${currentUser.id}">Moje zbiórki</a></li>
                    <li>
                        <form action="<c:url value="/logout"/>" method="post">
                            <input type="submit" class="btn-link" value="Wyloguj">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>

                    </li>
                </ul>
            </li>
        </ul>

        <ul>

            <li><a href="/app/donations/${currentUser.id}" class="btn btn--without-border">Lista Darów</a></li>
            <li><a href="/form" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
            <sec:authorize access="hasRole('ADMIN')">
                <li><a href="/admin" class="btn btn--without-border">Panel Admin</a></li>
            </sec:authorize>
        </ul>
    </nav>
