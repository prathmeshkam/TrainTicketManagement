package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Helper;

public class searchTrainDao {
	public static ResultSet display(String s , String d , Date date) throws ClassNotFoundException, SQLException {
		
        String sql = "select * from TrainInformation where originstation=? and destinationstation=? and traindate=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1 , s);
        pst.setString(2 , d);
        pst.setDate(3, date);
        ResultSet rs = pst.executeQuery();
        
        return rs;

    }
}
