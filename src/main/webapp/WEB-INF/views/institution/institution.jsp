<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../headerAdmin.jsp" %>
<section id="institutions" class="steps">

    <h2>Lista fundacji</h2>

    <table class="custom-table">
        <thead>
        <tr class="custom-tr-dark">
            <th class="custom-th">Id</th>
            <th>Nazwa</th>
            <th>Cel</th>
            <th>Akcja</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${institution}" var="institution">
            <tr class="custom-tr">
                <td class="custom-td">${institution.id}</td>
                <td class="custom-td">${institution.name}</td>
                <td class="custom-td">${institution.description}</td>
                <td class="custom-td">
                    <a href="/admin/institution/edit/${institution.id}" class="btn btn--without-border">Edytuj</a>
                    <a href="/admin/institution/delete/${institution.id}" class="btn btn--without-border">Usuń</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/admin/institution/add" class="btn btn--large">Dodaj fundację</a>
    <a href="/admin" class="btn btn--large">Powrót</a>

</section>

    <%@ include file="../footer.jsp" %>
</body>
</html>