package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Helper;

import model.AddTrain;

public class AddTrainDao {
    public static int addTrain(AddTrain train) throws ClassNotFoundException, SQLException {

        int res = 0;
        String sql = "insert into TrainInformation values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            return 1;
        } else {
            System.out.println("Something Went Wrong");
        }
        return 0;
    }
}