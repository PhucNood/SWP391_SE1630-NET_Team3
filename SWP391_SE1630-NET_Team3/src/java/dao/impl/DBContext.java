
package dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {


    public Connection getConnection() throws ClassNotFoundException, SQLException {

        String url = "jdbc:sqlserver://" + serverName + ":" + portName + ";databaseName = "
                + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userName, password);
    }

    private final String serverName = "localhost";
    private final String portName = "1433";
    private final String dbName = "SWP391_SE1630_N3";
    private final String userName = "sa";
    private final String password = "123123";
}
