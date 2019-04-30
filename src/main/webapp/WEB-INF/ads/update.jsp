<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Your Ad" />
    </jsp:include>
</head>
    <body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
            <h1>Update Your Ad</h1>
        <div class="container">

            <c:forEach var="ad" items="${ads}">
                <c:choose>
                    <c:when test="${ad.user_id == sessionScope.user.id}">
                        <form action="/ads/update" method="post">
                            <jsp:include page="/WEB-INF/partials/ad.jsp" />
                                <input type="hidden" name="id" value="${ad.id}">
                                <input type="hidden" name="user_id" value="${ad.user_id}">

                                <div>
                                    <label for="title">Title</label>
                                    <input id="title" name="title" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <textarea id="description" name="description" class="form-control" type="text"></textarea>
                                </div>

                                <label>Species Type</label>
                                <select name="species_type">
                                    <option value="cat">Cat</option>
                                    <option value="dog">Dog</option>
                                    <option value="reptile">Reptile</option>
                                    <option value="fish">Fish</option>
                                    <option value="rodent">Rodent</option>
                                </select>


                                <div class="form-group">
                                    <label for="zipCode">Zip Code</label>
                                    <input id="zipCode" name="zipCode" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="dob">Date of Birth</label>
                                    <input id="dob" name="dob" class="form-control" type="text" placeholder="YYYY-MM-DD">
                                </div>
                                <div>
                                    <select name="gender">
                                        <option id="gendermale" class="form-control" value="m">Male</option>
                                        <option id="genderfemale" class="form-control" value="f">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="pictureURL">Picture URL</label>
                                    <textarea id="pictureURL" name="pictureURL" class="form-control"></textarea>
                                </div>

                                <input type="hidden" name="ad_id" value="${ad.id}">
                                <button id="update" type="submit" class="btn btn-block btn-primary">Edit</button>
                            </div>
                        </form>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </body>
</html>


