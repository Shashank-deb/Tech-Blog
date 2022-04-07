<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.tech.blog.entities.Message" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- This is css cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Font Awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/mycss.css" >
<style>
    .banner-background{
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 80%, 70% 100%, 31% 100%, 0 81%, 0 0);
    }
</style>
</head>
<body>
    <!-- We want to include the navbar -->
    <%@ include file="normal_navbar.jsp" %>
<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh;">
    <div class="container">

      <div class="row ">
        
        <div class="col-md-4 offset-md-4">

          <div class="card">
            <div class="card-header primary-background text-white text-center">
                <span class="fa fa-user-plus fa-3x"></span>
                 Login Here

            </div>

            <% 
              Message m=(Message)session.getAttribute("msg");
              if(m!=null)
              {
              %>

                <div class="alert <%= m.getCssClass() %>" role="alert">
                  <%= m.getContent() %>
                </div>


              <%
                session.removeAttribute("msg");

              }

             %>


            
            
               

            <div class="card-body">
                <form  action="LoginServlet" method="post">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input name="user_pass" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                      </div>
                      
                      <div class="container text-center">
                      <button  type="submit" class="btn btn-primary">Submit</button>
                      </div>
                </form>

            </div>

         </div>

        </div>

      </div>
    </div>
</main>






<!-- This is javascript cdn -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- This is cdn of jquery  -->
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>

</body>
</html>


