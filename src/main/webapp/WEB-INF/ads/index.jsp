<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <%--<c:forEach var="ad" items="${ads}">--%>
        <%--<div class="col-md-6">--%>
            <%--<h2>${ad.title}</h2>--%>
            <%--<p>${ad.description}</p>--%>
            <%--<button type="submit" class="btn btn-block btn-primary">Delete</button>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>


    <c:forEach var="ad" items="${ads}">
    <form action="/ads" method="post">
        <div class="form-group col-md-6">
            <label for="title">${ad.title}</label>
            <label for="title">${ad.description}</label>
            <input type="hidden" name="id" value="${ad.id}">
            <input id="title" type="submit" class="btn btn-block btn-primary">

        </div>
    </form>
    </c:forEach>

</div>

</body>
</html>
