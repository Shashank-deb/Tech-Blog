<%@ page errorPage="error_page.jsp" %>
<%@ page import="controllers.tech.blog.entities.*" %>
<%@ page import="controllers.tech.blog.dao.*" %>
<%@ page import="controllers.tech.blog.helper.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.*" %>


<% 
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login_page.jsp");
}

%>
<%

int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostId(postId);

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getPtitle()%>|| Learn Coding by Shashank Sharma</title>

<!-- This is css cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Font Awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- This is Google fonts -->
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&family=Bad+Script&family=Dongle:wght@300&family=Fira+Sans:wght@100&family=Mochiy+Pop+P+One&family=Nanum+Gothic:wght@700&family=Oswald:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/mycss.css" >

<style>
    .banner-background{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 84%, 33% 84%, 0 100%, 0 0);
 }
 .post-title{
    font-weight: 100;
    font-size: 30px;
 }
 .post-content{

    font-weight: 100;
    font-size: 20px;
    font-family: 'Akaya Telivigala', cursive;
 }
.post-user-info{
   font-weight: 100;
   font-size: 20px;
   font-family: 'Akaya Telivigala', cursive;
}
.post-header{
  font-family: 'Arvo', serif;
}
.row-user{
    border: 2px solid;
    padding-top:15px ;
}
body{
    background: url('images/bg.jpg');
    background-size: cover;
    background-attachment: fixed;
}

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v13.0" nonce="oDXF4Jhr"></script>
</style>


</head>
<body>
     <!-- This is starting of navbar -->

<nav class="navbar navbar-expand-lg navbar-dark  primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-home" aria-hidden="true"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fa fa-graduation-cap" aria-hidden="true"></i>Learn Programming <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-list-alt" aria-hidden="true"></i>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fa fa-graduation-cap" aria-hidden="true"></i>Contact <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><i class="fa fa-asterisk" aria-hidden="true"></i>Do Post <span class="sr-only">(current)</span></a>
      </li>
     

    </ul>

    <ul class="navbar-nav mr-right">

    <li class="nav-item active">
        <a target="false" class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle "></span><%= user.getName() %></a>
    </li>
    
   
   <!-- Whenever we will map the Servlet in the links or anchor tags so we
   simply used doGet() and public access modifier to work on that particular Servlet -->
    <li class="nav-item active">
    <a target="false" class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span>Logout</a>
    </li>
   

    </ul>
    
  </div>
</nav>
   

<!-- This is ending of navbar -->
<!-- Starting of main content of the body -->
<div class="container">
    <div class="row my-4 ">
        <div class="col-md-6 offset-md-3" >
            <div class="card">
                <div class="card-header primary-background text-white">
                    <h4 class="post-title"><%=p.getPtitle()%></h4>
                </div>
                <div class="card-body">
                    <img class="card-img my-2" src="blog_pics/<%=p.getPic()%>" alt="Card image cap">
                    <div class="row my-3 row-user">
                        <div class="col-md-8 my-3">
                            <%
                              UserDao udao=new UserDao(ConnectionProvider.getConnection());
                             %>
<p class="post-user-info"><a href="#"><b>Posted by: <%=udao.getUserByUserId(p.getUserid()).getName()%></b></a></p>
                        </div>
                        <div class="col-md-4"> 
                        <p class="post-header">Date:<%=DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
                        </div>
                    </div>
                    <p class="post-content"><%=p.getPcontent()%></p>
                    <br>
                    <br>
                    <div class="post-code">
                    <pre><%=p.getCode()%></pre>
                    </div>
                </div>
                <div class="card-footer primary-background text-center">

                      <%
                        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());

                       %>
                       <a href="#" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                       <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light">Read more...</a>
                        <a href="#" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i><span>20</span></a>
                       
                </div>
                <div class="card-footer">
                    <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid()%>" data-width="" data-numposts="5"></div>
                </div>
                
                

            </div>

         </div>
    </div>
</div>
            
<!-- End of main content of the body -->

