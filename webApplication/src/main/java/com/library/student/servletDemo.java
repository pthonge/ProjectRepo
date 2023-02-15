package com.library.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		String BorroedBookName=null;
        Logger logger = Logger.getLogger(servletDemo.class);  
		String select[] = request.getParameterValues("bname"); 
	    logger.info("selected books:");
	    
	    String username=null;
	    java.security.Principal principal = request.getUserPrincipal();
	                if (principal != null) {
	                    username= principal.getName(); // Find User by j_username.
	                }

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
                    PreparedStatement pstmt=null;
                    String B_name=null;

                    for (int i = 0; i < select.length; i++) {
                        
                        String selectQuery="select B_Name from Books where B_Id='"+select[i]+"'";
                        pstmt=con.prepareStatement(selectQuery);
                        ResultSet rs= pstmt.executeQuery();
                        while(rs.next())
                        { 
                            B_name=rs.getString("B_Name");
                        }
                        
                        
                        String insertQuery="insert into BorrowedBook(username,B_Id,B_Name) values(?,?,?);";
                        pstmt=con.prepareStatement(insertQuery);
                        pstmt.setString(1, username);
                        pstmt.setInt(2,Integer.parseInt(select[i]));
                        pstmt.setString(3, B_name);
                        
                        int count=pstmt.executeUpdate();                        
                        String query="update Books set B_AvailableCopies=B_AvailableCopies-1 where B_Id='"+select[i]+"'";
                        logger.info("Updating DB records with query "+query);
                        logger.info("count="+count);
                       
                                
                    pstmt=con.prepareStatement(query);
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
