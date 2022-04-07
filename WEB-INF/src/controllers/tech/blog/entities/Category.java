package controllers.tech.blog.entities;
public class Category{
	private int cid;
	private String name;
	private String description;

	public Category(int cid,String name,String description){
		this.cid=cid;
		this.name=name;
		this.description=description;
	}
	public Category(){

	}
	public Category(String name,String description){
		this.name=name;
		this.description=description;
	}
	//This is for cid
	public void setCid(int cid){
		this.cid=cid;
	}
	public int getCid(){
		return cid;
	}
	// This is for name
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	// This is for description
	public void setDescription(String description){
		this.description=description;
	}
	public String getDescription(){
		return description;
	}

}