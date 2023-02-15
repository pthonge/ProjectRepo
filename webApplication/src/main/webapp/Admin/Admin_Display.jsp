<%@ page import="java.util.*,com.library.admin.DisplayAll" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="../errorpage.jsp" %>
    <!--<jsp:useBean id="AdminObj" class="com.library.admin.DisplayAll"> </jsp:useBean> -->  
<jsp:setProperty property="*" name="AdminObj" />  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book in Records</title>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
</head>
<body>
<br/><br/>
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
<!--    <br/> -->
<!--        <img align="left" width="400px" height="300px" src="../Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
<!-- </div> -->
<center>
  <font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
                                  <a href="Admin_index.jsp"><span><span>Home</span></span></a> |
                               <a href="Admin_AddNew.jsp"><span><span>Add New Book</span></span></a> |
                                <a href="Admin_update.jsp">Update Book Status</a> |
                                 <a href="Admin_BookRequest.jsp">Requested Book</a> |
                                 <a href="Admin_DeleteBook.jsp">Remove Book/Category</a> |
                                 <a href="Admin_BorrowedBook.jsp">Issued Books</a>                                 
                                                                 

</font>  
  </center> 
  
<form action="Admin_Display.jsp" method="post">

<br/><br/><br/>

<%
                    
                   		Vector<DisplayAll> allRecords = AdminObj.displayAllRecords();
                   		if(allRecords!=null)
                    	  {
                         	 System.out.println("In True");
                         	 System.out.println("Session ID is "+session.getId()); 
                        	 System.out.println("allRecords = "+allRecords);

                     %>
                         <center>
                         <font  style="font-size: 20px; color: black;font-family: arial,helvetica,sans serif;">
                                     Available Books!!!! 
                         </font><br><br>
                        	<table border="1">
                        	<tr bgcolor="#ddd">
                        	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book ID</font></td>
                        	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Name</font></td>
                        	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Author</font></td>
                        	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Publication</font></td>
                                 <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Book Category</font></td>
                        	     <td><font  style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Available copies</font></td>
                        	     
                        	</tr>
                         </center>	
                     <%   	for(int i=0;i<allRecords.size();i++)
                        	{	
                    %>	 
                            
                        	<tr bgcolor="#ddd">
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%= allRecords.get(i).getB_ID()%></font></td>
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=allRecords.get(i).getB_Name()%></font></td>
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=allRecords.get(i).getB_Author()%></font></td>
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=allRecords.get(i).getB_Pub()%></font></td>
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=allRecords.get(i).getB_Category()%></font></td>
                        	        <td><font style="font-size: 20px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;"><%=allRecords.get(i).getAvailable_copies()%></font></td>                        	        
                        	 </tr>
                      <% }%>
                      <center></center>
                        	</table>	
                        </center>	
                <% } else {  %> 
                     
                     <font style="font-size: 15px; color: rgb(102, 102, 255);font-family: arial,helvetica,sans serif;">Try again Error Occured...</font>
             <%  }   %> 
           
</form>

</body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>