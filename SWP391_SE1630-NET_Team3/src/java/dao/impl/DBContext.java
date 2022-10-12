
package dao.impl;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public void closeConnection(Connection con) throws SQLException{
        if(con!=null){
            con.close();
        }
    }
    
    public void closeResultSet (ResultSet rs) throws SQLException{
        if(rs!=null){
            rs.close();
        }
    }
    
    public void closePrepareState (PreparedStatement ps) throws SQLException{
        if(ps!=null){
            ps.close();
        }
    }
}
