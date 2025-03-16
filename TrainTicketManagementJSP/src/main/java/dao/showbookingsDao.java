package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Helper;

public class showbookingsDao {
	public static ResultSet display() throws ClassNotFoundException, SQLException {

        String sql = "select * from bookings";
        PreparedStatement pst = Helper.getConnection(sql);
        ResultSet rs = pst.executeQuery();
        
        return rs;

    }
}
