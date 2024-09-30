package dal;

import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO extends DBContext {

    private Connection DBConnection = null;
    private PreparedStatement SQLQuery = null;
    private ResultSet resultSet = null;

    public List<Product> getAllbrand() {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Brand";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setbID(resultSet.getInt("bID"));
                product.setbName(resultSet.getString("bName"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> DashBoard() {
        List<Product> list = new ArrayList<Product>();
        String query = "select top 3 p.pID, p.pName, count(*) total\n"
                + "  from Carts c, Product p\n"
                + "  where c.pID = p.pID and c.status = 4\n"
                + "  group by p.pName, p.pID\n"
                + "  order by total desc";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setTotal(resultSet.getInt("total"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product TrendProduct() {
        String query = "select top 1 c.cID, p.pID, p.imge, p.pName\n"
                + "from Carts c, Product p\n"
                + "where c.pID = p.pID and c.status = 4\n"
                + "group by c.cID, p.pID, p.imge, p.pName\n"
                + "order by c.cID desc";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setcID(resultSet.getInt("cID"));
                product.setpID(resultSet.getInt("pID"));
                product.setImge(resultSet.getString("imge"));
                product.setpName(resultSet.getString("pName"));
                return product;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product HotProduct() {
        String query = "select top 1 p.pID, p.imge, p.pName\n"
                + "from Carts c, Product p\n"
                + "where c.pID = p.pID and c.status = 4\n"
                + "group by p.pID, p.imge, p.pName\n"
                + "order by p.pID asc";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setImge(resultSet.getString("imge"));
                product.setpName(resultSet.getString("pName"));
                return product;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProduct(int index) {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product\n"
                + "ORDER BY pId\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, (index - 1) * 6);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberEndPage() {
        Connection con = null;
        String query = "select count(*) from Product";
        try {
            // Open the database connection
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                int totalItem = resultSet.getInt(1);
                int endPage = 0;
                endPage = totalItem / 6;
                if (totalItem % 6 != 0) {
                    endPage++;
                }
                return endPage;
            }
        } catch (SQLException e) {
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> getNewProduc() {
        List<Product> list = new ArrayList<Product>();
        String query = "select top 3 * from Product\n"
                + "order by pID desc";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNewProduc4() {
        List<Product> list = new ArrayList<Product>();
        String query = "select top 4 * from Product\n"
                + "order by pID desc";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getABrand(String bName, int index) {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product\n"
                + "where bID = ?\n"
                + "ORDER BY pId\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            DBConnection = new DBContext().makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setString(1, bName);
            SQLQuery.setInt(2, (index - 1) * 6);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }
            System.out.println(list);
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getSearch(String txtSearch, int index) {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product\n"
                + "where pName like ?\n"
                + "ORDER BY pId\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setString(1, "%" + txtSearch + "%");
            SQLQuery.setInt(2, (index - 1) * 6);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getSearchPriceDesc(int index) {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product\n"
                + "ORDER BY price\n"
                + "desc\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, (index - 1) * 6);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateProductQuantity(int pID, int quantity) {
        String query = "UPDATE Product SET quantity = quantity - ? WHERE pID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, quantity);
            SQLQuery.setInt(2, pID);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (SQLQuery != null) {
                    SQLQuery.close();
                }
                if (DBConnection != null) {
                    DBConnection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Product> getSearchPriceAsc(int index) {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product\n"
                + "ORDER BY price\n"
                + "asc\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, (index - 1) * 6);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getAProduct(int pID) {
        String query = "select * from Product where pID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, pID);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setpID(resultSet.getInt("pID"));
                product.setpName(resultSet.getString("pName"));
                product.setImge(resultSet.getString("imge"));
                product.setPrice(resultSet.getFloat("price"));
                product.setbID(resultSet.getInt("bID"));
                product.setQuality(resultSet.getInt("quality"));
                return product;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void insertCart(int pID, int accountID, int quality) {
        String query = "Insert into Carts values (?,?,?,0)";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, pID);
            SQLQuery.setInt(2, accountID);
            SQLQuery.setInt(3, quality);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateCart(int cid, int quality) {
        String query = "update Carts set quality = ? where cid = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, quality);
            SQLQuery.setInt(2, cid);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product checkProduct(int pID, int accountID) {
        String query = "select c.* from Account a, Carts c, Product p\n"
                + "where a.accountID = c.accountID\n"
                + "and c.[status] = 0\n"
                + "and c.pID = ?\n"
                + "and c.accountID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, pID);
            SQLQuery.setInt(2, accountID);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setcID(resultSet.getInt("cID"));
                product.setpID(resultSet.getInt("pID"));
                product.setAccountID(resultSet.getInt("accountID"));
                product.setQuality(resultSet.getInt("quality"));
                product.setStatus(resultSet.getInt("status"));
                return product;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductInCart(int userId) {
        List<Product> list = new ArrayList<Product>();
        String query = "select c.*, p.imge, p.pName, p.price\n"
                + "from Product p, Carts c \n"
                + "where c.accountID = ? \n"
                + "and c.pID = p.pID \n"
                + "and c.[status] = 0";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, userId);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setcID(resultSet.getInt("cID"));
                product.setpID(resultSet.getInt("pID"));
                product.setAccountID(resultSet.getInt("accountID"));
                product.setQuality(resultSet.getInt("quality"));
                product.setStatus(resultSet.getInt("status"));
                product.setImge(resultSet.getString("imge"));
                product.setpName(resultSet.getString("pName"));
                product.setPrice(resultSet.getFloat("price"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void deleteCart(int cID) {
        String query = "DELETE FROM Carts WHERE cID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, cID);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void payCart(String cID, int status) {
        String query = "update Carts set [status] = ? where cid = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, status);
            SQLQuery.setString(2, cID);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> VBill(int userId) {
        List<Product> list = new ArrayList<Product>();
        String query = "select c.*, p.imge, p.pName, p.price\n"
                + "from Product p, Carts c \n"
                + "where c.accountID = ? \n"
                + "and c.pID = p.pID \n"
                + "and c.[status] != 0";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, userId);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setcID(resultSet.getInt("cID"));
                product.setpID(resultSet.getInt("pID"));
                product.setAccountID(resultSet.getInt("accountID"));
                product.setQuality(resultSet.getInt("quality"));
                product.setStatus(resultSet.getInt("status"));
                product.setImge(resultSet.getString("imge"));
                product.setpName(resultSet.getString("pName"));
                product.setPrice(resultSet.getFloat("price"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateProduct(int pID, int quanlity, float price, String name, int bID) {
        String query = "update Product set quality = ?, price = ?, bID = ?, pName = ? where pID = ?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, quanlity);
            SQLQuery.setFloat(2, price);
            SQLQuery.setInt(3, bID);
            SQLQuery.setString(4, name);
            SQLQuery.setInt(5, pID);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(int pid) {
        String query = "delete from Product where pID=?";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setInt(1, pid);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void Product(String pName, String imge, int number, double price, int bID) {
        String query = "insert into Product values (?, ?, ?, ?, ?)";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            SQLQuery.setString(1, pName);
            SQLQuery.setString(2, imge);
            SQLQuery.setDouble(3, price);
            SQLQuery.setInt(4, bID);
            SQLQuery.setInt(5, number);
            SQLQuery.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> LBill() {
        List<Product> list = new ArrayList<Product>();
        String query = "select c.*, p.imge, p.pName, p.price, a.fName, a.[address], b.bName, a.phone\n"
                + "from Product p, Carts c, Account a, Brand b\n"
                + "where 1=1\n"
                + "and a.accountID = c.accountID\n"
                + "and c.pID = p.pID \n"
                + "and p.bID = b.bID\n"
                + "and c.[status] != 0";
        try {
            DBConnection = makeConnection();
            SQLQuery = DBConnection.prepareStatement(query);
            resultSet = SQLQuery.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setcID(resultSet.getInt("cID"));
                product.setpID(resultSet.getInt("pID"));
                product.setAccountID(resultSet.getInt("accountID"));
                product.setQuality(resultSet.getInt("quality"));
                product.setStatus(resultSet.getInt("status"));
                product.setImge(resultSet.getString("imge"));
                product.setpName(resultSet.getString("pName"));
                product.setPrice(resultSet.getFloat("price"));
                product.setfName(resultSet.getString("fName"));
                product.setAddress(resultSet.getString("address"));
                product.setbName(resultSet.getString("bName"));
                product.setPhone(resultSet.getString("phone"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        List<Product> a = p.getNewProduc4();
        for (Product product : a) {
            System.out.println(product.toString());
        }
    }
}
