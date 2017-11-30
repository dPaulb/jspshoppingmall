package shoppingmall.Item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ItemDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ItemDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/shoppingmall";
            String dbID = "jspid2";
            String dbPass = "jsppass";
            conn = DriverManager.getConnection(dbURL, dbID, dbPass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int itemUpload(ItemDTO itemDTO) {
        String SQL = "INSERT INTO item (itemName, itemPrice, uploadDate, itemCategory, itemDescription, itemThumbnail) VALUES(?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, itemDTO.getItemName());
            pstmt.setInt(2, itemDTO.getItemPrice());
            pstmt.setString(3, itemDTO.getUploadDate());
            pstmt.setString(4, itemDTO.getItemCategory());
            pstmt.setString(5, itemDTO.getItemDescription());
            pstmt.setString(6, itemDTO.getItemThumbnail());
            int result = pstmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<ItemDTO> getItemList(String itemCategory) {
        ArrayList<ItemDTO> itemList = new ArrayList<ItemDTO>();
        String SQL = "SELECT * FROM item WHERE itemCategory = ? ORDER BY itemNumber DESC";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, itemCategory);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ItemDTO itemDTO = new ItemDTO();
                itemDTO.setItemNumber(rs.getInt("itemNumber"));
                itemDTO.setItemName(rs.getString("itemName"));
                itemDTO.setItemPrice(rs.getInt("itemPrice"));
                itemDTO.setUploadDate(rs.getString("uploadDate"));
                itemDTO.setItemCategory(rs.getString("itemCategory"));
                itemDTO.setItemDescription(rs.getString("itemDescription"));
                itemDTO.setItemThumbnail(rs.getString("itemThumbnail"));
                itemList.add(itemDTO);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return itemList;
    }

    public ItemDTO getItemDetail(int itemNumber){
        String SQL = "SELECT * FROM item WHERE itemNumber = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, itemNumber);
            rs = pstmt.executeQuery();
            if(rs.next()){
                ItemDTO itemDTO = new ItemDTO();
                itemDTO.setItemNumber(rs.getInt("itemNumber"));
                itemDTO.setItemName(rs.getString("itemName"));
                itemDTO.setItemPrice(rs.getInt("itemPrice"));
                itemDTO.setItemThumbnail(rs.getString("itemThumbnail"));
                itemDTO.setItemDescription(rs.getString("itemDescription"));
                itemDTO.setUploadDate(rs.getString("uploadDate"));
                itemDTO.setItemCategory(rs.getString("itemCategory"));
                return itemDTO;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
