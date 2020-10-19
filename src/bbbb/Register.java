package bbbb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Register {

    private Statement statement = null;
    private String sql = null;
    private Connection con;
    private String user;
    private String password;
    private String id;

    public Register(Connection con,String user,String password){
        this.con = con;
        this.user=user;
        this.password=password;
    }


    public int RegisterItem() {
        int result=1;
        try {
            statement = con.createStatement();
            sql = "SELECT * FROM table1 where author" +
                    "='" +
                    user + "'" + "or id" +
                    "='" + user + "'";
            ResultSet rs = statement.executeQuery(sql);
            //System.out.println(user);
            int flag = 0;
            while (rs.next()) {
                flag = 1;
                if (password.equals(rs.getString("password"))) {
                    System.out.println("获得成功");
                    id=rs.getString("id");
                    result = 0;
                } else {
                    System.out.println("密码错误");
                    result= 1;
                }
            }
            if (flag == 0) {
                System.out.println("不存在账号");
                result= 2;
            }
        } catch (Exception e) {
            result=-1;
        } finally {
            try {
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String getId(){
        return id;
    }
}
