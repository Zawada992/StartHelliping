<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 15.03.2021
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../headerAdmin.jsp" %>

<section id="adminsAll" class="steps">
    <h2>Lista administratorów</h2>
    <table class="custom-table">
        <thead>
        <tr class="custom-tr-dark">
            <th class="custom-th">Id</th>
            <th>Imię i Nazwisko</th>
            <th>Email</th>
            <th>Role</th>
            <th>Akcja</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${admins}" var="admin">
            <tr class="custom-tr">
                <td class="custom-td">${admin.id}</td>
                <td class="custom-td">${admin.firstName} ${admin.lastName}</td>
                <td class="custom-td">${admin.email}</td>
                <td class="custom-td">
                    <c:forEach items="${admin.roles}" var="role">
                        <c:if test='${role.roleType.toString().equals("ROLE_ADMIN")}'>
                            ADMIN,
                        </c:if>
                        <c:if test='${role.roleType.toString().equals("ROLE_USER")}'>
                            USER,
                        </c:if>
                    </c:forEach>
                </td>
                <td class="custom-td">
                    <a href="/admin/user/edit/${admin.id}" class="btn btn--without-border">Edytuj</a>
                    <a href="/admin/take-off-permissions/${admin.id}" class="btn btn--without-border">Zdejmij uprawnienia admina</a>
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