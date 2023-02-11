package com.library.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class Student_RequestBook
 */
public class Student_RequestBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_RequestBook() {
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
        Connection con = null;
        PrintWriter out = response.getWriter();
        Logger logger = Logger.getLogger(Student_RequestBook.class);
        String B_Name = request.getParameter("B_Name");
        String B_Publication = request.getParameter("B_Publication");

        out.println("<html><body><center>");

        Context ct = null;
        try {
            ct = new InitialContext();
            DataSource ds = (DataSource) ct.lookup("java:jboss/MySqlDS");
            con = ds.getConnection();
            String query = "insert into RequestedBooks values(?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, B_Name);
            pstmt.setString(2, B_Publication);
            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                logger.debug("result set:-" + rs);
                out.println("<html><body><center>");

                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Request for new book recorded');");
                out.println("window.location.href = 'student/stud_index.jsp';");
                out.println("</script>");
            }
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        out.println("</font></center></body></html>");
    }
}
