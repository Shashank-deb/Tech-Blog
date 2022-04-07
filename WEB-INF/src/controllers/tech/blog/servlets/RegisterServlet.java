package controllers.tech.blog.servlets;
import controllers.tech.blog.dao.UserDao;
import controllers.tech.blog.entities.User;
import controllers.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import javax.servlet.annotation.MultipartConfig;


/**
 * Servlet implementation class Servlet1
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String check=req.getParameter("check");
		if(check==null)
		{
           out.println("box not checked");
		}
		else
		{

         //other data will stored here
         String name=req.getParameter("user_name");
         String email=req.getParameter("user_email");
         String password=req.getParameter("user_pass");
         String gender=req.getParameter("gender");
         String about=req.getParameter("about");
        
        
        
        //Create User Object and set data of all objects
         User user=new User(name,email,password,gender,about);


           //Create a UserDao object
         
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            if(dao.saveUser(user))
            {
            	out.println("done");
            }
            else{
            	out.println("error");
            }
         




		}
			

	}

}