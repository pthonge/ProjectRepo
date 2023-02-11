package com.library.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class ReturnBook
 */
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
	      PrintWriter out=response.getWriter();	    
	    try {
            Context ct=new InitialContext();
            DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
            int rs;
            Connection con=null;
            Logger logger = Logger.getLogger(ReturnBook.class);
            
            String B_Id=request.getParameter("B_Id");
            String B_Name=request.getParameter("B_Name");

            if(B_Id.isBlank() && B_Name.isBlank()) {
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('BookId and BookName cant be empty');");
                out.println("window.location.href = 'student/stud_index.jsp';");
                out.println("</script>");
                return;
            }
            
            System.out.println("Got DataSource :-"+ds); 
            con=ds.getConnection();
            logger.debug("User connected to database connection object:="+con);
            String query="update Books set B_AvailableCopies=B_AvailableCopies+1 where B_Name='"+B_Name+"'and B_Id='"+B_Id+"'";
            logger.info("Return book query statement:="+query);
            PreparedStatement pstmt=con.prepareStatement(query);
           int i= rs=pstmt.executeUpdate();
           if(i==0) {
               response.setContentType("text/html");
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Enter valid BookId and BookName');");
               out.println("window.location.href = 'student/stud_index.jsp';");
               out.println("</script>");
               return;
           }

        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	    
	    
	    response.setContentType("text/html");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Book return request places sucessfully');");
        out.println("window.location.href = 'student/stud_index.jsp';");
        out.println("</script>");
	    
	}  

}
