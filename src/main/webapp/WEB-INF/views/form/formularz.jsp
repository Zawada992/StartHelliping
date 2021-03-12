<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 08.03.2021
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" modelAttribute="donation" action="/form">
    <div>
        <form:checkboxes path="categories" items="${categories}"
                         itemValue="id" itemLabel="name"/>
    </div>
    <div>
        <form:select path="institution" items="${institution}"
                     itemLabel="name" itemValue="id"/>
    </div>
    <div>
        <td><spring:message code="app.zipCode"/>:</td>
        <form:input path="zipCode"/>
    </div>
    <div>
        <td><spring:message code="app.street"/>:</td>
        <form:input path="street"/>
    </div>
    <div>
        <td><spring:message code="app.city"/>:</td>
        <form:input path="city"/>
    </div>
    <div>
        <td><spring:message code="app.quantity"/>:</td>
        <form:input path="quantity"/>
    </div>
    <div>
        <td><spring:message code="app.pickUpComment"/>:</td>
        <form:textarea path="pickUpComment"/>
    </div>
    <div>
        <td><spring:message code="app.pickUpDate"/>:</td>
        <form:input type="date" path="pickUpDate"/>
    </div>
    <div>
        <td><spring:message code="app.pickUpTime"/>:</td>
        <form:input type="time" path="pickUpTime"/>
    </div>

    <button type="submit" class="btn btn-primary btn-user btn-block">
        <spring:message code="app.add"/></button>

</form:form>
</body>
</html>
