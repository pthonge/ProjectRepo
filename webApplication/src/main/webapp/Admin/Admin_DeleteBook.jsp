<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"  errorPage="../errorpage.jsp"%>
<%@ page import="java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remove Book</title>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
<br><br>
<script language="javascript">
      function validateForm()
       {
	      var B_Id=document.forms["mainForm"]["B_Id"].value;
	      var B_Category=document.forms["mainForm"]["B_Category"].value;
	      
          if (B_Id==null || B_Id=="")
          {
            alert("Book Id must be filled out");
            return false;
          }
          if (B_Category==null || B_Category=="")
          {
            alert("Book Category must be filled out");
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
                                <a href="Admin_update.jsp">Update Book Status</a> |
                                <a href="Admin_Display.jsp">Show All Books</a> |
                                 <a href="Admin_BookRequest.jsp">Requested Book</a> |
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
<!--     <div align="right" class="separator"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" >
   <div align="right" class="rightfloat"  style="color: #0900C4; font:12pt; font-family: arial,helvetica,sans serif; " >
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
     <img align="right" src="../contact.jpg"  style="margin: 0 auto;display:block;" />
       <b>Contact 

</b><br />
T: 1-800-841-2031<BR>
T: 1-713-918-1371<BR>
F: 1-713-918-8000<BR>
General Online Form<BR>
       
       </div>
</div>
  <div align="left" class="separator1"  style="color: #0900C4; font: 12pt; font-family: arial,helvetica,sans serif;" >
   <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;font-family: arial,helvetica,sans serif; " >
   <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome Administrator</font>
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
       <img align="left" width="500px" height="300px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" />
  

</div> -->
</div>
  <form name="mainForm" method="Post" action="../AdminDeleteBook" "> <!--  onsubmit="return validateForm() -->
    <center>
    <br/><br/><br/>
			<table border="1">
				<tbody>
				<thead>
					<font style="font-size: 19px; color: black; font-family: arial, helvetica, sans serif;">Enter
						below Details to remove Book</font>
				</thead>
<br/><br/>
				<tr bgcolor="#ddd">
					<td><font
						style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the Book Id</font></td>
					<td><input type="text" name="B_Id" /></td>
				</tr>
				<tr bgcolor="#ddd">
					<td><font
						style="font-size: 15px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the Book Categoty</font></td>
					<td><input type="text" name="B_Category" /></td>
				</tr>
				</tbody>
			</table>
			<center>
			<br>
      <input type="submit" value="Delete">     <a href="Admin_index.jsp"><input type="button" value="Cancel" />
</a>  
      
</center>            
  <% HttpSession session=request.getSession(false);
  
     System.out.println("Session Id[******AddNew*******]:-"+session.getId()); %>  
<!-- <a href="../logout.jsp">Logout1</a> -->
</center>
</form>              
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>