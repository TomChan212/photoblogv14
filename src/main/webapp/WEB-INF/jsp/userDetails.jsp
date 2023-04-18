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
          <h4 class="mb-0">USER</h4>
        </div>
        <div class="card-body">
         <p class="card-text">Username:<c:out value="${users.username}"/></p>
         <p class="card-text">Email:<c:out value="${users.email}"/></p>
         <p class="card-text">Ph.Number:<c:out value="${users.phoneNumber}"/></p>
         <p class="card-text">Bio:<c:out value="${users.bio}"/></p>

         <sec:authorize access="isAuthenticated()">
                                     <sec:authentication property="principal.username" var="username" />
                                 </sec:authorize>

           <sec:authorize access="hasRole('ROLE_ADMIN') and #users.email != #username">
                                              <form action="<c:url value='/user/delete/${users.id}'/>">
                                                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                  <button type="submit" class="btn btn-danger">Delete</button>
                                              </form>
                                          </sec:authorize>
                                          <sec:authorize access="hasRole('ROLE_ADMIN') and #users.email != #username">
                                               <form action="<c:url value='/admin/editUser/${users.id}'/>">
                                                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                   <button type="submit" class="btn btn-primary">Edit</button>
                                               </form>
                                           </sec:authorize>
                                           <form action="${pageContext.request.contextPath}/admin/adminIndex" method="GET" class="float-right">
                                                   <button type="submit" class="btn btn-primary">Back</button>
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