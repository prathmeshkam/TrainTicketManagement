package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;
import controller.Helper;

public class RegisterDao {

    public static int Insert(User u, String role) throws ClassNotFoundException, SQLException {

        int res = 0;
        String sql = "";
        if (role.equals("admin")) {
            sql = "insert into admininfo (username, password, email, address, contactnumber) values (?,?,?,?,?)";
        } else if (role.equals("user")) {
            sql = "insert into userinfo (username, password, email, address, contactnumber) values (?,?,?,?,?)";
        }
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, u.getUsername());
        pst.setString(2, u.getPassword());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getAddress());
        pst.setString(5, u.getContactNumber());

        res = pst.executeUpdate();

        if (res > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}