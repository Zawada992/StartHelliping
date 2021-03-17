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

    <div class="form-group form-group--50">
        <a href="/admin" class="btn btn--without-border">Powrót</a>
    </div>



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
<%--                                    aria-label="Name: activate to sort column descending">--%>
<%--                                    <spring:message code="app.id"/></th>--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Position: activate to sort column ascending">--%>
<%--                                    <spring:message code="app.login.firstName"/></th>--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Position: activate to sort column ascending">--%>
<%--                                    <spring:message code="app.login.lastName"/></th>--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Office: activate to sort column ascending">--%>
<%--                                    <spring:message code="app.email"/></th>--%>
<%--                                <sec:authorize access="hasAnyRole('ADMIN')">--%>
<%--                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"--%>
<%--                                    aria-label="Salary: activate to sort column ascending">--%>
<%--                                    <spring:message code="app.action"/></th>--%>
<%--                                </sec:authorize>--%>
<%--                            </thead>--%>
<%--                            <tfoot>--%>

<%--                            <tr>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.id"/></th>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.login.firstName"/></th>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.login.lastName"/></th>--%>
<%--                                <th rowspan="1" colspan="1"><spring:message code="app.email"/></th>--%>
<%--                                <sec:authorize access="hasRole('ADMIN')">--%>
<%--                                    <th rowspan="1" colspan="1"><spring:message code="app.action"/></th>--%>
<%--                                </sec:authorize>--%>
<%--                            </tr>--%>

<%--                            </tfoot>--%>
<%--                            <tbody>--%>

<%--                            <c:forEach items="${admins}" var="user">--%>
<%--                                <tr role="row" class="odd">--%>
<%--                                    <td><c:out value="${user.id}"/></td>--%>
<%--                                    <td><c:out value="${user.firstName}"/></td>--%>
<%--                                    <td><c:out value="${user.lastName}"/></td>--%>
<%--                                    <td><c:out value="${user.email}"/></td>--%>

<%--                                    <sec:authorize access="hasRole('ADMIN')">--%>


<%--                                        <td>--%>
<%--                                            <a href='<c:url value="/admin/user/edit/${user.id}"/>'--%>
<%--                                               class="btn btn-primary"--%>
<%--                                               style="background-color:#0000ff; border-color:#0000ff;color:#ffffff"><spring:message--%>
<%--                                                    code="app.edit"/></a>--%>
<%--                                            <a href='<c:url value="/admin/user/delete/${user.id}"/>'--%>
<%--                                               class="btn btn-primary"--%>
<%--                                               style="background-color:#FF0000; border-color:#FF0000;color:#ffffff"><spring:message--%>
<%--                                                    code="app.delete"/></a>--%>
<%--                                        </td>--%>
<%--                                    </sec:authorize>--%>
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
<%--<%@ include file="../footer.jsp" %>--%>
</body>
</html>