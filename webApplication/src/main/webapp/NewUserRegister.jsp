<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" errorPage="../errorpage.jsp"%>
<%@ page
	import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register User</title>
<script language="javascript">
	function validateForm() {
		var uName = document.forms["mainForm"]["uName"].value;
		var psswrd = document.forms["mainForm"]["password"].value;
		var fName = document.forms["mainForm"]["fName"].value;
		var lName = document.forms["mainForm"]["lName"].value;
		var email = document.forms["mainForm"]["email"].value;
		var role = document.forms["mainForm"]["role"].value;

		if (fName == null || fName == "") {
			alert("First Name must be entered");
			return false;
		}
		if (lName == null || lName == "") {
			alert("Last Name must be entered");
			return false;
		}

		if (uName == null || uName == "") {
			alert("UserName must be entered");
			return false;
		}
		if (psswrd == null || psswrd == "") {
			alert("Password must be entered");
			return false;
		}
		if (role == null || role == "") {
			alert("Role Name must be entered");
			return false;
		}
		

		if (email == null || email == "") {
			alert("Email must be entered");
			return false;
		}
 	 
	}
	 /* function validateEmail(emailField) {
		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		document.write(emailField);
		if (reg.test(emailField.value) == false) {
			alert('Invalid Email Address');
			return false;
		}

		return true;

	}   */
</script>
</head>
<body>
	<%@ include file="../header2.html"%>
	<%@ include file="../header.html"%>
	<br />
	<style type="text/css">
.rightfloat {
	color: red;
	float: right;
	width: 400px;
	height: 200px;
}

.separator {
	clear: both;
	float: right;
	width: 200;
}

.rightfloat1 {
	clear: inherit;
	float: left;
	width: 400px;
	height: 200px;
}

.separator1 {
	clear: inherit;
	float: left;
	width: 200;
}

body {
	background-image:
		url("/Web_Application/abstract-blur-defocused-bookshelf-library.jpg");
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}
</style>
	<br> 
	<form name="mainForm" method="post" action="Registration.jsp"  onsubmit="return validateForm()">
		<center>
			<br />
			<br />
			<br />
			<br />
			<br />
			<table border="1">
				<thead>
					<font
						style="font-size: 19px; color: black; font-family: arial, helvetica, sans serif;">
						Enter Below Details to Register userself!!!</font>
				</thead>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the First Name</font></td>
					<td><input type="text" name="fName" /></td>
				</tr>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the last Name</font></td>
					<td><input type="text" name="lName" /></td>
				</tr>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the User Name</font></td>
					<td><input type="text" name="uName" /></td>
				</tr>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the password</font></td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							the email Id</font></td>
					<td><input type="text" name="email"/></td>
				</tr>
				<tr bgcolor="#ddd">

					<td><font
						style="font-size: 19px; color: rgb(102, 102, 255); font-family: arial, helvetica, sans serif;">Enter
							Role Name</font></td>
					<td><input type="text" name="role" /></td>
				</tr>
			</table>
			<br /> <input type="submit" value="Submit"> <a href="index.jsp"><input type="button" value="Cancel"/>
		</center>
	</form>
</body>



<br>
<br>
<br>
<%-- <%@ include file="../footer.html"%> --%>
</html>