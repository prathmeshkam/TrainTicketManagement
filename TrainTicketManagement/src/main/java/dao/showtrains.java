package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Helper;

public class showtrains {
	 public static ResultSet display() throws ClassNotFoundException, SQLException {

	        String sql = "select * from TrainInformation";
	        PreparedStatement pst = Helper.getConnection(sql);
	        ResultSet rs = pst.executeQuery();
	        
	        return rs;
//	        while (rs.next()) {
//	            System.out.println("Train Number : " + rs.getInt(1));
//	            System.out.println("Train Name : " + rs.getString(2));
//	            System.out.println("Origin Station : " + rs.getString(3));
//	            System.out.println("Destination Station : " + rs.getString(4));
//	            System.out.println("Departure Time : " + rs.getString(5));
//	            System.out.println("Arrival Time : " + rs.getString(6));
//	            System.out.println("Number of Seats : " + rs.getInt(7));
//	            System.out.println("1AC : " + rs.getInt(7));
//	            System.out.println("2AC : " + rs.getInt(8));
//	            System.out.println("3AC : " + rs.getInt(9));
//	            System.out.println("Second Sitting : " + rs.getInt(10));
//	            System.out.println("Sleeper : " + rs.getInt(11));
//	            System.out.println(" ");
//	        }
	    }
}
