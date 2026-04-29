package service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static void connectDB() {
        try {
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/smartapartmentdb",
                "root",
                "@@@12345"
            );
            System.out.println("Connected to database!");
        } catch (Exception e) {
            System.out.println("DB Error: " + e.getMessage());
        }
    }

    public static Connection getConnection() {
        return con;
    }
}