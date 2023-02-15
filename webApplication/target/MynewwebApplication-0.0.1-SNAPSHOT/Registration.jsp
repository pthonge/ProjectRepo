<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"  errorPage="../errorpage.jsp"%>
<%@ page import="java.util.*,java.sql.*,javax.naming.*,javax.sql.DataSource,java.net.*,org.apache.log4j.xml.DOMConfigurator,org.apache.log4j.Logger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header2.html" %>
<%@ include file="../header.html" %>
<br/><br>
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
	background-image:
		url("/Web_Application/abstract-blur-defocused-bookshelf-library.jpg");
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}
    </style>
   <br>
 
 
<%
		Connection con = null;
     //   PrintWriter out = response.getWriter();

		Logger logger = Logger.getLogger("NewUserRegistration.jsp");
		Context ct = new InitialContext();
		DataSource ds = (DataSource) ct.lookup("java:jboss/MySqlDS");
		String fName = request.getParameter("email");
		logger.info("fname==========" + fName);

		con = ds.getConnection();
		logger.debug("stud_index.jsp connected to database connection object:=" + con);
		String query="insert into Security(username, password,role,firstName,lastName,email) values(?,?,?,?,?,?) ";
        PreparedStatement pstmt=con.prepareStatement(query);

	     pstmt.setString(1,request.getParameter("uName"));
	     pstmt.setString(2,request.getParameter("password"));
	     pstmt.setString(3,request.getParameter("role"));
         pstmt.setString(4,request.getParameter("fName"));
         pstmt.setString(5,request.getParameter("lName"));
         pstmt.setString(6,request.getParameter("email"));
	    int rs=pstmt.executeUpdate();
	    
	    if(rs>0)
	       {
	        
	        out.println("<html><body><center>");
	    	 
	    	 response.setContentType("text/html");
               out.println("<script type=\"text/javascript\">");
               out.println("alert('User Registered Successfully');");
               out.println("window.location.href = 'index.jsp';");
               out.println("</script>");

	
			
	        } else { 
             out.println("<html><body><center>");
	 			    	 
	 			    	 response.setContentType("text/html");
	 		               out.println("<script type=\"text/javascript\">");
	 		               out.println("alert('Exception encountered during user registration process. Try again later');");
	 		               out.println("window.location.href = 'index.jsp';");
	 		               out.println("</script>");
	        }

		con.close();
		HttpSession session=request.getSession(false);
		 
  %>
	 
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.html" %>
</html>