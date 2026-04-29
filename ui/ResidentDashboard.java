package ui;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import service.DBConnection;

public class ResidentDashboard extends JFrame {

    String id;

    public ResidentDashboard(String id) {
        this.id = id;

        setTitle("Resident Dashboard");
        setSize(300,250);
        setLayout(new GridLayout(4,1));

        JButton view = new JButton("View My Bills");
        JButton pay = new JButton("Make Payment");
        JButton back = new JButton("Back to Login");
        JButton exit = new JButton("Exit");

        add(view); add(pay); add(back); add(exit);

        view.addActionListener(e -> viewBills());
        pay.addActionListener(e -> pay());

        back.addActionListener(e -> {
            new LoginUI();
            dispose();
        });

        exit.addActionListener(e -> System.exit(0));

        setVisible(true);
    }

    void viewBills() {
    JFrame f = new JFrame("My Bills");
    JTextArea area = new JTextArea();
    JButton backBtn = new JButton("Back");

    f.setLayout(new BorderLayout());
    f.add(new JScrollPane(area), BorderLayout.CENTER);
    f.add(backBtn, BorderLayout.SOUTH);

    backBtn.addActionListener(e -> f.dispose()); // 🔥 BACK

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement pst = con.prepareStatement(
            "SELECT bill_id, total_amount, status FROM bill WHERE resident_id=?"
        );
        pst.setString(1, id);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            area.append(
                rs.getString("bill_id") + " | " +
                rs.getDouble("total_amount") + " | " +
                rs.getString("status") + "\n"
            );
        }

    } catch (Exception e) {
        System.out.println(e);
    }

    f.setSize(400,200);
    f.setVisible(true);
}
    void pay() {
        try {
            String billId = JOptionPane.showInputDialog(this, "Enter Bill ID:");

            Connection con = DBConnection.getConnection();

            PreparedStatement pst = con.prepareStatement(
                "UPDATE bill SET status='Paid' WHERE bill_id=? AND resident_id=?"
            );
            pst.setString(1, billId);
            pst.setString(2, id);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                JOptionPane.showMessageDialog(this, "Payment Done!");
            } else {
                JOptionPane.showMessageDialog(this, "Invalid Bill ID");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}