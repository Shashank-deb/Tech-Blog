package controllers.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.tech.blog.dao.LikeDao;
import controllers.tech.blog.helper.ConnectionProvider;
/**
 * Servlet implementation class Servlet1
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String operation=req.getParameter("operation");
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		// out.println("This is the data from server side");
		// out.println(operation);
		// out.println(pid);
		// out.println(uid);
        LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
        boolean f=ldao.insertLike(pid,uid);
        out.println(f);

		if(operation.equals("like")){
       
		}else{

		}
	}

}