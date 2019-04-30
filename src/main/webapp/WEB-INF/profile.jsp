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
                <form action="/profile" method="post">
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
                            ${ad.id}
                        ${ad.user_id}
                        <input type="hidden" name="user_id" value="${ad.user_id}">
                        <input type="submit" class="btn btn-block btn-primary"> Delete






                            <%--<form action="/ads/create" method="post">--%>
                            <%--<div class="form-group">--%>
                            <%--<label for="title">Title</label>--%>
                            <%--<input id="title" name="title" class="form-control" type="text">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                            <%--<label for="description">Description</label>--%>
                            <%--<textarea id="description" name="description" class="form-control" type="text"></textarea>--%>
                            <%--</div>--%>

                            <%--<label>Species Type</label>--%>
                            <%--<select name="species_type">--%>
                            <%--<option value="cat">Cat</option>--%>
                            <%--<option value="dog">Dog</option>--%>
                            <%--<option value="reptile">Reptile</option>--%>
                            <%--<option value="fish">Fish</option>--%>
                            <%--<option value="rodent">Rodent</option>--%>
                            <%--</select>--%>


                            <%--<div class="form-group">--%>
                            <%--<label for="zipCode">Zip Code</label>--%>
                            <%--<input id="zipCode" name="zipCode" class="form-control" type="text">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                            <%--<label for="dob">Date of Birth</label>--%>
                            <%--<input id="dob" name="dob" class="form-control" type="text" placeholder="YYYY-MM-DD">--%>
                            <%--</div>--%>
                            <%--<div>--%>
                            <%--<label for="gender">Gender</label>--%>
                            <%--<input id="gender" name="gender" class="form-control" type="text" placeholder="M or F">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                            <%--<label for="pictureURL">Picture URL</label>--%>
                            <%--<textarea id="pictureURL" name="pictureURL" class="form-control"></textarea>--%>
                            <%--</div>--%>

                            <%--<input type="hidden" name="user_id" value="${ad.user.id}">--%>
                            <%--${ad.user.id}--%>
                            <%--<input id="update" type="submit" class="btn btn-block btn-primary"> Edit--%>
                            <%--</form>--%>
                        <%----%>

                        <%--<input id="update" type="submit" class="btn btn-block btn-primary"> Edit--%>

                    </div>
                </form>
            </c:when>
        </c:choose>
    </c:forEach>
    </div>



</body>
</html>

