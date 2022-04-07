package controllers.tech.blog.helper;
import java.sql.*;
import java.lang.Exception;
public class ConnectionProvider
{
     private static Connection con;
     public static Connection getConnection(){
     	try
        {
        	if(con==null)
           {
        	//Driver Class Load
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	//Create connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","tiger");
            }
     	  }
     	catch(Exception e)
     	{
     		e.printStackTrace();
     	}
     	return con;
     }
}