<!-- This is profile modal -->
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
      <div class="modal-header primary-background text-white ">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="container text-center">
            <img  src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width:150px;">
            <br>
            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
            <!-- This is user details in form of tables -->
            <div id="profile-details">
            <table class="table">
              
              <tbody>
                <tr>
                  <th scope="row">Id: </th>
                  <td><%= user.getId() %></td>
                  
                </tr>
                <tr>
                  <th scope="row">Email:  </th>
                  <td><%= user.getEmail()%></td>
                  
                </tr>
                <tr>
                  <th scope="row">Gender: </th>
                  <td><%=user.getGender()%></td>
                
                </tr>
                 <tr>
                  <th scope="row">Status: </th>
                  <td><%=user.getAbout()%></td>
                
                </tr>
                <tr>
                  <th scope="row">Registered Date: </th>
                  <td><%=user.getDateTime().toString()%></td>
                </tr>
              </tbody>
            </table>
          </div>


          <!-- This is the area of profile edit -->
          <div id="profile-edit" style="display:none;">

            <h3 class="mt-2">Please Edit Carefully!</h3>
            <form action="EditServlet" method="post" enctype="multipart/form-data">

                <table class="table">
                    <tr>
                        <td>Id: </td>
                        <td><%=user.getId()%></td>
                    <tr>
                     <tr>
                        <td>Email: </td>
                        <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                     <tr>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                    <tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" class="form-control" name="user_pass" value="<%=user.getPassword()%>"></td>
                    <tr>
                    <tr>
                        <td>Gender: </td>
                        <td><%=user.getGender().toUpperCase()%></td>
                    <tr>
                    <tr>
                        <td>About: </td>
                        <td>
                    <textarea rows="5" class="form-control" name="user_about"><%=user.getAbout()%>
                    </textarea>
                        </td>
                    <tr>
                    <tr>
                        <td> New Profile : </td>
                        <td><input type="file" name="user_pic" class="form-control"></td>
                    <tr>
                </table>
                <div class="container">
                    <button type="submit" class="btn btn-lg btn-success">Save</button>
                </div>
            </form>
          </div>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>




<!-- This is ending of profile modal -->



<!-- This is starting of post modal -->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Providing the post Details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
           <form id="add-post-form" action="AddPostServlet" method="post">
        <div class="form-group">
            <select class="form-control" name="cid">
                <option selected disabled>---Select Category---</option>
                <%
                 PostDao postd=new PostDao(ConnectionProvider.getConnection());
                 ArrayList<Category> list=postd.getAllCategories();
                 for(Category c:list)
                 {
                 %>
                  <option value="<%=c.getCid()%>"><%=c.getName()%></option>

                 <%

                 }

                 %>
               
            </select>
        </div>
            
             <div class="form-group">
                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
             </div>
             <div class="form-group">
               <textarea name="pContent" style="height: 100px;"class="form-control" rows="5" placeholder="Enter your Content"></textarea>
              </div>
              <div class="form-group">
               <textarea name="pCode" style="height: 100px;"class="form-control" rows="5" placeholder="Enter your Program(If Any?)"></textarea>
              </div>
              <div class="form-group">
                <label>Select Your Pic: </label>
                <br>
                <input name="pic" type="file">
              </div>
              <div class="container text-center">
                <button type="submit" class="btn btn-outline-primary">Post</button>
              </div>
         </form>
      </div>
     
    </div>
  </div>
</div>
<!-- This is ending of post modal -->









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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script type="text/javascript" src="./js/myjs.js"></script>
<script>
    function doLike(pid,uid){
    console.log(pid+","+uid);
    const d={
        uid:uid,
        pid:pid,
        operation:'like'
        }
        $.ajax({
            url:"LikeServlet",
            data:d,
           success:function(data,textStatus,jqXHR){
           console.log(data);
           if(data.trim()=='true'){
            let c=$(".like-counter").html();
            c++;
            $(".like-counter").html(c);
           }
        },
        error:function (jqXHR,textStatus,errorThrown) {
            console.log(data);
        }    
        })
        
    
}
</script>
<script>
    $(document).ready(function(){
             let editStatus=false;
        $("#edit-profile-button").click(function(){
                 if(editStatus==false){
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    editStatus=true;
                    $(this).text("Back");
                 } 
                 else
                 {
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    editStatus=false;
                     $(this).text("Edit");
                 }

        });

    })
</script>
<!-- Now add post js -->
<script>
    $(document).ready(function(e){
          $("#add-post-form").on("submit",function(event){
           //This code is called when form is submitted
             event.preventDefault();
             console.log("You haved click on post button");
             let form =new FormData(this);
             // Now requesting to server
             $.ajax({
                url:"AddPostServlet",
                type:'POST',
                data:form,
                success:function(data,textStatus,jqXHR){
                    // success
                    console.log(data);
                    if(data.trim()=='error'){
                        swal({
                              title: "Oops!",
                              text: "Something Went Wrong!",
                              icon: "error",   
                            });
                    }
                    else{
                         swal({
                              title: "Good job!",
                              text: "Saved Successfully!",
                              icon: "success",
                             
                            });
                    }
                },
                error:function(jqXHR,textStatus,errorThrown){
                         swal({
                              title: "Oops!",
                              text: "Something Went Wrong!",
                              icon: "error",
                             
                            });
                },
                processData:false,
                contentType:false


             });
          });
    });
</script>




</body>
</html>
