package controllers.tech.blog.servlets;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.tech.blog.entities.User;
import controllers.tech.blog.dao.UserDao;
import controllers.tech.blog.helper.ConnectionProvider;
import controllers.tech.blog.helper.Helper;
import controllers.tech.blog.entities.Message;

/**
 * Servlet implementation class Servlet1
 */
@Deprecated @MultipartConfig 
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		//fetch all data from profile.jsp
		String userEmail=req.getParameter("user_email");
		String userName=req.getParameter("user_name");
		String userPassword=req.getParameter("user_pass");
		String userAbout=req.getParameter("user_about");
		Part part=req.getPart("user_pic");
		String imageName=part.getSubmittedFileName();



		//get the user from the session
		HttpSession s=req.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile=user.getProfile();
		user.setProfile(imageName);



		//modify the databases
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userdao.updateUser(user);
		if(ans){
			
			     String path=req.getRealPath("/")+"pics"+File.separator+user.getProfile();
			     // This is delete code

			     String pathOldFile=req.getRealPath("/")+"pics"+File.separator+oldFile;
			     if(!oldFile.equals("default.png")){
			     Helper.deleteFile(pathOldFile);
			     }
			     	if(Helper.saveFile(part.getInputStream(),path)){
			     		out.println("Profile Updated....");
			     		Message msg=new Message("Profile Details Updated....","success","alert-success");
						s.setAttribute("msg",msg);
						
			     	}
			     	else{
			     		Message msg=new Message("Something went wrong....","error","alert-danger");
			            s.setAttribute("msg",msg);

			     	}		    
			
		    }
		else{
			out.println("Not Update to database!");
			Message msg=new Message("Something went wrong....","error","alert-danger");
			s.setAttribute("msg",msg);
		}
		res.sendRedirect("profile.jsp");


		

	}

}