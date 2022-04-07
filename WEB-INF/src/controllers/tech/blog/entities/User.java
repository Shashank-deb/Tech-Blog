package controllers.tech.blog.entities;
import java.sql.*;
public class User
{
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp dateTime;
	private String profile;

	   public User(int id,String name,String email,String password,String gender,String about,Timestamp dateTime){
            this.id=id;
            this.name=name;
            this.email=email;
            this.password=password;
            this.gender=gender;
            this.about=about;
            this.dateTime=dateTime;
	   }
	   public User(){

	   }

	   public User(String name,String email,String password,String gender,String about)
	   {
	   	this.name=name;
	   	this.email=email;
	   	this.gender=gender;
	   	this.password=password;
	   	this.about=about;
	  
	   }


	   // getters and setters


       // This is for id
	   public void setId(int id)
	   {
	   	this.id=id;
	   }
	   public int getId(){
	   	return id;
	   }

	   // This is for Name
	   public void setName(String name)
	   {
	   	this.name=name;
	   }
	   public String getName(){
	   	return name;
	   }  
       
       //This is for Email
	   public void setEmail(String email)
	   {
	   	this.email=email;
	   }
	   public String getEmail(){
	   	return email;
	   }


	   //This is for Gender

	   public void setGender(String gender)
	   {
	   	this.gender=gender;
	   }
	   public String getGender(){
	   	return gender;
	   }
        

       //This is for password
	   public void setPassword(String password)
	   {
	   	this.password=password;
	   }
	   public String getPassword(){
	   	return password;
	   }
       

       //This is for about
	   public void setAbout(String about)
	   {
	   	this.about=about;
	   }
	   public String getAbout(){
	   	return about;
	   }
       

       //This is for setDateTime
	   public void setDateTime(Timestamp dateTime)
	   {
	   	this.dateTime=dateTime;
	   }

	   public Timestamp getDateTime(){
	   	return dateTime;
	   }


	    //This is for profile 
        public void setProfile(String profile)
        {
        	this.profile=profile;
        }
        public String getProfile()
        {
        	return profile;
        }
}