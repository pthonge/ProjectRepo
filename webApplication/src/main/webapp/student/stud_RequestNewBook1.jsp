<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" errorPage="../errorpage.jsp"  import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
      function validateForm()
       {
	      var B_Name=document.forms["mainForm"]["B_Name"].value;
	      var B_Pub=document.forms["mainForm"]["B_Publication"].value;
          if (B_Name==null || B_Name=="")
          {
            alert("Book Name must be filled out");
            return false;
          }
          if (B_Pub==null || B_Pub=="")
          {
            alert("Book Publication must be filled out");
            return false;
          }
       }	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request a new Book </title>

<%@ include file="../header2.html" %>
<%-- <%@ include file="../header.html" %> --%>
</head>
<body>   
<%
   String username=null;
    java.security.Principal principal = request.getUserPrincipal();
                if (principal != null) {
                    username= principal.getName(); // Find User by j_username.
                }
                %> 
                
<center>
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
    <center>
 <font align="right" style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
           <br><a href="stud_index.jsp">Home</a> | <a href="stud_Return.jsp">Return Book</a> |
                      <a href="../student/stud_BorrowedBook.jsp">Borrowed Book</a>
        </font>
        </center>
<!-- <div align="right" class="separator"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif; " > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;font-family: arial,helvetica,sans serif;" > -->
<!--    <font align="center" style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font> -->
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
<!--   <div align="left" class="separator1"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" > -->
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt; font-family: arial,helvetica,sans serif;" > -->
 
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
  
  
<!--        <img align="left" width="510px" height="400px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
<!-- </div>  -->
     <form name="mainForm" action="../RequestBook" method="post" onsubmit="return validateForm()">
     <br/><br/><br/>
     <font  style="font-size: 19px; color:black; font-family: arial,helvetica,sans serif;">
           Request a new  Book
     </font>
     <br/>     <br/>
     
      <table border="1">         
               <tr bgcolor="#ddd">
                <td><font style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter Book Name</font></td><td><input type="text" name="B_Name"></td>
      	      </tr> 
              <tr bgcolor="#ddd">
                <td><font style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter Book Publication</font></td><td><input type="text" name="B_Publication"></td>
      	      </tr>
	         
          </table>
          <br>
           <input type="submit" value="submit" /> <a href="stud_index.jsp"><input type="button" value="Cancel"></a>

       
     </form>                                                                                            
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>