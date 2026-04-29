import service.DBConnection;
import ui.LoginUI;

public class Main {
    public static void main(String[] args) {
        DBConnection.connectDB();  
        new LoginUI();
    }
}