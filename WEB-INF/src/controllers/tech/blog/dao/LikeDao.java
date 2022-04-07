package controllers.tech.blog.dao;
import java.sql.*;
public class LikeDao{
	Connection con;
	public LikeDao(Connection con){
		this.con=con;
	}
    public boolean insertLike(int pid,int uid){
    	boolean f=false;
              try{
                String query="insert into liket(pid,uid) values(?,?)";
                PreparedStatement pstmt=this.con.prepareStatement(query);
                pstmt.setInt(1,pid);
                pstmt.setInt(2,uid);
                pstmt.executeUpdate();
                f=true;
              }
              catch(Exception e){
              	e.printStackTrace();
              }
              return f;
    }
    public int countLikeOnPost(int pid){
    	int count=0;
         try{
           String query="select count(*) from liket where pid=?";
           PreparedStatement pstmt=this.con.prepareStatement(query);
           pstmt.setInt(1,pid);
           ResultSet rs=pstmt.executeQuery();
           while(rs.next()){
           	count=rs.getInt("count(*)");
           }

         }
         catch(Exception e){
            e.printStackTrace();
         }
    	return count;
    }
    public boolean isLikedByUser(int pid ,int uid){
    	boolean f=false;
    	try{
           String query="select * from liket where pid=? and uid=?";
           PreparedStatement pstmt=this.con.prepareStatement(query);
           pstmt.setInt(1,pid);
           pstmt.setInt(2,uid);
           ResultSet rs=pstmt.executeQuery();
           while(rs.next()){
           	f=true;
           }
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	return f;
    }
    public boolean deleteLike(int pid,int uid){
    	boolean f=false;
    	try{
            String query="delete from liket where pid=? and uid=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setInt(1,pid);
            pstmt.setInt(2,uid);
            pstmt.executeUpdate();
            f=true;
    	}
    	catch(Exception e){
              e.printStackTrace();
    	}
    	return f;
    }
}