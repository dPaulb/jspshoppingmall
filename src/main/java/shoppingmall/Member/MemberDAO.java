package shoppingmall.Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public MemberDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUserID = "jspid2";
            String dbUserPassword = "jsppass";
            String dbURL = "jdbc:mysql://localhost:3306/shoppingmall";
            conn = DriverManager.getConnection(dbURL, dbUserID, dbUserPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int join(MemberDTO memberDTO){
        String SQL = "INSERT INTO member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, memberDTO.getUserID());
            pstmt.setString(2, memberDTO.getUserPassword());
            pstmt.setString(3, memberDTO.getUserName());
            pstmt.setInt(4, memberDTO.getUserYear());
            pstmt.setInt(5, memberDTO.getUserMonth());
            pstmt.setInt(6, memberDTO.getUserDay());
            pstmt.setString(7, memberDTO.getUserGender());
            pstmt.setString(8, memberDTO.getUserEmail());
            pstmt.setString(9, memberDTO.getUserAddress());
            pstmt.setInt(10, memberDTO.getUserPostCode());
            pstmt.setString(11, memberDTO.getUserDetailAddress());
            pstmt.setInt(12, memberDTO.getUserPhoneNumber());
            int result = pstmt.executeUpdate();
            return result;
        }
        catch(Exception e){
            e.printStackTrace();
        }


        return -1;

    }

    public int idCheck(String userID){
        String SQL = "SELECT * FROM member WHERE userID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return 1; //Exists.
            }
            return 0; // Available
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -1; //DB Error
    }

    public int login(String userID, String userPassword){
        String SQL = "SELECT * FROM member WHERE userID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString("userPassword").equals(userPassword)){
                    return 1; // Login OK
                }
                return 0; // ID exists, incorrect password
            }
            return -1; //ID not exists;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -2; //DB error
    }
}
