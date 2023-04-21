<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PhotoBlog</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/static/css/main.css">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">PhotoBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">

        <sec:authorize access="hasRole('ROLE_ADMIN')">
             <li class="nav-item">
                            <a class="nav-link" href="/admin/adminIndex">ADMIN PANEL</a>
                        </li>
        </sec:authorize>
           <li class="nav-item">
                   <a class="nav-link" href="/user/photos/upload">Upload Photo</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/user/myPhotos">My Photos</a>
                 </li>

                 <li class="nav-item">
                   <a class="nav-link" href="/user/commentHistory">My Comment History</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/user/photoHistory">My Photo History</a>
                 </li>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
          <h4 class="mb-0">My Profile</h4>
        </div>
        <div class="card-body">
            <h5>Username: </h5>     <p class="card-text"><c:out value="${users.username}"/></p>
            <h5>Email: </h5>     <p class="card-text"><c:out value="${users.email}"/></p>
            <h5>Ph.Number: </h5>     <p class="card-text"><c:out value="${users.phoneNumber}"/></p>
            <h5>Bio: </h5>     <p class="card-text"><c:out value="${users.bio}"/></p>
            <h3 class="card-text" style="text-align:right">
            <a href="/user/profile/update" class="btn btn-primary">Edit</a>
          </h3>
          <h3 class="card-text" style="text-align:right">
            <a href="/user/userIndex" class="btn btn-primary">back</a>
          </h3>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
    <div class="row justify-content-left">
        <div class="card-header">
            <h4 class="mb-0">My Photos</h4>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <%-- Loop through all photos and display each in a card --%>
            <c:forEach var="c" items="${photos}" varStatus="iterStat">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img class="card-img-top" src="<c:url value='/'/>${c.image}" alt="Card image cap">

                        <div class="card-body">
                            <h5 class="card-title">Title:<c:out value="${c.title}"/></h5>
                            <h6 class="card-text">Description: </h6>
                            <p class="card-text"><c:out value="${c.description}"/></p>
                            <p class="card-text">Time: <small class="text-muted"><c:out value="${c.uploadDateTime}"/></small></p>
                            <form action="<c:url value='/photos/'/>${c.id}">
                                <button class="btn btn-primary">Photo page</button>
                            </form>
                        </div>
                    </div>
                        <%-- Create a new row after every 3 photos --%>
                    <c:if test="${iterStat.index % 3 == 2}">
                        <div class="w-100"></div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-HPy8phv+Dgq3OeYH/0BZYZtNQUOx9XN2BfcHtKNW8zzAXeD/h1NZ2QclpuRufhW8"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-+6XnE6DOrtW/41mDtPfANn6C7dYwYc6hIkZ6UYYX6UzD6UizLvjqNNUBYNzO1O2N"
        crossorigin="anonymous"></script>