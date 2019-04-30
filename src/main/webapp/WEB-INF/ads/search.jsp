<%--
  Created by IntelliJ IDEA.
  User: bethanyramirez
  Date: 2019-04-24
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
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
        <h1 style="text-align: center; margin-bottom: 1em;">Search for a pet</h1>
        <form method="get" action="/search">
            <div style="width: 20%; float: left;">
                <span style="font-weight: bold; font-size: 1.1em">Species:</span>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="species1" name="species" value="cat"> <!-- these values should match the SQL species table values. Or will these build queries?-->
                    <label class="form-check-label" for="species1">Cat</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="species2" name="species" value="dog">
                    <label class="form-check-label" for="species2">Dog</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="species3" name="species" value="reptile">
                    <label class="form-check-label" for="species3">Reptile</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="species4" name="species" value="fish">
                    <label class="form-check-label" for="species4">Fish</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="species5" name="species" value="rodents">
                    <label class="form-check-label" for="species5">Rodents</label>
                </div>
            </div>
            <div style="width: 20%; float: left;">
                <span style="font-weight: bold; font-size: 1.1em">Zip Code</span><br>
                <input type="text" name="location">
            </div>
            <div style="width: 20%; float: left;">
                <span style="font-weight: bold; font-size: 1.1em">Age:</span>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="age1" name="age" value="3">
                    <label class="form-check-label" for="age1">0-3</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="age2" name="age" value="4">
                    <label class="form-check-label" for="age2">4-7</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="age3" name="age" value="8">
                    <label class="form-check-label" for="age3">8+</label>
                </div>
            </div>
            <div style="width: 20%; float: left;">
                <span style="font-weight: bold; font-size: 1.1em">Sex:</span>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="sex1" name="gender" value="male">
                    <label class="form-check-label" for="sex1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="sex2" name="gender" value="female">
                    <label class="form-check-label" for="sex2">Female</label>
                </div>
            </div>
            <div style="width: 20%; float: left;">
                <span style="font-weight: bold; font-size: 1.1em">Characteristics:</span>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="kidfriendly">
                    <label class="form-check-label" for="inlineCheckbox1">Kid-Friendly</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="petfriendly">
                    <label class="form-check-label" for="inlineCheckbox2">Pet-Friendly</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="shy">
                    <label class="form-check-label" for="inlineCheckbox3">Shy</label>
                </div>
            </div>
    <button type="submit" style="width: 100%; margin-top: .5em;">Filter</button>
        </form>
    </div>
    <div class="container">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-4">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>

            </div>
        </c:forEach>
        <%--<div>Searched ads:--%>

            <%--${searchdiv};--%>
        <%--</div>--%>
    </div>
</body>
</html>
