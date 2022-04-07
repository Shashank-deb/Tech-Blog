package controllers.tech.blog.entities;
public class Message{

      private String content;
      private String type;
      private String cssClass;

      public Message(String content,String type,String cssClass)
      {
      	this.content=content;
      	this.type=type;
      	this.cssClass=cssClass;
      }


      //this is for content
      public void setContent(String content)
      {
      	this.content=content;
      }
      public String getContent(){
      	return content;
      }


      //this is for type
      public void setType(String type)
      {
      	this.type=type;
      }

      public String getType(){
      	return type;
      }


      //this is for cssClass
      public void setCssClass(String cssClass)
      {
      	this.cssClass=cssClass;
      }
      public String getCssClass(){
            return cssClass;
      }

}