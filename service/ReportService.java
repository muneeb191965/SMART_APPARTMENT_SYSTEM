package service;

import java.sql.*;

public class ReportService {

    Connection con = DBConnection.getConnection();

    public String generateReport() {
        try {
            Statement st = con.createStatement();

            ResultSet r1 = st.executeQuery(
                "SELECT COUNT(*) FROM Apartment WHERE status='Vacant'"
            );
            r1.next();

            ResultSet r2 = st.executeQuery(
                "SELECT SUM(amount_paid) FROM Payment"
            );
            r2.next();

            ResultSet r3 = st.executeQuery(
                "SELECT COUNT(*) FROM Bill WHERE status='Pending'"
            );
            r3.next();

            return "Vacant Flats: " + r1.getInt(1) +
                   "\nTotal Income: " + r2.getDouble(1) +
                   "\nPending Bills: " + r3.getInt(1);

        } catch (Exception e) {
            return "Error generating report";
        }
    }
}