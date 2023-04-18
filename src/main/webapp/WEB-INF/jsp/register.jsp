<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid" style="padding-left:inherit;padding-right:inherit">
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">PhotoBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </ul>
        </div>
    </nav>

   <div class="row justify-content-center mt-5">
       <div class="col-md-6">
           <div class="card">
               <div class="card-header text-center"><h4>Register</h4></div>
               <div class="card-body">
                   <form action="/registerSuccess" method="post" enctype="multipart/form-data">
                       <div class="form-group">
                           <label for="username">Username</label>
                           <input type="text" name="username" id="username" class="form-control" required>
                       </div>
                       <div class="form-group">
                           <label for="email">Email</label>
                           <input type="email" name="email" id="email" class="form-control" required>
                       </div>
                       <div class="form-group">
                           <label for="phoneNumber">Phone Number</label>
                           <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" required>
                       </div>
                       <div class="form-group">
                           <label>Bio</label>
                           <input type="text" name="bio" class="form-control" required>
                       </div>
                       <div class="form-group">
                           <label for="password">Password</label>
                           <input type="password" name="password" id="password" class="form-control" required>
                       </div>
                       <button type="submit" class="btn btn-primary btn-block">Register</button>
                   </form>
               </div>
           </div>
       </div>
   </div>


</div>
</body>
</html>
