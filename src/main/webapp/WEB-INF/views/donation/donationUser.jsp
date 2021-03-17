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
                    <a href="/admin/institution/edit/${donation.id}" class="btn btn--without-border">Edytuj</a>
                    <a href="/admin/institution/delete/${donation.id}" class="btn btn--without-border">Usuń</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/form" class="btn btn--without-border">Dodaj dary</a>
    <a href="/admin" class="btn btn--without-border">Powrót</a>


<%--<div class="container-fluid">--%>
<%--    <div class="card shadow mb-4">--%>
<%--        <div class="card-body">--%>
<%--            <div class="table-responsive">--%>
<%--                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">--%>

<%--                    <div class="col-sm-12">--%>
<%--                        <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"--%>
<%--                               role="grid" aria-describedby="dataTable_info" style="width: 100%;">--%>
<%--                            <thead>--%>

<%--                            <tr role="row">--%>
<%--                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1"--%>
<%--                                    colspan="1" aria-sort="ascending"--%>
<%--                                    aria-label="Name: activate to sort column descending" style="width: 40px;">--%>
<%--                                    <spring:message code="app.id"/></th>--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Position: activate to sort column ascending" style="width: 150px;">--%>
<%--                                    <spring:message code="app.name"/></th>--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Position: activate to sort column ascending" style="width: 150px;">--%>
<%--                                    <spring:message code="app.quantity"/></th>--%>
<%--&lt;%&ndash;                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    aria-label="Position: activate to sort column ascending" style="width: 150px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <spring:message code="app.user.id"/></th>&ndash;%&gt;--%>

<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Salary: activate to sort column ascending" style="width: 150px; ">--%>
<%--                                    <spring:message code="app.action"/></th>--%>

<%--                            </thead>--%>
<%--                            <tfoot>--%>

<%--                            <tr>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.id"/></th>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.name"/></th>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.quantity"/></th>--%>
<%--&lt;%&ndash;                                <th rowspan="1" colspan="1"><spring:message code="app.user.id"/></th>&ndash;%&gt;--%>

<%--                                <th rowspan="1" colspan="1"><spring:message code="app.action"/></th>--%>

<%--                            </tr>--%>

<%--                            </tfoot>--%>
<%--                            <tbody>--%>
<%--                            <c:forEach items="${donation}" var="donation">--%>
<%--                                <tr role="row" class="odd">--%>
<%--                                    <td><c:out value="${donation.id}"/></td>--%>
<%--                                    <td><c:out value="${donation.institution.name}"/></td>--%>
<%--                                    <td><c:out value="${donation.quantity}"/></td>--%>
<%--&lt;%&ndash;                                    <td><c:out value="${donation.user.id}"/></td>&ndash;%&gt;--%>

<%--                                    <td>--%>
<%--                                        <a href='<c:url value="/app/donation/details/${donation.id}"/>'--%>
<%--                                           class="btn btn-primary"--%>
<%--                                           style="background-color:#FF0000; border-color:#FF0000;color:#ffffff"><spring:message--%>
<%--                                                code="app.details"/></a>--%>
<%--                                    </td>--%>

<%--                                </tr>--%>
<%--                            </c:forEach>--%>

<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%@ include file="../footer.jsp" %>
</body>
</html>
