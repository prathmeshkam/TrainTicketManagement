package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.Helper;

public class deleteTicketDao {
	public static int deleteTicket(int id) throws ClassNotFoundException, SQLException {

        String sql = "delete from bookings where id=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setInt(1, id);

        int res = pst.executeUpdate();
        if (res > 0) {
            return 1;
        } else {
            System.out.println("Error Occurred");
        }
        return 0;
    }
}
