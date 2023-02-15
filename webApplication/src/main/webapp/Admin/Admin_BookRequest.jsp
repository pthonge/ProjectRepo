<%@page import="java.io.PrintWriter"  errorPage="errorpage.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
 <%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Requested Book</title>
</head>
<body>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
<br/>
<center>
  <font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
                                    <a href="Admin_index.jsp"><span><span>Home</span></span></a> |
                                 <a href="Admin_AddNew.jsp"><span><span>Add New Book</span></span></a> |
                                <a href="Admin_update.jsp">Update Book Status</a> |
                                <a href="Admin_Display.jsp">Show All Books</a> |
                                <a href="Admin_DeleteBook.jsp">Remove Book/Category</a> |
                                <a href="Admin_BorrowedBook.jsp">Issued Books</a>                                 
                                
                                                                 

</font>  
  </center>
 <br/> 
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
    background-image: url("../Admin/abstract-blur-defocused-bookshelf-library.jpg");
background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
}
    </style>
<!-- <div align="right" class="separator"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:12pt; font-family: arial,helvetica,sans serif; " > -->
<!--    <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
<!--      <img align="right" src="../contact.jpg"  style="margin: 0 auto;display:block;" /> -->
<!--        <b>Contact  -->

<!-- </b><br /> -->
<!-- T: 1-800-841-2031<BR> -->
<!-- T: 1-713-918-1371<BR> -->
<!-- F: 1-713-918-8000<BR> -->
<!-- General Online Form<BR> -->
       
<!--        </div> -->
<!-- </div> -->
<!--   <div align="left" class="separator1"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" > -->
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;font-family: arial,helvetica,sans serif; " > -->
<!--    <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome Administrator</font> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
<!--        <img align="left" width="500px" height="300px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
<!-- </div> -->
 <form action="Admin_BookRequest.jsp">
 
 <%
         
        Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
		ResultSet rs;
		Connection con=null;
		Logger logger = Logger.getLogger("Admin_BookRequest.sp");
		logger.debug(new java.util.Date()+"Logging from [**************Admin_BookRequest.jsp*************]");
    	
	    
		System.out.println("Got DataSource :-"+ds); 
		con=ds.getConnection();
		logger.debug(new java.util.Date()+"User connected to database connection object:="+con);
		System.out.println("Connected to DataBase:-"+con);
		String query="select * from RequestedBooks";
	    PreparedStatement pstmt=con.prepareStatement(query);
	    logger.debug(new java.util.Date()+"[**Stud_Request.jsp**]Query Executed in dataBase"+query);
	 %>
	    
	        <center>
	        <font  style="font-size: 20px; color: black;font-family: arial,helvetica,sans serif;">
	                       Book Requested by students!!!!!
	        </font>
	        <br/><br/></center><center>
	        
               	<table border="1">
                     <tr bgcolor="#ddd">
                      	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Name</font></td>
                      	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Publication</font></td>
                     </tr>
             </center>
	 <%   
		rs=pstmt.executeQuery();
		while(rs.next())
		{	  
	%>  
		 <tr bgcolor="#ddd">
		     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=rs.getString(1) %></font></td>
		    <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=rs.getString(2) %></font></td>
		  </tr>
	<%		
		}
	%>	
	</table>
		  
	<%    con.close();
		/* HttpSession session=request.getSession(false);
		if(session != null)
		{
		   System.out.println("Session id[**Admin_BookRequest.jsp**]"+session.getId());
		   logger.debug(new java.util.Date()+"Session id[**servletDemo[index]**]"+session.getId());
		   System.out.println("session.getAttribute:="+session.getAttribute("uName"));
		}
		else
		{ */
   %>
       <!--  <h5>Login to System first to access</h5>
        <a href="student/stud_index.jsp">To login click Here</a>
         -->
<%--    <% 
		}
   %>  --%>  
 </form>

</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%--  <%@ include file="../footer.html" %> --%>
</html>