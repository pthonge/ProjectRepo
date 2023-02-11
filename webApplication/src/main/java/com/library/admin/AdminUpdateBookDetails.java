package com.library.admin;

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
 * Servlet implementation class update
 */
public class AdminUpdateBookDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateBookDetails() {
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
		   PrintWriter out=response.getWriter();
		   String B_Id=request.getParameter("id");
		   String B_availableCopies=request.getParameter("copies");
		   
		   try {
			Logger logger = Logger.getLogger(AdminUpdateBookDetails.class);
			 logger.debug("Logging from update info servlet ");
			   Context ct=new InitialContext();
			   
			   DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
			   
			   con=ds.getConnection();
			   logger.debug("Updating copies of book with bookID "+B_Id+"to "+B_availableCopies);
			   logger.debug("Conntected to Database"+con); 
			   String query="update Books set B_AvailableCopies=? where B_Id=?";
			   PreparedStatement pstmt=con.prepareStatement(query);
			   System.out.println(query);
			   System.out.println("B_id="+B_Id);
			   System.out.println("b_pub="+B_availableCopies);
			   
			   pstmt.setString(1,B_availableCopies);
			   pstmt.setString(2,B_Id);
			   
			   rs=pstmt.executeUpdate();
			   System.out.println("rs="+rs); 
			   out.println("<html><body><center>");
			   if(rs>0)
		       {
		    	 logger.debug("result set of update operation="+rs);  
		    	    response.setContentType("text/html");
	                out.println("<script type=\"text/javascript\">");
	                out.println("alert('Book status updated.');");
	                out.println("window.location.href = 'Admin/Admin_index.jsp';");
	                out.println("</script>");
		       }
		     else
		      {
		         
		         response.setContentType("text/html");
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Use Correct bookId and try again to update the status.');");
                 out.println("window.location.href = 'Admin/Admin_index.jsp';");
                 out.println("</script>");		         
		      }	 
			   out.println("</body></html>");
			   } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally
		{
			 try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
