<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
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
    </style> </head>
<body>
    <center>
<!--  <font  style="font-size: 19px; color: white; font-family: arial,helvetica,sans serif;"> -->
       <p style="color:red"> <br> <a href="stud_index.jsp">Home</a> |  <a href="stud_RequestNewBook1.jsp">Request a new Book</a>  | 
           <a href="../student/stud_Return.jsp">Retrun a Book</a> 
        </p>
  </center>
 <br/> 
<form action="stud_BorrowedBook.jsp">

    <%
    
    String username=null;
    java.security.Principal principal = request.getUserPrincipal();
                if (principal != null) {
                    username= principal.getName(); // Find User by j_username.
                }
                     
    
    ResultSet rs=null;
	Connection con=null;
	Context ct=new InitialContext();
	DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");

	System.out.println("Got DataSource :-"+ds); 
	con=ds.getConnection();
	System.out.println("Connected to DataBase:-"+con);
	
	String query="select * from BorrowedBook where username='"+username+"'";
	
	PreparedStatement pstmt=con.prepareStatement(query);
	System.out.println("preperedStatement="+pstmt);
	
	
	rs= pstmt.executeQuery();

%>
 <center>
	 <font  style="font-size: 19px; color: black; font-family: arial,helvetica,sans serif;">
     Borrowed books 
  </font>
 <br><br>
  <table border="1">
  
  <tr bgcolor="#ddd"><td>Book ID</td><td>Book Name</td><td>Borrower Name</td></tr>
<%	
	while(rs.next())
	{
%>
        <tr bgcolor="#ddd"> 
        <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Id")%><br>
       </font>
       </td>
      <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Name")%><br>
       </font>
       </td>
       <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("username")%><br>
       </font>
       </td>
       </tr>
      
<% }  con.close();  %>
    </table>
    </center>
    </form>
</body>
</body>
</html>