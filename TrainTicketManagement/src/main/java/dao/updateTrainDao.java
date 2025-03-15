package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Helper;
import model.AddTrain;

public class updateTrainDao {
	public static int updateTrain(AddTrain train) throws ClassNotFoundException, SQLException {

        String sql = "update TrainInformation set trainName=?, originStation=?, destinationStation=?, departureTime=?, arrivalTime=?, numberOfSeats=?, firstac=?, secondac=?, thirdac=?, secondsitting=?, sleeper=?, trainDate=? where trainNumber=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, train.getTrainName());
        pst.setString(2, train.getOriginStation());
        pst.setString(3, train.getDestinationStation());
        pst.setString(4, train.getDepartureTime());
        pst.setString(5, train.getArrivalTime());
        pst.setInt(6, train.getNumberOfSeats());
        pst.setInt(7, train.getFirstac());
        pst.setInt(8, train.getSecondac());
        pst.setInt(9, train.getThirdac());
        pst.setInt(10, train.getSecondsitting());
        pst.setInt(11, train.getSleeper());
        pst.setDate(12, train.getTraindate());
        pst.setInt(13, train.getTrainNumber());

        int res = pst.executeUpdate();
        if (res > 0) {
            return 1;
        } else {
            System.out.println("Error Occurred");
        }
        return 0;
    }
}
