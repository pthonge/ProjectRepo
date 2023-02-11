package com.library.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.util.Vector;

public class DisplayAll {

    private String B_Name;
    private String B_Author;
    private String B_Pub;
    private int available_copies;
    private String B_ID;

    public String getB_Name() {
        return B_Name;
    }

    public void setB_Name(String b_Name) {
        B_Name = b_Name;
    }

    public String getB_Author() {
        return B_Author;
    }

    public void setB_Author(String b_Author) {
        B_Author = b_Author;
    }

    public String getB_Pub() {
        return B_Pub;
    }

    public void setB_Pub(String b_Pub) {
        B_Pub = b_Pub;
    }

    public String getB_ID() {
        return B_ID;
    }

    public void setB_ID(String b_ID) {
        B_ID = b_ID;
    }

    public Vector<DisplayAll> displayAllRecords() {

        Vector<DisplayAll> allRecords = new Vector<DisplayAll>();
        Connection con = null;

        try {

            Context ct = new InitialContext();
            DataSource ds = (DataSource) ct.lookup("java:jboss/MySqlDS");
            System.out.println("Got DataSource :-" + ds);

            con = ds.getConnection();
            String query = "select * from Books";
            PreparedStatement pstmt = con.prepareStatement(query);
            System.out.println(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                DisplayAll temp = new DisplayAll();
                temp.setB_ID(rs.getString(1));
                temp.setB_Name(rs.getString(2));
                temp.setB_Author(rs.getString(3));
                temp.setB_Pub(rs.getString(4));
                temp.setAvailable_copies(rs.getInt(6));

                System.out.println("allRecords.add(temp) --- executed with " + rs.getString(1) + " " + rs.getString(2) + " "
                        + rs.getInt(6));
                allRecords.add(temp);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return allRecords;
    }

    public int getAvailable_copies() {
        return available_copies;
    }

    public void setAvailable_copies(int available_copies) {
        this.available_copies = available_copies;
    }

}
