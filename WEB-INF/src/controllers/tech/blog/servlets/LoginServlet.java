package controllers.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controllers.tech.blog.dao.UserDao;
import controllers.tech.blog.helper.ConnectionProvider;
import controllers.tech.blog.entities.User;
import controllers.tech.blog.entities.Message;
	

/**
 * Servlet implementation class Servlet1
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String userEmail=req.getParameter("user_email");
		String userPassword=req.getParameter("user_pass");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailAndPassword(userEmail,userPassword);
		if(u==null){
			//login error
			//invalid field either email or password
			//out.println("Something went wrong");
			Message msg=new Message("Invalid details!try with another","error","alert-danger");
			HttpSession s=req.getSession();
			s.setAttribute("msg",msg);
			res.sendRedirect("login_page.jsp");
		}
		else{
               HttpSession s=req.getSession();
               s.setAttribute("currentUser",u);
               res.sendRedirect("profile.jsp");
		}
		

	}

}