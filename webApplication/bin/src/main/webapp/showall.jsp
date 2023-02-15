<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Guest User</title>
<%@ include file="../header2.html" %>
<%-- <%@ include file="../header.html" %>   --%>
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
    background-image: url("/Web_Application/abstract-blur-defocused-bookshelf-library.jpg");
background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
}
  
    </style> 
</head>
<body>

<br/> 
<!--  <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;" > -->
<!--    <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
  
  
<!--        <img align="right" src="contact.jpg"  style="margin: 0 auto;display:block;" /> -->
<!--        <b>Contact  -->

<!-- </b><br /> -->
<!-- T: 1-800-841-2031<BR> -->
<!-- T: 1-713-918-1371<BR> -->
<!-- F: 1-713-918-8000<BR> -->
<!-- General Online Form<BR> -->
       
<!--        </div> -->
<!-- </div>   -->
<!--  <div align="left" class="separator1"  style="color: #0900C4; font: 12pt;" > -->
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;" > -->
 
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
  
  
<!--        <img align="left" width="500px" height="350px" src="Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
</div>

<form action="showall.jsp">

    <%
    
    ResultSet rs=null;
	Connection con=null;
	Context ct=new InitialContext();
	DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");

	System.out.println("Got DataSource :-"+ds); 
	con=ds.getConnection();
	System.out.println("Connected to DataBase:-"+con);
	
	String query="select * from Books ";
	
	PreparedStatement pstmt=con.prepareStatement(query);
	System.out.println("preperedStatement="+pstmt);
	
	
	rs= pstmt.executeQuery();

%>
 <center>
	 <font  style="font-size: 19px; color: black; font-family: arial,helvetica,sans serif;">
     Available books 
  </font>
 <br><br>
  <table border="1">
  
  <tr bgcolor="#ddd"><td>Book Name</td><td>Book Author</td><td>Book publication</td></tr>
<%	
	while(rs.next())
	{
%>
        <tr bgcolor="#ddd"> 
        <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Name")%><br>
       </font>
       </td>
      <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Author")%><br>
       </font>
       </td>
       <td>  <font  style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
        <%=rs.getString("B_Publication")%><br>
       </font>
       </td>
       </tr>
      
<% }  con.close();  %>
    </table>
    </center>
    </form>
</body>
</html>