<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Delete Your Ad" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="container">
        <h1>Choose an ad to delete</h1>
            <c:forEach var="ad" items="${ads}">
                <c:choose>
                    <c:when test="${ad.user_id == sessionScope.user.id}">
                        <form action="/ads/delete" method="post">
                            <div class="col-md-4">
                                <div class="card" style="border: 1px solid grey; margin-bottom: 10px;">
                                    <img src ="${ad.pictureURL}" class="card-img-top" height="auto" width="100%">
                                    <div class="card-body" style="padding-left: 5px">
                                        <h5 class="card-title" style="font-weight: bold; text-align: center; font-size: 1.5em;">${ad.title}</h5>
                                        <span style="font-weight: bold">Description: </span><span style="font-style: italic">${ad.description}<br></span>
                                        <span style="font-weight: bold">Species: </span>${ad.species}<br>
                                        <span style="font-weight: bold">DOB: </span>${ad.dob}<br>
                                        <span style="font-weight: bold">Gender: </span>${ad.gender}<br>
                                        <span style="font-weight: bold">Location: </span>${ad.zipCode}
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="${ad.id}">
                                <input type="hidden" name="user_id" value="${ad.user_id}">
                                <button id="delete" type="submit" class="btn btn-block btn-primary"> Delete</button>
                            </div>
                        </form>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </body>
</html>