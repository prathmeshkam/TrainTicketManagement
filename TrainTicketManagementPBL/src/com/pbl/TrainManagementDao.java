package com.pbl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainManagementDao {

    public void addTrain(Train train) throws ClassNotFoundException, SQLException {
        int res = 0;
        String sql = "INSERT INTO Traininformation VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = Helper.getConnection(sql);
        
        pst.setInt(1, train.getTrainNumber());
        pst.setString(2, train.getTrainName());
        pst.setString(3, train.getOriginStation());
        pst.setString(4, train.getDestinationStation());
        pst.setString(5, train.getDepartureTime());
        pst.setString(6, train.getArrivalTime());
        pst.setInt(7, train.getNumberOfSeats());
        pst.setInt(8, train.getFirstac());
        pst.setInt(9, train.getSecondac());
        pst.setInt(10, train.getThirdac());
        pst.setInt(11, train.getSecondsitting());
        pst.setInt(12, train.getSleeper());
        pst.setDate(13, train.getTraindate());

        res = pst.executeUpdate();
        if (res > 0) {
            System.out.println("Train Added Successfully...");
        } else {
            System.out.println("Something Went Wrong");
        }
    }

    public void updateTrain(Train tUpdate) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE Traininformation SET trainname=?, originstation=?, destinationstation=?, " +
                     "departuretime=?, arrivaltime=?, numberofseats=?, firstac=?, secondac=?, " +
                     "thirdac=?, secondsitting=?, sleeper=? WHERE trainnumber=?";
        
        PreparedStatement pst = Helper.getConnection(sql);
        
        pst.setString(1, tUpdate.getTrainName());
        pst.setString(2, tUpdate.getOriginStation());
        pst.setString(3, tUpdate.getDestinationStation());
        pst.setString(4, tUpdate.getDepartureTime());
        pst.setString(5, tUpdate.getArrivalTime());
        pst.setInt(6, tUpdate.getNumberOfSeats());
        pst.setInt(7, tUpdate.getFirstac());
        pst.setInt(8, tUpdate.getSecondac());
        pst.setInt(9, tUpdate.getThirdac());
        pst.setInt(10, tUpdate.getSecondsitting());
        pst.setInt(11, tUpdate.getSleeper());
        pst.setInt(12, tUpdate.getTrainNumber());

        int res = pst.executeUpdate();
        if (res > 0) {
            System.out.println("Train Updated Successfully...");
        } else {
            System.out.println("Error...");
        }
    }

    public void display() throws ClassNotFoundException, SQLException {
        String sql = "SELECT * FROM Traininformation";
        PreparedStatement pst = Helper.getConnection(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            System.out.println("Train Number: " + rs.getInt(1));
            System.out.println("Train Name: " + rs.getString(2));
            System.out.println("Origin Station: " + rs.getString(3));
            System.out.println("Destination Station: " + rs.getString(4));
            System.out.println("Departure Time: " + rs.getString(5));
            System.out.println("Arrival Time: " + rs.getString(6));
            System.out.println("Number of Seats: " + rs.getInt(7));
            System.out.println("1AC: " + rs.getInt(8));
            System.out.println("2AC: " + rs.getInt(9));
            System.out.println("3AC: " + rs.getInt(10));
            System.out.println("Second Sitting: " + rs.getInt(11));
            System.out.println("Sleeper: " + rs.getInt(12));
            System.out.println("---------------------------");
        }
    }

    public void deleteTrain(int number) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM Traininformation WHERE trainnumber=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setInt(1, number);

        int res = pst.executeUpdate();
        if (res > 0) {
            System.out.println("Train Deleted Successfully...");
        } else {
            System.out.println("Error Occurred");
        }
    }

    public boolean validateDao(String username, String password, String role) 
            throws ClassNotFoundException, SQLException {

        // Determine the table name based on the role
        String tableName = role.equalsIgnoreCase("admin") ? "admininfo" : "userinfo";

        // SQL query (removed role column)
        String sql = "SELECT * FROM " + tableName + " WHERE username=? AND password=?";

        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, username);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();
        return rs.next(); // Return true if user exists, false otherwise
    }

    
    
    public boolean registerUser(String username, String password, String email, String contact, String address, String role) 
            throws ClassNotFoundException, SQLException {

        // Determine the table name based on the role
        String tableName = role.equalsIgnoreCase("admin") ? "admininfo" : "userinfo";

        // Create SQL query dynamically (Removed role column)
        String sql = "INSERT INTO " + tableName + " (username, password, email, contactnumber, address) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, email);
        pst.setString(4, contact);
        pst.setString(5, address);

        return pst.executeUpdate() > 0;
    }

    public List<Train> searchTrain(String source, String destination, java.sql.Date travelDate) 
            throws ClassNotFoundException, SQLException {
        List<Train> trains = new ArrayList<>();
        
        String sql = "SELECT * FROM traininformation WHERE ORIGINSTATION = ? AND DESTINATIONSTATION = ? AND TRAINDATE = ?";
        
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, source);
        pst.setString(2, destination);
        pst.setDate(3, travelDate);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            trains.add(new Train(
                    rs.getInt("TRAINNUMBER"), 
                    rs.getString("TRAINNAME"),
                    rs.getString("ORIGINSTATION"), 
                    rs.getString("DESTINATIONSTATION"),
                    rs.getString("DEPARTURETIME"), 
                    rs.getString("ARRIVALTIME"),
                    rs.getInt("NUMBEROFSEATS"), 
                    rs.getInt("FIRSTAC"),
                    rs.getInt("SECONDAC"), 
                    rs.getInt("THIRDAC"),
                    rs.getInt("SECONDSITTING"), 
                    rs.getInt("SLEEPER"),
                    rs.getDate("TRAINDATE")
            ));
        }
        return trains;
    }

    
    public void bookTicket(int trainNumber, String trainName, java.sql.Date trainDate, 
            String name, int age, String gender, String travelClass, 
            String paymentMode, int numTickets) throws ClassNotFoundException, SQLException {

        // New booking, insert a new row for every request
        String insertQuery = "INSERT INTO bookings (TRAINNUMBER, TRAINNAME, TRAINDATE, NAME, AGE, GENDER, CLASS, PAYMENTMODE, STATUS, NOOFTICKET, TOTALPAY) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Booked', ?, ?)";

        PreparedStatement insertStmt = Helper.getConnection(insertQuery);
        insertStmt.setInt(1, trainNumber);
        insertStmt.setString(2, trainName);
        insertStmt.setDate(3, trainDate);
        insertStmt.setString(4, name);
        insertStmt.setInt(5, age);
        insertStmt.setString(6, gender);
        insertStmt.setString(7, travelClass);
        insertStmt.setString(8, paymentMode);
        insertStmt.setInt(9, numTickets);
        insertStmt.setInt(10, numTickets * 100); // ₹100 per ticket

        int insertCount = insertStmt.executeUpdate();
        if (insertCount > 0) {
            System.out.println("Booking successful. Total Tickets: " + numTickets + ", Total Pay: ₹" + (numTickets * 100));
        }
    }
    
    public List<Booking> getAllBookings() throws ClassNotFoundException, SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";

        PreparedStatement pst = Helper.getConnection(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            bookings.add(new Booking(
                rs.getInt("ID"), rs.getInt("TRAINNUMBER"), rs.getString("TRAINNAME"), 
                rs.getDate("TRAINDATE"), rs.getString("NAME"), rs.getInt("AGE"), 
                rs.getString("CLASS"), rs.getInt("NOOFTICKET"), rs.getInt("TOTALPAY")
            ));
        }
        return bookings;
    }
    
    
    public boolean cancelBooking(int bookingId) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM bookings WHERE ID = ?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setInt(1, bookingId);
        
        int rowsDeleted = pst.executeUpdate();
        return rowsDeleted > 0;  // Return true if a row was deleted
    }





    
    
    
    
    
    
    
    

    
    
    
}
