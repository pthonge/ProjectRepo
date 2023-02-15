package com.library.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class ValidateSelectedBook {
    
    Logger logger = Logger.getLogger(ValidateSelectedBook.class);
    Connection con=null;
        
    public boolean validateBook(int b_id, String username) {
   

        try {

            Context ct=new InitialContext();
            DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
            con=ds.getConnection();
            logger.info("Username====================start"+username);
            String query="select B_Id from BorrowedBook where username='"+username+"'";
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet rs=pstmt.executeQuery(query);
            while(rs.next())
            {
                 System.out.println("BID============"+rs.getInt("B_Id"));
                 System.out.println("b_id***************"+b_id);
                 int i =rs.getInt("B_Id");
                 System.out.println("sub-"+(i-b_id));
                if(i==b_id){
                System.out.println("in if True==========complete");
                return true; }
            }

            
        } catch (NamingException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }            
        }       
        return false;
    }

    public int updateReturnBookRecord(String b_Id) {
        
        try {
            Context ct=new InitialContext();
            DataSource ds=(DataSource)ct.lookup("java:jboss/MySqlDS");
            con=ds.getConnection();
            String query="Delete from BorrowedBook where B_Id='"+b_Id+"'";
            logger.info("query="+query);
            PreparedStatement pstmt=con.prepareStatement(query);
            int rs = pstmt.executeUpdate();
            
            logger.info("rs="+rs);
            return rs;
            
        } catch (NamingException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return 0;
        
    }

}
