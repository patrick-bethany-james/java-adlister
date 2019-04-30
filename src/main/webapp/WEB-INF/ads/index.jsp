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



            <jsp:include page="/WEB-INF/partials/ad.jsp" />

    <%--<input type="hidden" name="id" value="${ad.id}">--%>
            <%--${ad.id}--%>
            <%--&lt;%&ndash;<input type="hidden" name="user_id" value="${ad.user.id}">&ndash;%&gt;--%>
            <%--<input id="title" type="submit" class="btn btn-block btn-primary"> Delete--%>
            <%--&lt;%&ndash;<input id="update" type="submit" class="btn btn-block btn-primary"> Edit&ndash;%&gt;--%>



</div>

</body>
</html>
