package shoppingmall.Item;

import java.sql.Date;

public class ItemDTO {
    private int itemNumber;
    private String itemName;
    private int itemPrice;
    private String uploadDate;
    private String itemCategory;
    private String itemDescription;
    private String itemThumbnail;


    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(int itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    public String getItemThumbnail() {
        return itemThumbnail;
    }

    public void setItemThumbnail(String itemThumbnail) {
        this.itemThumbnail = itemThumbnail;
    }
}
