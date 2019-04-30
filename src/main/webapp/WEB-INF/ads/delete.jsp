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