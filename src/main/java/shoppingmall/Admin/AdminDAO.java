package shoppingmall.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public AdminDAO(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/shoppingmall";
            String dbID = "jspid2";
            String dbPass = "jsppass";
            conn = DriverManager.getConnection(dbURL, dbID, dbPass);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public int adminLogin(String adminID, String adminPassword){
        String SQL = "SELECT * FROM admin WHERE adminID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, adminID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString("adminPassword").equals(adminPassword)){
                    return 1; // Login Success
                }
                return 0; // ID Exists, Password No
            }
            return -1; //ID NO
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -2; //DB Error
    }
}
