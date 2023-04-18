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
                   <a class="nav-link" href="/user/profile">My Profile</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/user/commentHistory">My Comment History</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/user/photoHistory">My Photo History</a>
                 </li>
        </ul>
    </div>
</nav>

<!-- Main Content -->

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
          <h4 class="mb-0">Photo</h4>
        </div>
        <div class="card-body">

          <form action="${pageContext.request.contextPath}/user/photos/${photo.id}/update" method="post">

            <input type="hidden" name="id" value="${photo.id}" />
            <input type="hidden" name="image" value="${photo.image}" />

            <div class="form-group">
              <label for="title">Title:</label>
              <input type="text" class="form-control" id="title" maxlength="100" name="title" value="${photo.title}">
            </div>


            <div class="form-group">
              <label for="description">Description:</label>
              <input type="text" class="form-control" id="description" maxlength="200" name="description" value="${photo.description}">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Update photo</button>
          </form>

          <form action="${pageContext.request.contextPath}/user/userIndex" method="get" class="float-right">
            <button class="btn btn-primary">Back</button>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-HPy8phv+Dgq3OeYH/0BZYZtNQUOx9XN2BfcHtKNW8zzAXeD/h1NZ2QclpuRufhW8"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-+6XnE6DOrtW/41mDtPfANn6C7dYwYc6hIkZ6UYYX6UzD6UizLvjqNNUBYNzO1O2N"
        crossorigin="anonymous"></script>