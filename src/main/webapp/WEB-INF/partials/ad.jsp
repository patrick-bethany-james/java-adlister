<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%--
  Created by IntelliJ IDEA.
  User: bethanyramirez
  Date: 2019-04-30
  Time: 09:59
  To change this template use File | Settings | File Templates.
--%>



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