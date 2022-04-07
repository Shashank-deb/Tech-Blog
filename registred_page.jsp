<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
<!-- This is css cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Font Awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/mycss.css" >
<style>
.banner-background{
      clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 70%, 100% 100%, 18% 100%, 0 42%, 0 0);

}
</style>
</head>
<body>
<!-- Including the navigation bar -->
<%@ include file="normal_navbar.jsp" %>
<main class="primary-background p-3 banner-background" style="padding-bottom: 80px;">
<div class="container">

  <div class="col-md-6 offset-md-3">

      <div class="card ">
        <div class="card-header text-center primary-background text-white">
          <span class="fa fa-3x fa-user-circle"> </span> Register Here
        </div>

        <div class="card-body">
                <form id="reg-form" action="RegisterServlet" method="post" >
                  <div class="form-group">
                    <label for="exampleInputEmail1">User Name</label>
                    <input name="user_name" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Enter Username">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <input name="user_email" type="email" class="form-control"  aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your Email Id with anyone else.</small>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input name="user_pass" type="password" class="form-control"  placeholder="Password">
                  </div>

                  <div class="form-group">
                    <textarea class="form-control" name="about" placeholder="Enter Something About Your Self"  rows="4"></textarea>
                   </div>
                  <div class="form-group">
                    <label for="gender">Select Gender</label>
                    <br>
                    <input type="radio" id="gender" name="gender" value="male">Male
                    <input type="radio" id="gender" name="gender" value="female">Female
                  </div>
                  <div class="form-check">
                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Agreement terms and conditions</label>
                  </div>
                  <br>
                  <div class="container text-center" id="loader" style="display:none;">
                      <span class="fa fa-refresh fa-spin fa-3x"></span>
                  </div>
                  
                  <br>
                  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                </form>
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
<script type="text/javascript" src="js/myjs.js"></script>

<!-- This is sweet alert cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
 
 $(document).ready(function(){
        
   console.log("document loaded....");

   $("#reg-form").on('submit',function(event){
         
        
         event.preventDefault();
         let form=new FormData(this);
         $("#submit-btn").hide();
         $("#loader").show();
         $.ajax({
            url:"RegisterServlet",
            type:"POST",
            data:form,
            
            success:function(data,textStatus,jqXHR){
                console.log(data);
                 $("#submit-btn").show();
                 $("#loader").hide();
                  if(data.trim()==='done')
                {
                  swal("User Register Successfully").then((value)=>
                  {
                    window.location="login_page.jsp"
                  });
                 }
                 else
                 {
                    swal(data);
                 }
                 
            },

            error:function(jqXHR,textStatus,errorThrown)
            {
                 $("#submit-btn").show();
                 $("#loader").hide();
                 swal("Something Went Wrong! try again"); 

                 
            },
            processData:false,
            contentType:false

         })



   });



 });

</script>
</body>
</html>