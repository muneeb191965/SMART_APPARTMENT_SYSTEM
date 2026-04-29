package service;

import java.sql.*;

public class AuthService {

    Connection con = DBConnection.getConnection();

    public boolean loginOwner(String username, String password) {
        try {
            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM Owner WHERE username=? AND password=?"
            );
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            return rs.next();

        } catch (Exception e) {
            return false;
        }
    }

    public boolean loginResident(String id, String password) {
        try {
            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM Resident WHERE resident_id=? AND password=?"
            );
            pst.setString(1, id);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            return rs.next();

        } catch (Exception e) {
            return false;
        }
    }
}