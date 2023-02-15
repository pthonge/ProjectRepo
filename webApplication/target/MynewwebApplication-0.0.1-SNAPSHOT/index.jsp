<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="errorpage.jsp" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome to System</title>
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
<img src="Header.jpg" alt="img" width="100%" height="60" />
<%@ include file="header.html" %>

<center>
<!--<img src="contact.jpg"  style="margin: 0 auto;display:block;width:70%;height:70%" />-->
<font align="left" style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
<ul>
                        <ul><a href="index.jsp" ><span><span>Home</span></span></a> |
                        <a href="student/stud_index.jsp"><span><span>Student</span></span></a> |
                                <a href="/Web_Application/Admin/Admin_index.jsp">Administrator</a>  |
                                <a href="/Web_Application/showall.jsp">Show all Books</a>                                
</ul>
</ul>

</font>  
<!-- <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" >
   <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;" >
   <font align="center" style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font>
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
  
       <img align="right" src="contact.jpg"  style="margin: 0 auto;display:block;" />
       <b>Contact 

</b><br />
                                       T: 1-800-841-2031<BR>
T: 1-713-918-1371<BR>
F: 1-713-918-8000<BR>
General Online Form<BR>
       
       </div>
</div>
       
  <div align="left" class="separator1"  style="color: #0900C4; font: 12pt;" >
   <div align="left" class="rightfloat1"  style="color: #0900C4; font:  12pt;" >
   <font align="center" style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;"></font>
  <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p>
  
  
       <img align="left" width="500px" height="350px" src="Library_01.jpg"  style="margin: 0 auto;display:block;" />
  

</div>
</div> -->
</center>
</body>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.html" %>
</html>