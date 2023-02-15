<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator</title>
</head><br/>
<body>
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
            body {
    background-image: url("../Admin/abstract-blur-defocused-bookshelf-library.jpg");
background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
}
    </style>
<%
   String username=null;
    java.security.Principal principal = request.getUserPrincipal();
                if (principal != null) {
                    username= principal.getName(); //  
                }
                %>             
<div align="left">
<font align="left"  style="font-size: 25px; color: black; font-family: arial,helvetica,sans serif;"> Welcome, <%= username %> </font></div>
 <div align="right">
 <a href="../logout.jsp"><font align="left"  style="font-size: 25px; color: black; font-family: arial,helvetica,sans serif;">Logout </font></a> 
</div>


<!-- <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;" > -->

<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
  
  
<!--        <img align="right" src="../contact.jpg"  style="margin: 0 auto;display:block;" /> -->
<!--        <b>Contact  -->

<!-- </b><br /> -->
<!-- T: 1-800-841-2031<BR> -->
<!-- T: 1-713-918-1371<BR> -->
<!-- F: 1-713-918-8000<BR> -->
<!-- General Online Form<BR> -->
       
<!--        </div> -->
<!-- </div> -->
       
<!--   <div align="left" class="separator1"  style="color: #0900C4; font: 12pt;" > -->
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;" > -->
<!--       <font align="center" style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
  
<!--   <br/> -->
<!--        <img align="left" width="500px" height="350px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
<!-- </div> -->
<center>
  <font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">

 
                               <a href="Admin_AddNew.jsp"><span><span>Add New Book</span></span></a> |
                                <a href="Admin_update.jsp">Update Book Status</a> |
                                <a href="Admin_Display.jsp">Show All Books</a> |
                                 <a href="Admin_BookRequest.jsp">Requested Book</a> |
                                 <a href="Admin_DeleteBook.jsp">Remove Book/Category</a> |
                                 <a href="Admin_BorrowedBook.jsp">Issued Books</a>                                 

</font>  
  </center>
  <% 
     Logger logger = Logger.getLogger("Admin_index.jsp");
     logger.info("Admin_index.jsp SessionID:-"+session.getId());
  %>  
<!-- <a href="../logout.jsp">Logout</a> -->
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>