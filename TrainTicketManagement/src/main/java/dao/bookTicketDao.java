package dao;

import java.sql.Date;
import java.sql.PreparedStatement;

import controller.Helper;

public class bookTicketDao {
	public static boolean bookTrain(String trainNumber, String trainName, Date trainDate, String passengerName, int passengerAge, String gender, String travelClass, String paymentMode , int noOfTickets , int totalpay) {
           boolean isBooked = false;
    
           PreparedStatement pstmt = null;
try {

    
            String sql = "INSERT INTO bookings (trainnumber, trainname, traindate, name, age, gender, class, paymentmode, status , noofticket , totalpay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
            pstmt = Helper.getConnection(sql);
            pstmt.setString(1, trainNumber);
            pstmt.setString(2, trainName);
            pstmt.setDate(3, trainDate);
            pstmt.setString(4, passengerName);
            pstmt.setInt(5, passengerAge);
            pstmt.setString(6, gender);
            pstmt.setString(7, travelClass);
            pstmt.setString(8, paymentMode);
            pstmt.setString(9, "Booked");  // Status is always "Booked"
            pstmt.setInt(10, noOfTickets);
            pstmt.setInt(11, totalpay);

            // Execute the insert
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                isBooked = true; // Booking was successful
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (Helper.con != null) Helper.con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return isBooked;
    }
}
