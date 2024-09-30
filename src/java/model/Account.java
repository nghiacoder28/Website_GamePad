package model;

public class Account{
    private int accountID;
    private String username;
    private String pass;
    private String fName;
    private String dob;
    private String phone;
    private String role;
    private String address;
    private String email;
    public Account() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Account(int accountID, String username, String pass, String fName, String dob, String phone, String role) {
        this.accountID = accountID;
        this.username = username;
        this.pass = pass;
        this.fName = fName;
        this.dob = dob;
        this.phone = phone;
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Acoount{" + "accountID=" + accountID + ", username=" + username + ", pass=" + pass + ", fName=" + fName + ", dob=" + dob + ", phone=" + phone + ", role=" + role + '}';
    }

}
