
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" value="${username}" type="text" >

                <c:if test = "${error != null}">
                    <p>${error}</p>
                </c:if>

                <c:if test = "${username.equals('')}">
                <p> ${usernameError}</p>
                </c:if>

            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" value="${email}" type="text">

                <c:if test = "${email.equals('')}">
                    <p> ${emailError}</p>
                </c:if>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" >

                <c:if test = "${password.equals('')}">
                    <p> ${passwordError}</p>
                </c:if>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">

                <c:if test = "${confirm_password != password}">
                    <p> ${confirmError}</p>
                </c:if>

            </div>

            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
