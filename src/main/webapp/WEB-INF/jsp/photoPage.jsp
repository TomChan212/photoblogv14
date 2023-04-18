<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                          <h5 class="card-title">Title:<c:out value="${photo.title}"/></h5>
                          <img class="card-img-top" src="<c:url value='/'/>${photo.image}" alt="Card image cap">
                          <h6 class="card-text">Description: <br></h6>
                          <p class="card-text"><c:out value="${photo.description}"/></p>
                          <p class="card-text">User: <c:out value="${photo.users.username}"/></p>
                          <p class="card-text">Time: <small class="text-muted"><c:out value="${photo.uploadDateTime}"/></small></p>


                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal.username" var="username" />
                        </sec:authorize>

                                <sec:authorize access="hasRole('ROLE_ADMIN') or #photo.users.email == #username">
                                    <form action="<c:url value='/user/photos/delete/${photo.id}'/>">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_ADMIN') or #photo.users.email == #username">
                                     <form action="<c:url value='/user/photos/edit/${photo.id}'/>">
                                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                         <button type="submit" class="btn btn-primary">Edit</button>
                                     </form>
                                 </sec:authorize>
                  </div>
              </div>
      </div>
</div>
</div>

<!-- Display comments -->
<div class="container my-5">
  <div class="row justify-content-left">
    <div class="col-md-9">
      <div class="card">
        <div class="card-header">
          <h3>Comments</h3>
        </div>
        <div class="card-body">
          <c:forEach items="${comments}" var="c" varStatus="status" >
            <div class="mb-3">
              <div class="card">
                <div class="card-body">
                  <p class="card-text" ><b>Comment: </b> <c:out value="${c.text}"/></p>
                  <p class="card-text"><b>Date: </b> <c:out value="${c.createdAt}" /></p>
                  <p class="card-text"><b>By: </b> <c:out value="${c.users.username}" /></p>

                   <sec:authorize access="hasRole('ROLE_ADMIN') or #c.users.email == #username">
                                        <form action="<c:url value='/user/comment/delete/'/>${c.id}" class="mt-3">
                                                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                  <button class="btn btn-danger">Delete</button>
                                        </form>
                   </sec:authorize>


                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Add comment form -->
<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')">
<div class="container my-5">
    <div class="row justify-left-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    <h3>Add Comment</h3>
                </div>
                <div class="card-body">
                                                       <form action="${pageContext.request.contextPath}/user/comment/${photo.id}" method="post">
                                                                               <div class="form-group">
                                                                                   <label for="comment">Comment:</label>
                                                                                   <textarea class="form-control" id="comment" name="comment" rows="5" required></textarea>
                                                                               </div>
                                                                               <button type="submit" class="btn btn-primary">Add Comment</button>
                                                                           </form>
                    </sec:authorize>

                    <sec:authorize access="!isAuthenticated()">
                        <div class="container my-5">
                            <div class="row justify-left-center">
                                <div class="col-md-9">
                                    <h3>Please login to comment :)</h3>
                                    <form action="${pageContext.request.contextPath}/user/userIndex" method="GET" class="float-right">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </sec:authorize>

                </div>
            </div>
        </div>
    </div>
</div>
 </div>
    </div>
</div>
</div>
</body>
</html>



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-HPy8phv+Dgq3OeYH/0BZYZtNQUOx9XN2BfcHtKNW8zzAXeD/h1NZ2QclpuRufhW8"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-+6XnE6DOrtW/41mDtPfANn6C7dYwYc6hIkZ6UYYX6UzD6UizLvjqNNUBYNzO1O2N"
        crossorigin="anonymous"></script>