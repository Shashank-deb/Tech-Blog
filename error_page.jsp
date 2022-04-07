<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<!-- This is css cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- Font Awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mycss.css" >

</head>
<body>

<div class="container text-center">
    <img src="images/error.png" class="img-fluid" height="400px" width="400px">
    <h3 class="display-3">Sorry,Something Went Wrong</h3>
    <!-- Showing the error of the page by the help of scriplet tag-->
    
    <a href="index.jsp" target="false" class="m-t-3 primary-background btn btn-lg text-white">Home</a>
</div>


</body>
</html>