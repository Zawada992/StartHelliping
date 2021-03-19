<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 10.03.2021
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../headerAdmin.jsp" %>

<section id="users" class="steps">
    <h2>Lista użytkowników</h2>
    <table class="custom-table">
        <thead>
        <tr class="custom-tr-dark">
            <th class="custom-th">Id</th>
            <th>Imię i Nazwisko</th>
            <th>Email</th>
            <th>Role</th>
            <th>Odblokowany</th>
            <th>Akcja</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${user}" var="user">
            <tr class="custom-tr">
                <td class="custom-td">${user.id}</td>
                <td class="custom-td">${user.firstName} ${user.lastName}</td>
                <td class="custom-td">${user.email}</td>
                <td class="custom-td">
                    <c:forEach items="${user.roles}" var="role">
                        <c:if test='${role.roleType.toString().equals("ROLE_ADMIN")}'>
                            ADMIN,
                        </c:if>
                        <c:if test='${role.roleType.toString().equals("ROLE_USER")}'>
                            USER,
                        </c:if>
                    </c:forEach>
                </td>
                <td class="custom-td">${user.enabled}</td>
                <td class="custom-td">
                    <a href="/admin/user/edit/${user.id}" class="btn btn--without-border">Edytuj</a>
                    <a href="/admin/user/delete/${user.id}" class="btn btn--without-border">Usuń</a>
                    <c:if test="${user.enabled}">
                        <a href="/admin/user/switch-enable/${user.id}" class="btn btn--without-border">Zablokuj</a>
                    </c:if>
                    <c:if test="${!user.enabled}">
                        <a href="/admin/user/switch-enable/${user.id}" class="btn btn--without-border">Odblokuj</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/admin" class="btn btn--large">Powrót</a>
</section>



<%@ include file="../footer.jsp" %>
</body>
</html>
