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
 * Servlet implementation class AdminDeleteBook
 */
public class AdminDeleteBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteBook() {
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
        doGet(request, response);

        int rs = 0;
        Connection con = null;
        Logger logger = Logger.getLogger(AdminDeleteBook.class);

        PrintWriter out = response.getWriter();
        String B_Id = request.getParameter("B_Id");
        String B_category = request.getParameter("B_Category");

        try {
            Context ct = new InitialContext();

            DataSource ds = (DataSource) ct.lookup("java:jboss/MySqlDS");

            logger.debug("Got DataSource :-" + ds);
            con = ds.getConnection();
            logger.info("Conntected to Database" + con);
            String query = "DELETE FROM Books WHERE B_Id=? OR B_Category=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            logger.info("Book id entered by user:--" + B_Id);
            logger.info("Book category entered by user:--" + B_category);
            pstmt.setString(1, B_Id);
            pstmt.setString(2, B_category);
            logger.info("Query to remove books"+pstmt);

            rs = pstmt.executeUpdate();
            
            if(rs>0) {
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Entry removed sucessfully from system');");
                out.println("window.location.href = 'Admin/Admin_index.jsp';");
                out.println("</script>");
             } else {
                 response.setContentType("text/html");
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Entry valid details to remove entry');");
                 out.println("window.location.href = 'Admin/Admin_index.jsp';");
                 out.println("</script>");
             }

            
        } catch (NamingException | SQLException e) {
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
            out.println("</center></body></html>");
        }
        
        logger.debug("result set:-"+rs);  
        out.println("<html><body><center>");
        

    }

}
