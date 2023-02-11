package com.library.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

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
 * Servlet implementation class AddNew
 */
public class AddNewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    int rs;
		   Connection con=null;
           Logger logger = Logger.getLogger(AddNewBook.class);

           PrintWriter out = response.getWriter();
           String B_Id = request.getParameter("B_Id");
           String B_Name = request.getParameter("B_Name");
           String B_Author = request.getParameter("B_Author");
           String B_Pub = request.getParameter("B_Pub");
           String B_category = request.getParameter("B_category");
           String B_availableCopies = request.getParameter("B_availableCopies");
		   
		   try {
			     Context ct=new InitialContext();

			     DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
 
			     logger.debug("Got DataSource :-"+ds); 
			     con=ds.getConnection();
			     logger.info("Conntected to Database"+con); 
			     String query="insert into Books(B_Name,B_Author,B_Publication,B_Category,B_AvailableCopies) values(?,?,?,?,?)";
			     PreparedStatement pstmt=con.prepareStatement(query);
			     //logger.debug("Book id by user:--"+B_Id);
	             logger.debug("Book Name Entered by user:--"+B_Name);
	             logger.debug("Book Author Entered by user:--"+B_Author);
	             logger.debug("Book publication Entered by user:--"+B_Pub);
	             logger.debug("Book category Entered by user:--"+B_category);
	             logger.debug("Book available copies Entered by user:--"+B_availableCopies);
			     //pstmt.setString(1,B_Id);
			     pstmt.setString(1,B_Name);
			     pstmt.setString(2,B_Author);
			     pstmt.setString(3,B_Pub);
                 pstmt.setString(4,B_category);
                 pstmt.setString(5,B_availableCopies);

			     
			     rs=pstmt.executeUpdate();
			   
			     if(rs>0)
			       {
			    	 logger.debug("result set:-"+rs);  
			    	 out.println("<html><body><center>");
			    	 
			    	 response.setContentType("text/html");
		                out.println("<script type=\"text/javascript\">");
		                out.println("alert('New Book Added to System');");
		                out.println("window.location.href = 'Admin/Admin_index.jsp';");
		                out.println("</script>");
			    	 }
			     
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLIntegrityConstraintViolationException e) {
			 out.println("Id number of book is already exist in system try again...:( ");
			 out.println("<a href=Admin/Admin_index.jsp>Back</a>");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 out.println("<html><body><head><title>Login</title>");
             out.println("<%@ include file=\"../header2.jsp\" %>");
             out.println("<%@ include file=\"../header.jsp\" %>");
             out.println("</head><center>");
			//out.println("Enter the Correct input.Try again to Add new the info...:( ");
			 out.println(""+e.getMessage());
			 out.println("<br>");
			 out.println("Id number of book is already exist in system try again...:( ");
	    	 out.println("<a href=Admin/Admin_index.jsp>Back</a>");
		}  
		
		catch (Exception e) {
			out.println("Error occured during processing Try Again ");
			out.println("<a href=Admin/Admin_index.jsp>Back</a>");
		}
		 
		finally
		{
			   try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			out.println("</center></body></html>");
	    }
	}

}
