<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"  errorPage="errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script language="javascript">
      function validateForm()
       {
	      var uName=document.forms["mainForm"]["j_username"].value;
	      var psswrd=document.forms["mainForm"]["j_password"].value;
          if (uName==null || uName=="")
          {
            alert("Enter Username");
            return false;
          }
          if (psswrd==null || psswrd=="")
          {
            alert("Enter Password");
            return false;
          }
       }	
</script>
<head><title>Login</title>
</head>
 <body>
 <%@ include file="header2.html" %>
<%@ include file="header.html" %>   
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
 
<!-- <div align="right" class="separator"  style="color: #0900C4; font: 12pt;" > -->
<!--    <div align="right" class="rightfloat"  style="color: #0900C4; font:  12pt;" > <br/><br/> -->
<!--    <font  style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">Welcome</font> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->

  
<!--        <img align="right" src="/Web_Application/contact.jpg"  style="margin: 0 auto;display:block;" /> -->
<!--        <b>Contact  -->

<!-- </b><br /> -->
<!-- T: 1-800-841-2031<BR> -->
<!-- T: 1-713-918-1371<BR> -->
<!-- F: 1-713-918-8000<BR> -->
<!-- General Online Form<BR> -->
       
<!--        </div> -->
<!-- </div> -->
<!-- <align="center"  style="color: #0900C4; font: 12pt;"> -->
<!--    <div align="left" class="rightfloat1"  style="color: #0900C4; font: 12pt;" > -->
<!--   <br/><br/> -->
<!--   <p>For the first time in history, the Digital Library of India is digitizing all the significant  works of Mankind.</p> -->
 
  
<!--        <img align="left" width="500px" height="350px" src="/Web_Application/Library_01.jpg"  style="margin: 0 auto;display:block;" /> -->
  

<!-- </div> -->
<div align="justify">
 <a href="../NewUserRegister.jsp">New user ? Sign up here </a> 
 </div>
<font style="font-size: 20px; color: rgb(102, 102, 255); font-family: arial,helvetica,sans serif;">
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
 
 <form name="mainForm" method="Post" action="j_security_check" onsubmit="return validateForm()"  > <!--  -->
  <center>
                       
	                      <font style="font-size: 20px; color: black; font-family: arial,helvetica,sans serif;">
Enter user ID and password: </font>
                         <br><br><table border="1">
                        <tr bgcolor="#ddd"><td> <strong> User ID</strong></td><td> <input type="text" size="20" name="j_username" /><br></td></tr>
                        <tr bgcolor="#ddd"><td>  <strong> Password </strong></td><td><input type="password" size="20" name="j_password" /></td></tr>
                         </table>
                         <br> 
                         <input type="submit"  value="Sign in" />
                         </center>
                   </form>

</font>
       </body>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%-- <%@ include file="../footer.html" %> --%>
</html>
