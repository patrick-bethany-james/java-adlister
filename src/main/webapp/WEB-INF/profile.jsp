<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}. Here are your Ads!</h1>


    <c:forEach var="ad" items="${ads}">

        <c:choose>
            <c:when test="${ad.user_id == sessionScope.user.id}">
                <div class="col-md-6">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>${ad.user_id}</p>
                </div>
            </c:when>
        </c:choose>

    </c:forEach>
    </div>



</body>
</html>

