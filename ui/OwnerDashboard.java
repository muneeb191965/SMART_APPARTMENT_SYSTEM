package ui;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import service.DBConnection;

public class OwnerDashboard extends JFrame {

    public OwnerDashboard() {
        setTitle("Owner Dashboard");
        setSize(400,400);
        setLayout(new GridLayout(8,1));

        JButton b1 = new JButton("View Buildings");
        JButton b2 = new JButton("View Apartments");
        JButton b3 = new JButton("View Residents");
        JButton b4 = new JButton("View Bills");
        JButton b5 = new JButton("View Payments");
        JButton b6 = new JButton("Reports");
        JButton backBtn = new JButton("Back to Login");
        JButton exitBtn = new JButton("Exit");

        add(b1); add(b2); add(b3);
        add(b4); add(b5); add(b6);
        add(backBtn); add(exitBtn);

        b1.addActionListener(e -> showData("SELECT * FROM building", "Buildings"));
        b2.addActionListener(e -> showData("SELECT * FROM apartment", "Apartments"));
        b3.addActionListener(e -> showData("SELECT * FROM resident", "Residents"));
        b4.addActionListener(e -> showData("SELECT * FROM bill", "Bills"));
        b5.addActionListener(e -> showData("SELECT * FROM payment", "Payments"));
        b6.addActionListener(e -> showReport());

        backBtn.addActionListener(e -> {
            new LoginUI();
            dispose();
        });

        exitBtn.addActionListener(e -> System.exit(0));

        setVisible(true);
    }

    void showData(String query, String title) {
    JFrame f = new JFrame(title);
    f.setSize(800,400);

    JTextArea area = new JTextArea();
    area.setFont(new Font("Monospaced", Font.PLAIN, 12));

    JScrollPane scroll = new JScrollPane(area);
    JButton backBtn = new JButton("Back");

    f.setLayout(new BorderLayout());
    f.add(scroll, BorderLayout.CENTER);
    f.add(backBtn, BorderLayout.SOUTH);

    backBtn.addActionListener(e -> f.dispose());  // 🔥 BACK WORKS

    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        ResultSetMetaData meta = rs.getMetaData();
        int cols = meta.getColumnCount();

        for (int i = 1; i <= cols; i++) {
            area.append(String.format("%-25s", meta.getColumnName(i)));
        }
        area.append("\n");

        while (rs.next()) {
            for (int i = 1; i <= cols; i++) {
                area.append(String.format("%-25s", rs.getString(i)));
            }
            area.append("\n");
        }

    } catch (Exception e) {
        System.out.println(e);
    }

    f.setVisible(true);
}
    void showReport() {
    JFrame f = new JFrame("Report");
    JTextArea area = new JTextArea();
    area.setFont(new Font("Monospaced", Font.BOLD, 14));

    JButton backBtn = new JButton("Back");

    f.setLayout(new BorderLayout());
    f.add(area, BorderLayout.CENTER);
    f.add(backBtn, BorderLayout.SOUTH);

    backBtn.addActionListener(e -> f.dispose()); // 🔥 BACK

    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();

        ResultSet r1 = st.executeQuery("SELECT COUNT(*) FROM apartment WHERE status='Vacant'");
        r1.next();
        int vacant = r1.getInt(1);

        ResultSet r2 = st.executeQuery("SELECT COUNT(*) FROM bill WHERE status='Pending'");
        r2.next();
        int pending = r2.getInt(1);

        ResultSet r3 = st.executeQuery("SELECT SUM(total_amount) FROM bill WHERE status='Paid'");
        r3.next();
        double income = r3.getDouble(1);

        area.setText(
            "===== SYSTEM REPORT =====\n\n" +
            "Vacant Flats : " + vacant + "\n" +
            "Pending Bills: " + pending + "\n" +
            "Total Income : " + income
        );

    } catch (Exception e) {
        area.setText("Error:\n" + e.getMessage());
    }

    f.setSize(350,250);
    f.setVisible(true);
}
}