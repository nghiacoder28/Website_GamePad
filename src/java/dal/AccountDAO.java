package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends DBContext {

    private Connection DBConnection = null;
    private PreparedStatement SQLQuery = null;
    private ResultSet resultSet = null;

    public Account getAccountByEmail(String email) {
        Account acc = new Account();
        String sql = "select *from Account a \n"
                + "where a.email = ?";
        try {
            PreparedStatement st = DBConnection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                acc = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                acc.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
        }

        return acc;
    }

    public void setNewPassword(int accId, String password) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [pass] = ? \n"
                + "\n"
                + " WHERE [dbo].[Account].accountID=?";
        try {
            PreparedStatement st = DBConnection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, accId);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account acc = dao.checkLogin("user", "123");
        System.out.println(acc.getUsername());
    }

    public Account checkLogin(String username, String password) {

        try {
            DBConnection = makeConnection();
            if (DBConnection != null) {
                String sql = "select * from Account where username=? and pass=?";
                SQLQuery = DBConnection.prepareStatement(sql);
                SQLQuery.setString(1, username);
                SQLQuery.setString(2, password);
                resultSet = SQLQuery.executeQuery();
                if (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountID(resultSet.getInt("accountID"));
                    account.setUsername(resultSet.getString("username"));
                    account.setPass(resultSet.getString("pass"));
                    account.setfName(resultSet.getString("fName"));
                    account.setDob(resultSet.getString("dob"));
                    account.setPhone(resultSet.getString("phone"));
                    account.setRole(resultSet.getString("role"));
                    account.setAddress(resultSet.getString("address"));
                    return account;
                }
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Account> getUser() {
        List<Account> list = new ArrayList<Account>();
        String query = "select * from Account";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Account account = new Account();
                account.setAccountID(resultSet.getInt("accountID"));
                account.setUsername(resultSet.getString("username"));
                account.setPass(resultSet.getString("pass"));
                account.setfName(resultSet.getString("fName"));
                account.setDob(resultSet.getString("dob"));
                account.setPhone(resultSet.getString("phone"));
                account.setRole(resultSet.getString("role"));
                account.setAddress(resultSet.getString("address"));
                list.add(account);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Account getUserID(int uID) {
        String query = "select * from Account where accountID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, uID);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Account account = new Account();
                account.setAccountID(resultSet.getInt("accountID"));
                account.setUsername(resultSet.getString("username"));
                account.setPass(resultSet.getString("pass"));
                account.setfName(resultSet.getString("fName"));
                account.setDob(resultSet.getString("dob"));
                account.setPhone(resultSet.getString("phone"));
                account.setRole(resultSet.getString("role"));
                account.setAddress(resultSet.getString("address"));
                return account;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void UpdateUser(String role, String password, String accountID) {
    String query = "update Account set [role] = ?, pass = ? where accountID = ?";
    try {
        DBConnection = makeConnection();
        SQLQuery = DBConnection.prepareStatement(query);
        SQLQuery.setString(1, role);
        SQLQuery.setString(2, password);
        SQLQuery.setString(3, accountID);
        SQLQuery.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace(); // Xử lý exception
    }
}

    public void addUser(String username, String password, String fullname, String dob, String phone, String address, String email) {
        String query = "insert into Account values (?, ?, ?, ?, ?, 1, ?, ?)";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setString(1, username);
            SQLQuery.setString(2, password);
            SQLQuery.setString(3, fullname);
            SQLQuery.setString(4, dob);
            SQLQuery.setString(5, phone);
            SQLQuery.setString(6, address);
            SQLQuery.setString(7, email);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account checkRegister(String username) {

        try {
            DBConnection = makeConnection();
            if (DBConnection != null) {
                String sql = "select * from Account where username=?";
                SQLQuery = DBConnection.prepareStatement(sql);
                SQLQuery.setString(1, username);
                resultSet = SQLQuery.executeQuery();
                if (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountID(resultSet.getInt("accountID"));
                    account.setUsername(resultSet.getString("username"));
                    account.setPass(resultSet.getString("pass"));
                    account.setfName(resultSet.getString("fName"));
                    account.setDob(resultSet.getString("dob"));
                    account.setPhone(resultSet.getString("phone"));
                    account.setRole(resultSet.getString("role"));
                    account.setAddress(resultSet.getString("address"));
                    return account;
                }
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void updateAccout(String pass, int aID) {
        String query = "update Account set pass = '" + pass + "' where accountID = " + aID + "";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateProfile(String fName, String dob, String phone, String address, int aID) {
        String query = "update Account set fName = '" + fName + "', dob = '" + dob + "',"
                + " phone = '" + phone + "', address = '" + address + "'  where accountID = " + aID + "";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.executeUpdate();
        } catch (Exception e) {

        }
    }

}
