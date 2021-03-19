<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="../headerAdmin.jsp" %>

<section id="donations" class="steps">
    <h2>Lista darów</h2>

    <table class="custom-table">
        <thead>
        <tr class="custom-tr-dark">
            <th class="custom-th">Ulica</th>
            <th>Miasto</th>
            <th>Kategorie</th>
            <th>Data</th>
            <th>Godzina</th>
            <th>Status</th>
            <th>Akcja</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${donation}" var="donation">
            <tr class="custom-tr">
                <td class="custom-td">${donation.street}</td>
                <td class="custom-td">${donation.city}</td>
                <td class="custom-td">
                    <c:forEach items="${donation.categories}" var="category">
                        ${category.name}
                    </c:forEach>
                </td>
                <td class="custom-td">${donation.pickUpDate}</td>
                <td class="custom-td">${donation.pickUpTime}</td>
                <td class="custom-td">
                    <c:if test="${donation.taken}">
                        Odebrane
                    </c:if>
                    <c:if test="${!donation.taken}">
                        Nieodebrane
                    </c:if>
                </td>
                <td class="custom-td">
                    <c:if test="${!donation.taken}">
                        <a href="/admin/donations/mark-as-taken/${donation.id}" class="btn btn--without-border">Oznacz jako odebrane</a>
                    </c:if>
                    <a href="/donation/details/${donation.id}" class="btn btn--without-border">Szczegóły</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/form" class="btn btn--large">Przekaż dary</a>
    <a href="/admin" class="btn btn--large">Powrót</a>
</section>
    <%@ include file="../footer.jsp" %>
</body>
</html>
