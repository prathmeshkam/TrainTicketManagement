package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Helper;

public class bookTicketDao {
    public static boolean bookTrain(String trainNumber, String trainName, Date trainDate, String passengerName, int passengerAge, 
                                    String gender, String travelClass, String paymentMode, int noOfTickets, int totalpay) throws ClassNotFoundException {
        boolean isBooked = false;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1️⃣ **Fetch the last assigned seat number for the given train & date**
            String seatQuery = "SELECT MAX(seatNumber) FROM bookings WHERE trainnumber = ? AND traindate = ?";
            pstmt = Helper.getConnection(seatQuery);
            pstmt.setString(1, trainNumber);
            pstmt.setDate(2, trainDate);
            rs = pstmt.executeQuery();

            int lastSeatNumber = 0;
            if (rs.next()) {
                lastSeatNumber = rs.getInt(1); // Get highest seat number
            }
            rs.close();
            pstmt.close();

            // 2️⃣ **Insert multiple tickets with incremented seat numbers**
            String insertQuery = "INSERT INTO bookings (trainnumber, trainname, traindate, name, age, gender, class, paymentmode, status, noofticket, totalpay, seatNumber) " +
                                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Booked', ?, ?, ?)";
            pstmt = Helper.getConnection(insertQuery);

            for (int i = 0; i < noOfTickets; i++) {
                pstmt.setString(1, trainNumber);
                pstmt.setString(2, trainName);
                pstmt.setDate(3, trainDate);
                pstmt.setString(4, passengerName);
                pstmt.setInt(5, passengerAge);
                pstmt.setString(6, gender);
                pstmt.setString(7, travelClass);
                pstmt.setString(8, paymentMode);
                pstmt.setInt(9, noOfTickets);
                pstmt.setInt(10, totalpay);
                pstmt.setInt(11, ++lastSeatNumber); // Assign next seat number

                pstmt.executeUpdate();
            }

            isBooked = true; // Booking successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
            try { if (Helper.con != null) Helper.con.close(); } catch (SQLException ignored) {}
        }

        return isBooked;
    }
}
