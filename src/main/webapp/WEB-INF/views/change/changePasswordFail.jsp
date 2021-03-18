<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

            <div class="card mb-4">
                <div class="contact" id="contact">
                    <h2>${user.firstName} ${user.lastName}</h2>
                    <h3>Formularz zmiany hasła</h3>
                    <form:form class="form--contact" method="post" action="/app/user/profile/change-pass">

                        <div class="form-group">
                            <input id="oldPassword" type="text" name="oldPassword" placeholder="Stare hasło">
                        </div>

                        <div class="form-group">
                            <input id="newPassword" type="text" name="newPassword" placeholder="Nowe hasło">
                        </div>

                        <div class="form-group">
                            <input id="confirmPassword" type="text" name="confirmPassword" placeholder="Powtórz hasło">
                        </div>

                        <div id="error" class="form-group hidden" style="color: red;">
                            <h3>Błędne Stare Hasło!</h3>
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
    </center>
</div>
</body>
<%@include file="../footer.jsp" %>
</html>