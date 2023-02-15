<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"  errorPage="../errorpage.jsp"%>
<%@ page import="java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
      function validateForm()
       {
	
	      var B_Name=document.forms["mainForm"]["B_Name"].value;
	      var B_Author=document.forms["mainForm"]["B_Author"].value;
	      var B_Pub=document.forms["mainForm"]["B_Pub"].value;
	      var B_Category=document.forms["mainForm"]["B_Category"].value;
	      var B_AvailableCopies=document.forms["mainForm"]["B_AvailableCopies"].value;
       
          if (B_Name==null || B_Name=="")
          {
            alert("Book name must be provided");
            return false;
          }
          if (B_Author==null || B_Author=="")
          {
            alert("Book Author must be provided");
            return false;
          }
          if (B_Pub==null || B_Pub=="")
          {
            alert("Book Publication must be provided");
            return false;
          }
          if (B_Category==null || B_Category=="")
          {
            alert("Book category must be provided");
            return false;
          }
          if (B_AvailableCopies==null || B_AvailableCopies=="")
          {
            alert("Book available copies must be provided");
            return false;
          }
       }	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Book</title>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>

</head>
<body>
<center>
  <font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
                               <a href="Admin_index.jsp"><span><span>Home</span></span></a> |
                                <a href="Admin_update.jsp">Update Book Status</a> |
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
</div>
  <form name="mainForm" method="Post" action="../AddNewBook" onsubmit="return validateForm()">
    <center>
    <br/><br/><br/> 
    <font style="font-size: 19px; color: black; font-family: arial,helvetica,sans serif;">Fill the Following Details to Add New Book</font>
    <br/><br/>
      <table border=1>
         <tbody>
           <thead></thead>
        
<!--             <tr>
              <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Book Id</font></td><td><input type="text" name="B_Id" /></td>
            </tr>  --> 
            <tr bgcolor="#ddd">
                  <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Book Name</font></td><td><input type="text" name="B_Name" /></td>
             </tr>
             <tr bgcolor="#ddd">     
               <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Author name</font></td><td><input type="text" name="B_Author" /></td>
              </tr>
              <tr bgcolor="#ddd">
                 <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Book Publication</font></td><td><input type="text" name="B_Pub" /></td>
              </tr>
               <tr bgcolor="#ddd">
                 <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the Book Category</font></td><td><input type="text" name="B_Category" /></td>
              </tr>
             <tr bgcolor="#ddd">
                 <td><font color="red">*</font><font  style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Enter the number of Available Copies</font></td><td><input type="text" name="B_AvailableCopies" /></td>
              </tr>
                     
</tbody>
</table>
 <center>
 <br/><br/>
      <input type="submit" value="submit">   <a href="Admin_index.jsp"><input type="button" value="Cancel"/>
 
</a>  
      
</center>            
  <% HttpSession session=request.getSession(false);
  
     System.out.println("Session Id[******AddNew*******]:-"+session.getId()); %>  
<!-- <a href="../logout.jsp">Logout1</a> -->
</center>
</form>              
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.html" %>
</html>