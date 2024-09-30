package dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    public static Connection makeConnection() throws Exception {
        String connectionUrl = "jdbc:sqlserver://localhost\\NGHIA:1433;"
                + "databaseName=Web_Gamepad;user=sa;password=123";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection(connectionUrl);
        return con;
    }
}
