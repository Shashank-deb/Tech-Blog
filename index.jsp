<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.tech.blog.helper.ConnectionProvider,java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>
<!-- This is css cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Font Awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/mycss.css" >

<style>
    .banner-background{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 84%, 33% 84%, 0 100%, 0 0);
 }

</style>

</head>

<body>


<!-- This is Navbar include normal_navbar.jsp -->
<%@ include file="normal_navbar.jsp" %>



<!-- Banner -->
<div class="container-fluid p-0 m-0 banner-background">
    <div class="jumbotron primary-background text-white">
        <div class="container">
          <h1 class="display-3">Welcome friends, in my TechBlog</h1>
          <p> A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
          <button class="btn btn-lg btn-outline-light"><span class="fa fa-arrow-circle-up"></span>Start It's free</button>
          <a href="login_page.jsp" target="false" class="btn btn-lg btn-outline-light"><span class="fa fa-user-circle fa-spin"></span>Login</a>

        </div>

    </div>
</div>






<!-- This is card coding -->

<div class="container">
    <div class="row mb-2">
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>

    </div>
     <div class="row ">
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                   <h5 class="card-title">Java Programming</h5>
                  <p class="card-text">Java is a high-level, class-based, object-oriented programming language..</p>
                 <a href="#" class="btn primary-background text-white">Go somewhere</a>
                </div>
            </div>
        </div>

    </div>

</div>





<!-- This is javascript cdn -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- This is cdn of jquery  -->
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous">
</script>
<script type="text/javascript" src="js/myjs.js"></script>
<script>


</script>

</body>
</html>




