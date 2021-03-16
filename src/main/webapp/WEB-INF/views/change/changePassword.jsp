<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 16.03.2021
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%@include file="../headerLog.jsp" %>
<body>


<div class="row">
    <center>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="contact" id="contact">
                    <h2>${user.firstName} ${user.lastName}</h2>
                    <h3>Formularz zmiany hasła</h3>
                    <div class="card-body">
                        <form:form method="post" action="/app/user/profile/change-pass">

                            <div class="form-group">
                                <input id="oldPassword" type="text" name="oldPassword"
                                       placeholder="Stare hasło" class="form-control ">
                            </div>

                            <div class="form-group">
                                <input id="newPassword" type="text" name="newPassword"
                                       placeholder="Nowe hasło" class="form-control ">
                            </div>

                            <div class="form-group">
                                <input id="confirmPassword" type="text" name="confirmPassword"
                                       placeholder="Powtórz hasło" class="form-control ">
                            </div>

                            <div id="error" class="form-group hidden" style="color: red;">
                                <h3>Hasła nie pasują do siebie!</h3>
                            </div>

                            <div class="form-group form-group--50">
                                <button class="btn" type="submit">Zmień hasło</button>
                            </div>

                            <div class="form-group form-group--50">
                                <a href="/app/home" class="btn btn--without-border">Powrót</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </center>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>
