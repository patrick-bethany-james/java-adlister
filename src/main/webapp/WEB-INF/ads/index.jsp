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
            <div>
                <label>${ad.title}</label>
            </div>
            <div>
                <label>${ad.species}</label>
            </div>
            <div>
                <label>${ad.dob}</label>
                <label>${ad.gender}</label>
                <label>${ad.zipCode}</label>
            </div>
            <div>
                <label>${ad.description}</label>
            </div>
            <label><img src = "${ad.pictureURL}" height="250" width="350"></label>
            <%--<input type="hidden" name="id" value="${ad.id}">--%>
            <%--${ad.id}--%>
            <%--&lt;%&ndash;<input type="hidden" name="user_id" value="${ad.user.id}">&ndash;%&gt;--%>
            <%--<input id="title" type="submit" class="btn btn-block btn-primary"> Delete--%>
            <%--&lt;%&ndash;<input id="update" type="submit" class="btn btn-block btn-primary"> Edit&ndash;%&gt;--%>

        </div>
    </form>
    </c:forEach>

</div>

</body>
</html>
