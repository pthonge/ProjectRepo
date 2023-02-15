<%@page import="com.library.student.ValidateSelectedBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Student</title>
<%@ include file="../header2.html" %>
<%-- <%@ include file="../header.html" %> --%>
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
    
    body {
    background-image: url("../student/abstract-blur-defocused-bookshelf-library.jpg");
background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
}
    </style> 
</head>
<body>
<%
   String username=null;
    java.security.Principal principal = request.getUserPrincipal();
                if (principal != null) {
                    username= principal.getName(); // Find User by j_username.
                }
                %>             
<%! boolean checkboxDisabled = false; %>
<div align="left">
<font align="left"  style="font-size: 25px; color: black; font-family: arial,helvetica,sans serif;"> Welcome, <%= username %> </font></div>
 <div align="right">
 <a href="../logout.jsp"><font align="left"  style="font-size: 25px; color: black; font-family: arial,helvetica,sans serif;">Logout </font></a> 
</div>
    <center>
<!--  <font  style="font-size: 19px; color: white; font-family: arial,helvetica,sans serif;"> -->
       <p style="color:red"> <br><a href="stud_RequestNewBook1.jsp">Request a new Book</a>  | 
           <a href="../student/stud_Return.jsp">Retrun a Book</a> |
           <a href="../student/stud_BorrowedBook.jsp">Borrowed Book</a>
        </p>
  </center>
 <br/> 

<!--  <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" >
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
</div>   -->
<!--  <div align="left" class="separator1"  style="color: #0900C4; font: 12pt;" >
   <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;" >
 
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
  
       <img align="left" width="500px" height="350px" src="../student/Library_01.jpg"  style="margin: 0 auto;display:block;" />
  

</div>
</div>  --> 
    <center>

    <form method="post" action="../servletDemo">
    
     
    <%
    
              
    
    	ResultSet rs=null;
		Connection con=null;
		Logger logger = Logger.getLogger("stud_index.jsp");
    	Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
		logger.info("dddd"+username);
		con=ds.getConnection();
		logger.debug("stud_index.jsp connected to database connection object:="+con);
		String query="select B_Id,B_Name,B_Author, B_Category, B_AvailableCopies from Books";
		Statement stmt=con.createStatement();
		rs=stmt.executeQuery(query);
   %>
         

 
       <font  style="font-size: 19px; color:black; font-family: arial,helvetica,sans serif;">
           Select any book of following!!!<br>
        </font>
    <br/> 
    <br/> 
        
        <table border="1">
        <tr bgcolor="#ddd"><td>Book Id</td><td>Book Name</td><td>Book Author</td><td>Book Category</td><td>Available Copies</td></tr>
   <% 		
		while(rs.next())
		{
		       
    %>
    <%
      boolean checkboxDisabled = false; 
       int num=rs.getInt("B_AvailableCopies");

       ValidateSelectedBook validate= new ValidateSelectedBook();
       System.out.println("rs.getInt(B_Id)=="+rs.getInt("B_Id"));
      boolean borrowedBook= validate.validateBook(rs.getInt("B_Id"), username);
      System.out.println("borrowedBook"+borrowedBook);
      String str1 = new Boolean(borrowedBook).toString();
       if((str1.equals("true"))){ 
           System.out.println("Inside disabled");

           checkboxDisabled=true; } else {checkboxDisabled=false; }
       
       if(num==0){ 
           System.out.println("Inside disabled");

           checkboxDisabled=true; }
     
       
     String checkboxState = checkboxDisabled ? "disabled" : "";
     System.out.println("checkboxState"+checkboxState);
     %>
         <tr bgcolor="#ddd"> 
         <td><font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <input type="checkbox" name="bname" value=<%=rs.getString("B_Id")%> <%=checkboxState%> /><%=rs.getString("B_Id")%>           

        <br>
       </font>
       </td>
        <td style='bg-color:red;'>  <font   style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Name")%><br>
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
<br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>
