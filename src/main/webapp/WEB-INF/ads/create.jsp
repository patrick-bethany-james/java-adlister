<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Create a new Ad" />
        </jsp:include>
    </head>
    <body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="container">
            <h1>Create an Ad</h1>
            <form action="/ads/create" method="post">
                <div class="form-group">
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
                    <input id="dob" name="dob" class="form-control" type="text" placeholder="XX/XX/XXXX">
                </div>
                <div>
                    <label for="gender">Gender</label>
                    <input id="gender" name="gender" class="form-control" type="text" placeholder="M or F">
                </div>
                <div class="form-group">
                    <label for="pictureURL">Picture URL</label>
                    <textarea id="pictureURL" name="pictureURL" class="form-control" type="text"></textarea>
                </div>

                <div>
                    <label for="gender">Characteristics</label>
                    <input id="character" name="character" class="form-control" type="text">
                </div>
                <input type="submit" class="btn btn-block btn-primary">
            </form>
        </div>
    </body>
</html>
