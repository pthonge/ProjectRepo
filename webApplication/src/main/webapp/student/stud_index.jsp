<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Student</title>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
<style type="text/css">
    .rightfloat
    {
        color: red;
        
        float: right;
        width: 400px;
        height:200px;
    }

    .separator {
        clear: both;
        float: right;
        width: 200;
        
    }
          .rightfloat1
    {
        clear: inherit;
        
        float: left;
        width: 400px;
        height:200px;
    }

    .separator1 {
        clear: inherit;
        float: left;
        width: 200;
        
    }
    </style> 
</head>
<body>
<%! boolean checkboxDisabled = false; %>

    <center>
 <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
           <br><a href="stud_RequestNewBook1.jsp">Request a new Book</a> | <a href="../student/stud_Return.jsp">Retrun a Book</a>
        </font>
  </center>
 <br/> 
 <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" >
   <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;" >
   <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font>
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
  
       <img align="right" src="../student/contact.jpg"  style="margin: 0 auto;display:block;" />
       <b>Contact 

</b><br />
T: 1-800-841-2031<BR>
T: 1-713-918-1371<BR>
F: 1-713-918-8000<BR>
General Online Form<BR>
       
       </div>
</div>  
 <div align="left" class="separator1"  style="color: #0900C4; font: 12pt;" >
   <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;" >
 
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
  
       <img align="left" width="500px" height="350px" src="../student/Library_01.jpg"  style="margin: 0 auto;display:block;" />
  

</div>
</div>  
    <center>

    <form method="post" action="../servletDemo">
    
     
    <%
    	ResultSet rs=null;
		Connection con=null;
		Logger logger = Logger.getLogger("stud_index.jsp");
    	Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
	
		con=ds.getConnection();
		logger.debug("stud_index.jsp connected to database connection object:="+con);
		String query="select B_Name,B_Author, B_Category, B_AvailableCopies from Books";
		Statement stmt=con.createStatement();
		rs=stmt.executeQuery(query);
		System.out.println("ddddddddddd");
   %>
         

 
       <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
           Select any book of following!!!<br>
        </font>
        
        <table border="1">
        <tr><td>Book Name</td><td>Book Author</td><td>Book Category</td><td>Available Copies</td></tr>
   <% 		
		while(rs.next())
		{
		       
    %>
    <%
      boolean checkboxDisabled = false; 
       int num=rs.getInt("B_AvailableCopies");
       if(num==0){ 
           checkboxDisabled=true; }
    
     String checkboxState = checkboxDisabled ? "disabled" : "";
     %>
         <tr> 
         <td><font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <input type="checkbox" name="bname" value=<%=rs.getString("B_Name")%> <%=checkboxState%> /><%=rs.getString("B_Name")%>           

        <br>
       </font>
       </td>
        <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Author")%><br>
       </font>
       </td>
      <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Category")%><br>
       </font>
       </td>
       <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_AvailableCopies")%><br>
       </font>
       </td>
       </tr>

   <%
     	}
		con.close();
   %>	
     
    </table>	
          <br>
    <input type="submit" value="submit" />
</form>
<br><br><br><br>
 
    
</center>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.html" %>
</html>
