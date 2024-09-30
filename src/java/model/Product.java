package model;

public class Product {

    private int pID;
    private String pName;
    private String imge;
    private float price;
    private int bID;
    private int quality;
    private String bName;
    private int accountID;
    private int status;
    private int cID;
    private String fName;
    private String address;
    private String phone;
    private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getImge() {
        return imge;
    }

    public void setImge(String imge) {
        this.imge = imge;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getbID() {
        return bID;
    }

    public void setbID(int bID) {
        this.bID = bID;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Product(int pID, String pName, String imge, float price, int bID, int quality, String bName, int accountID, int status) {
        this.pID = pID;
        this.pName = pName;
        this.imge = imge;
        this.price = price;
        this.bID = bID;
        this.quality = quality;
        this.bName = bName;
        this.accountID = accountID;
        this.status = status;
    }

    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" + "pID=" + pID + ", pName=" + pName + ", imge=" + imge + ", price=" + price + ", bID=" + bID + ", quality=" + quality + ", bName=" + bName + ", accountID=" + accountID + ", status=" + status + ", cID=" + cID + ", fName=" + fName + ", address=" + address + ", phone=" + phone + ", total=" + total + '}';
    }

}
