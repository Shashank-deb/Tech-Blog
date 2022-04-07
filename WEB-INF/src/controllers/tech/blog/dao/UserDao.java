package controllers.tech.blog.dao;
import controllers.tech.blog.entities.User;
import java.sql.*;
import java.lang.Exception;
//this class is used for data base interaction
public class UserDao
{
    private Connection con;

    public UserDao(Connection con){
    	this.con=con;
    }


    //method to insert user to database
    public boolean saveUser(User user){
    		boolean f=false;
    	try
    	{

    		//user-->database
    	   String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
           PreparedStatement pstmt= this.con.prepareStatement(query);
           pstmt.setString(1,user.getName());
           pstmt.setString(2,user.getEmail());
           pstmt.setString(3,user.getPassword());
           pstmt.setString(4,user.getGender());
           pstmt.setString(5,user.getAbout());
           pstmt.executeUpdate();
           f=true;
    	}
    	catch(Exception e)
    	{
            e.printStackTrace();

    	}

    	return f;
    }


    //getting username and password for login in the tech blog
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;

        try{
             String query="select * from user where email=? and password=?";
             PreparedStatement pstmt=con.prepareStatement(query);
             pstmt.setString(1,email);
             pstmt.setString(2,password);
             ResultSet rs =pstmt.executeQuery();
            if(rs.next())
            {
                user=new User();
                //data from db
                String name=rs.getString("name");
                //set the data of user
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=? , email=?, password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement pstm=con.prepareStatement(query);
            pstm.setString(1,user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getGender());
            pstm.setString(5,user.getAbout());
            pstm.setString(6,user.getProfile());
            pstm.setInt(7,user.getId());
            pstm.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public User getUserByUserId(int userId){
        User user=null;
        try{
          String query="select * from user where id=?";
          PreparedStatement pstmt=this.con.prepareStatement(query);
          pstmt.setInt(1,userId);
          ResultSet rs=pstmt.executeQuery();
          while(rs.next()){
                user=new User();
                //data from db
                String name=rs.getString("name");
                //set the data of user
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
          }
        }
        catch(Exception e){
               e.printStackTrace();
        }
        return user;
    }

}