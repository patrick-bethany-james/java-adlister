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
        <h1>Welcome, ${sessionScope.user.username}.</h1>


    <c:forEach var="ad" items="${ads}">
        <c:choose>
            <c:when test="${ad.user_id == sessionScope.user.id}">

                    <form action="/ads" method="post">
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
                        </div>
                    </form>

                        <input type="hidden" name="id" value="${ad.id}">
                        <input type="hidden" name="user_id" value="${ad.user_id}">







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

            </c:when>
        </c:choose>
    </c:forEach>

<%--<c:forEach var="character" items="${characters}">--%>
    <%--<c:choose>--%>
        <%--<c:when test="${ad.user_id == sessionScope.user.id}">--%>
        <%--<div>--%>
            <%--<label>${characteristic.characteristic}</label>--%>
        <%--</div>--%>
        <%--</c:when>--%>
    <%--</c:choose>--%>
<%--</c:forEach>--%>


    </div>



</body>
</html>

