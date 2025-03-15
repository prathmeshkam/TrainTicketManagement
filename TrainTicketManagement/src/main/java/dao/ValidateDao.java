package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Helper;

public class ValidateDao {

    public static boolean validateDetails(String username, String password, String role) throws ClassNotFoundException, SQLException {

        boolean isValidate = false;
        String sql = "select * from " + (role.equals("admin") ? "admininfo" : "userinfo") + " where username=? and password=?";
        PreparedStatement pst = Helper.getConnection(sql);
        pst.setString(1, username);
        pst.setString(2, password);

        int res = 0;
        ResultSet rst = pst.executeQuery();

        if (rst.next()) {
            isValidate = true;
        }

        return isValidate;
    }
}