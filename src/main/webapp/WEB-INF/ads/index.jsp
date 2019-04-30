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



            <%--<jsp:include page="/WEB-INF/partials/ad.jsp" />--%>

    <c:forEach var="ad" items="${ads}">
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
    </c:forEach>

    <%--<input type="hidden" name="id" value="${ad.id}">--%>
            <%--${ad.id}--%>
            <%--&lt;%&ndash;<input type="hidden" name="user_id" value="${ad.user.id}">&ndash;%&gt;--%>
            <%--<input id="title" type="submit" class="btn btn-block btn-primary"> Delete--%>
            <%--&lt;%&ndash;<input id="update" type="submit" class="btn btn-block btn-primary"> Edit&ndash;%&gt;--%>



</div>

</body>
</html>
