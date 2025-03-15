package controller;

import java.sql.*;

public class Helper {

    public static Connection con = null;
    public static PreparedStatement pst = null;

    public static PreparedStatement getConnection(String sql) throws ClassNotFoundException, SQLException {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        con = DriverManager.getConnection("jdbc:derby:C:\\Users\\prath\\MyDB;create=true");
        PreparedStatement pst = con.prepareStatement(sql);
        return pst;
    }

    public static void closeConnection(Connection con, PreparedStatement pst) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}