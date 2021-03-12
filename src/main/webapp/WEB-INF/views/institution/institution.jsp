<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../headerLog.jsp" %>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

                    <div class="col-sm-12">
                        <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"
                               role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                            <thead>

                            <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1"
                                    colspan="1" aria-sort="ascending"
                                    aria-label="Name: activate to sort column descending" style="width: 40px;">
                                    <spring:message code="app.id"/></th>
                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Position: activate to sort column ascending" style="width: 150px;">
                                    <spring:message code="app.name"/></th>
                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Position: activate to sort column ascending" style="width: 150px;">
                                    <spring:message code="app.description"/></th>

                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Salary: activate to sort column ascending" style="width: 150px; ">
                                    <spring:message code="app.action"/></th>

                            </thead>
                            <tfoot>

                            <tr>
                                <th rowspan="1" colspan="1"><spring:message code="app.id"/></th>
                                <th rowspan="1" colspan="1"><spring:message code="app.name"/></th>
                                <th rowspan="1" colspan="1"><spring:message code="app.description"/></th>

                                <th rowspan="1" colspan="1"><spring:message code="app.action"/></th>

                            </tr>

                            </tfoot>
                            <tbody>
                            <c:forEach items="${institution}" var="inst">
                                <tr role="row" class="odd">
                                    <td><c:out value="${inst.id}"/></td>
                                    <td><c:out value="${inst.name}"/></td>
                                    <td><c:out value="${inst.description}"/></td>

                                        <td>
                                            <a href='<c:url value="/admin/institution/edit/${inst.id}"/>'
                                               class="btn btn-primary"
                                               style="background-color:#0000ff; border-color:#0000ff;color:#ffffff"><spring:message
                                                    code="app.edit"/></a>
                                            <a href='<c:url value="/admin/institution/delete/${inst.id}"/>'
                                               class="btn btn-primary"
                                               style="background-color:#FF0000; border-color:#FF0000;color:#ffffff"><spring:message
                                                    code="app.delete"/></a>
                                        </td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href='<c:url value="/institution/add"/>'
       class="btn btn-primary"
       style="background-color:#FF0000; border-color:#FF0000;color:#ffffff"><spring:message
            code="app.add"/></a>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>