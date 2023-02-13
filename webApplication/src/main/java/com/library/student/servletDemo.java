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
 * 
 * Servlet implementation class servletDemo
 */
public class servletDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletDemo() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
	 {
		// TODO Auto-generated method stub
		Connection con=null;
		PrintWriter out=response.getWriter();
        Logger logger = Logger.getLogger(servletDemo.class);  
		String select[] = request.getParameterValues("bname"); 
	    logger.debug("selected books:"+select);

		 out.println("<html><body><center>");

		if (select != null )
		{
		    if( select.length >2)
		    {
		    	out.println("you cant select more than two book");
				out.println("<a href=student/stud_index.jsp>Back</a>");
				response.setContentType("text/html");  
               // out.println("<script type=\"text/javascript\"> alert(You cant select more"+na+"than two book);");
				 out.println("<script type=\"text/javascript\">");
                out.println("alert('You cant select more than two book');"); 
                out.println("window.location.href = 'student/stud_index.jsp';");
                out.println("</script>");
		    } else {

		        
	           Context ct = null;
                try {
                    ct = new InitialContext();
                    DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
                    con=ds.getConnection();
                    for (int i = 0; i < select.length; i++) {
                        String query="update Books set B_AvailableCopies=B_AvailableCopies-1 where B_Id='"+select[i]+"'";
                        logger.info("Updating DB records with query "+query);
                    PreparedStatement pstmt=con.prepareStatement(query);
                    pstmt.executeUpdate();
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
                out.println("alert('Collect book from counter within two Days!!');");
                out.println("window.location.href = 'student/stud_index.jsp';");
                out.println("</script>");
	                   
		     }
		}  
		 else
		   {
			 response.setContentType("text/html");
             out.println("<script type=\"text/javascript\">");
             out.println("alert('You have to select atleast one book');");
             out.println("window.location.href = 'student/stud_index.jsp';");
             out.println("</script>");			
			 
		  }
		
		out.println("</font></center></body></html>");
		}
      }
