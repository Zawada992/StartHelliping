<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../headerAdmin.jsp" %>
<section id="donation" class="steps">
    <h2>Lista Darów</h2>

    <table class="custom-table">
        <thead>
        <tr class="custom-tr-dark">
            <th class="custom-th">Id</th>
            <th>Fundacja</th>
            <th>Ilość worków</th>
            <th>Akcja</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${donation}" var="donation">
            <tr class="custom-tr">
                <td class="custom-td">${donation.id}</td>
                <td class="custom-td">${donation.institution.name}</td>
                <td class="custom-td">${donation.quantity}</td>
                <td class="custom-td">
                    <a href="/donation/details/${donation.id}" class="btn btn--without-border">Szczegóły</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/form" class="btn btn--without-border">Dodaj dary</a>
    <a href="/admin" class="btn btn--without-border">Powrót</a>


    <%@ include file="../footer.jsp" %>
</body>
</html>
