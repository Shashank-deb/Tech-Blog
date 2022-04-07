package controllers.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import controllers.tech.blog.entities.User;
import controllers.tech.blog.entities.Post;
import controllers.tech.blog.dao.PostDao;
import controllers.tech.blog.helper.ConnectionProvider;
import controllers.tech.blog.helper.Helper;
import java.io.*;
import java.sql.Timestamp;

/**
 * Servlet implementation class Servlet1
 */
@Deprecated @MultipartConfig 
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		int cid=Integer.parseInt(req.getParameter("cid"));
		String pTitle=req.getParameter("pTitle");
	    String pContent=req.getParameter("pContent");
	    String pCode=req.getParameter("pCode");
	    Part part=req.getPart("pic");
	    // Getting currentUserId
	    HttpSession session=req.getSession();
	    User user=(User)session.getAttribute("currentUser");
	    out.println("Post Title: "+pTitle);
	    out.println(part.getSubmittedFileName());

	    Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
        PostDao dao=new PostDao(ConnectionProvider.getConnection());
        if(dao.savePost(p)){
             
             String path=req.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
             Helper.saveFile(part.getInputStream(),path);
             out.println("done");
        }
        else{
             out.println("error");
        }
		

	}

}