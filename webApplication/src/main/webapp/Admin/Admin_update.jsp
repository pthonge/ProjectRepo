<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="../errorpage.jsp"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Data</title>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
<br/><br/>
<script language="javascript">
      function validateForm()
       {
	      var B_Id=document.forms["mainForm"]["id"].value;
	      var B_Pub=document.forms["mainForm"]["pub"].value;
	      
          if (B_Id==null || B_Id=="")
          {
            alert("Book Id must be filled out");
            return false;
          }
          if (B_Pub==null || B_Pub=="")
          {
            alert("Book Publication must be filled out");
            return false;
          }
       }	
</script>
</head>
<body>
<center>
  <font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
                                 <a href="Admin_index.jsp"><span><span>Home</span></span></a> |
                               <a href="Admin_AddNew.jsp"><span><span>Add New Book</span></span></a> |
                                <a href="Admin_Display.jsp">Show All Books</a> |
                                 <a href="Admin_BookRequest.jsp">Requested Book</a> |
                                 <a href="Admin_DeleteBook.jsp">Remove Book/Category</a> | 
                                 <a href="Admin_BorrowedBook.jsp">Issued Books</a>                                 
                                                                  

</font>  
  </center>
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
<!--     <div align="right" class="separator"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:12pt; font-family: arial,helvetica,sans serif; " > -->
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
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;font-family: arial,helvetica,sans serif; " > -->
<!--    <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome Administrator</font> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
<!--        <img align="left" width="500px" height="300px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
</div>
  <center> 
     <br/><br/>
<form name="mainForm" method="post" action="../update" onsubmit="return validateForm()">
   <font style="font-size: 20px; color: black; font-family: arial,helvetica,sans serif;">
    Fill the Following Details to update the book information</font>
    <br/><br/>
         <table border="1">
             <tr  bgcolor="#ddd">
                <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Book Id:</font></td><td><input type="text" name="id" /></td>
              </tr>
              <tr  bgcolor="#ddd">  
                <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Update available number of copies:</font></td><td><input type="text" name="copies" /></td>
               </tr>
          </table>      
          <br/>
     <center><input type="submit" value="Update" />   <a href="Admin_index.jsp"><input type="button" value="Cancel"/></center>       
          
	 </form>
   </center>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>