package controllers.tech.blog.dao;
import controllers.tech.blog.entities.Category;
import java.util.ArrayList;
import controllers.tech.blog.entities.Post;
import java.sql.*;
import java.util.List;
public class PostDao{
     Connection con;
     public PostDao(Connection con){
     	this.con=con;
     }
     public ArrayList<Category> getAllCategories(){
         ArrayList<Category>list= new ArrayList<>();
            try{
              String q="select * from categories";
              Statement st=con.createStatement();
              ResultSet rs=st.executeQuery(q);
              while(rs.next()){
              	int cid=rs.getInt("cid");
              	String name=rs.getString("name");
              	String description=rs.getString("description");
              	Category c=new Category(cid,name,description);
              	list.add(c);
              }

            }
            catch(Exception e){
                   e.printStackTrace();
            }
         return list;
     }
     public boolean savePost(Post p){
            boolean f=false;
            try{
              String q="insert into posts(ptitle,pcontent,code,pic,catid,userId) values(?,?,?,?,?,?)";
              PreparedStatement pstmt=con.prepareStatement(q);
              pstmt.setString(1,p.getPtitle());
              pstmt.setString(2,p.getPcontent());
              pstmt.setString(3,p.getCode());
              pstmt.setString(4,p.getPic());
              pstmt.setInt(5,p.getCatid());
              pstmt.setInt(6,p.getUserid());
              pstmt.executeUpdate();
              f=true;
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return f;
     }
     // Get all the post
     public List<Post> getAllPost(){
           List<Post> list=new ArrayList<>();
           //fetch all the post
           try{
              String query="select * from posts order by pid desc";
              PreparedStatement pstmt=con.prepareStatement(query);
              ResultSet rs=pstmt.executeQuery();
              while(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent=rs.getString("pcontent");
                String code=rs.getString("code");
                String pic=rs.getString("pic");
                Timestamp pdate=rs.getTimestamp("pdate");
                int catId=rs.getInt("catid");
                int userId=rs.getInt("userId");
                Post post=new Post(pid,ptitle,pcontent,code,pic,pdate,catId,userId);
                list.add(post);

              }
           }
           catch(Exception e){
            e.printStackTrace();
           }
           return list;
     }
    
     public List<Post> getPostByCatId(int catId){
      List<Post> list=new ArrayList<>();
           //fetch all the post by catid
           try{
              String query="select * from posts where catid=?";
              PreparedStatement pstmt=con.prepareStatement(query);
              pstmt.setInt(1,catId);
              ResultSet rs=pstmt.executeQuery();
              while(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent=rs.getString("pcontent");
                String code=rs.getString("code");
                String pic=rs.getString("pic");
                Timestamp pdate=rs.getTimestamp("pdate");
                int userId=rs.getInt("userId");
                Post post=new Post(pid,ptitle,pcontent,code,pic,pdate,catId,userId);
                list.add(post);

              }
           }
           catch(Exception e){
            e.printStackTrace();
           }
           return list;
     }
     public Post getPostByPostId(int postId){
        Post post=null;
        String query="select * from posts where pid=?";
        try{
          PreparedStatement pstmt=con.prepareStatement(query);
          pstmt.setInt(1,postId);
          ResultSet rs=pstmt.executeQuery();
          if(rs.next()){
              
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent=rs.getString("pcontent");
                String code=rs.getString("code");
                String pic=rs.getString("pic");
                Timestamp pdate=rs.getTimestamp("pdate");
                int catId=rs.getInt("catid");
                int userId=rs.getInt("userId");
                post=new Post(pid,ptitle,pcontent,code,pic,pdate,catId,userId);
          }
        }
        catch(Exception e){
           e.printStackTrace();
        }
        return post;
     }
}