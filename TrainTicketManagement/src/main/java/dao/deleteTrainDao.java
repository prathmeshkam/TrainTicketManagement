package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Helper;

public class deleteTrainDao {
	public static int deleteTrain(int trainNumber) throws ClassNotFoundException, SQLException {

        String sql = "delete from TrainInformation where trainNumber=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setInt(1, trainNumber);

        int res = pst.executeUpdate();
        if (res > 0) {
            return 1;
        } else {
            System.out.println("Error Occurred");
        }
        return 0;
    }
}
