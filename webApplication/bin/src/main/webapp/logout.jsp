<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
<img src="Header.jpg" alt="img" width="100%" height="60" />
</head>
<body>
       <%
           HttpSession session=request.getSession(true);
            if(session!=null)
            	 out.println("Session Id:-"+session.getId()); 
              System.out.println("Session Id[from Logout jsp]:-"+session.getId()); 
            	 session.invalidate();
            out.println("LogedOut");
          %>
          <jsp:forward page="index.jsp" />
</body>
</html>