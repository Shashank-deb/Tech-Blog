package controllers.tech.blog.entities;
import java.sql.*;
public class Post{
   private int pid;
   private String ptitle;
   private String pcontent;
   private String code;
   private String pic;
   private Timestamp pdate;
   private int catid;
   private int userId;

   public Post(int pid,String ptitle,String pcontent,String code,String pic,Timestamp pdate,int catid,int userId){
   	    this.pid=pid;
   	    this.ptitle=ptitle;
   	    this.pcontent=pcontent;
   	    this.code=code;
   	    this.pic=pic;
   	    this.pdate=pdate;
   	    this.catid=catid;
          this.userId=userId;
   }
   public Post(String ptitle,String pcontent,String code,String pic,Timestamp pdate,int catid,int userId){
   	    this.ptitle=ptitle;
   	    this.pcontent=pcontent;
   	    this.code=code;
   	    this.pic=pic;
   	    this.pdate=pdate;
   	    this.catid=catid;
          this.userId=userId;
   }
   // This is for pid
   public void setPid(int pid){
   	  this.pid=pid;
   }
   public int getPid(){
   	return pid;
   }
   // This is for ptitle
   public void setPtitle(String ptitle){
   	this.ptitle=ptitle;
   }
   public String getPtitle(){
   	return ptitle;
   }
   // This is for pcontent
   public void setPcontent(String pcontent){
   	this.pcontent=pcontent;
   }
   public String getPcontent(){
   	return pcontent;
   }
   // This is for code
   public void setCode(String code){
   	this.code=code;
   }
   public String getCode(){
   	return code;
   }
   // This is for pic
   public void setPic(String pic){
   	this.pic=pic;
   }
   public String getPic(){
   	return pic;
   }
   // This is for pdate
   public void setPdate(Timestamp pdate){
   	this.pdate=pdate;
   }
   public Timestamp getPdate(){
   	return pdate;
   }
   // This is for catid
   public void setCatid(int catid){
   	this.catid=catid;
   }
   public int getCatid(){
   	return catid;
   }

   // This is for userId
   public void setUserid(int userId){
      this.userId=userId;
   }
   public int getUserid(){
      return userId;
   }

}