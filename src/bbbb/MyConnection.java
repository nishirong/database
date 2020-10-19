
package bbbb;

import java.sql.*;

public class MyConnection {
    private static Connection con;
    private static final String URL = "jdbc:mysql://localhost:3306/exercise?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "Dylan";

    public MyConnection () throws SQLException
    {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //加载MySql
            System.out.println("数据库驱动加载成功");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            //获得数据库连接
            System.out.println("数据库连接成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return con;
    }

}


