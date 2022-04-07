<%@ page import="controllers.tech.blog.dao.PostDao" %>
<%@ page import="controllers.tech.blog.helper.ConnectionProvider "%>
<%@ page import="controllers.tech.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="controllers.tech.blog.dao.LikeDao" %>
<%@ page import="controllers.tech.blog.entities.User" %>
<html>
<body>
<title>Load</title>

<div class="row">
<%


   User uuu=(User)session.getAttribute("currentUser");
   Thread.sleep(1000);
  PostDao postd=new PostDao(ConnectionProvider.getConnection());
  int cid=Integer.parseInt(request.getParameter("cid"));
  List<Post> posts=null;
  if(cid==0){
          posts=postd.getAllPost();
  }
  else{
        posts=postd.getPostByCatId(cid);
  }
  if(posts.size()==0){
    out.println("<h3 class='display-3 text-center'>No post in this Category<h3>");
  }
  for(Post p:posts)
  {
  %>
   <div class="col-md-6 mt-2">
   	<div class="card">
   		<img class="card-img" src="blog_pics/<%=p.getPic()%>" alt="Card image cap">
   		<div class="card-body">
   			 <b><%=p.getPtitle()%></b>
   			 <p><%=p.getPcontent()%></p>
   			 <pre><%=p.getCode()%></pre>
   		</div>
      <div class="card-footer primary-background text-center">

        <%
         LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
         %>
        <a href="#" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class="btn btn-outline-light"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
       <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light">Read more...</a>
        <a href="#" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i><span>20</span></a>


      </div>
   	</div>
   </div>

  <%
  }
  %>
</div>


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

</body>
</html>