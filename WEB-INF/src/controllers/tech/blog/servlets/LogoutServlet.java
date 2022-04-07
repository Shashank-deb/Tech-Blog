package controllers.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.tech.blog.entities.Message;
/**
 * Servlet implementation class Servlet1
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	  public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		HttpSession s=req.getSession();
		s.removeAttribute("currentUser");
		Message msg=new Message("Logout Successfully","success","alert-danger");
		s.setAttribute("msg",msg);
		res.sendRedirect("login_page.jsp");
	}

}