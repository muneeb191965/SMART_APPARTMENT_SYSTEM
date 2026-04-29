package ui;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import service.DBConnection;

public class LoginUI extends JFrame {

    JTextField username;
    JPasswordField password;

    public LoginUI() {
        setTitle("Login");
        setSize(350,200);
        setLayout(new GridLayout(4,2));

        add(new JLabel("Username (Owner / Resident ID)"));
        username = new JTextField();
        add(username);

        add(new JLabel("Password"));
        password = new JPasswordField();
        add(password);

        JButton loginBtn = new JButton("Login");
        JButton exitBtn = new JButton("Exit");

        add(loginBtn);
        add(exitBtn);

        loginBtn.addActionListener(e -> login());
        exitBtn.addActionListener(e -> System.exit(0));

        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }

    void login() {
        try {
            String user = username.getText();
            String pass = new String(password.getPassword());

            if (user.isEmpty() || pass.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Enter username and password!");
                return;
            }

            Connection con = DBConnection.getConnection();

            PreparedStatement pst1 = con.prepareStatement(
                "SELECT * FROM owner WHERE username=? AND password=?"
            );
            pst1.setString(1, user);
            pst1.setString(2, pass);
            ResultSet rs1 = pst1.executeQuery();

            if (rs1.next()) {
                new OwnerDashboard();
                dispose();
                return;
            }

            PreparedStatement pst2 = con.prepareStatement(
                "SELECT * FROM resident WHERE resident_id=? AND password=?"
            );
            pst2.setString(1, user);
            pst2.setString(2, pass);
            ResultSet rs2 = pst2.executeQuery();

            if (rs2.next()) {
                new ResidentDashboard(user);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Invalid Login");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}