<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${sessionScope.user == null}">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
                <li><a href= "/search">Search Ads</a></li>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <li><a href="/logout">Logout</a></li>
                <li><a href="/profile">My Profile</a></li>
                <li><a href="/ads/create">Create Ad</a></li>
                <li><a href="/ads/update">Update Ad</a></li>
                <li><a href="/ads/delete">Delete Ad</a></li>
            </c:if>


        </ul>





    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
