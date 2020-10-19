package bbbb;

import java.sql.Connection;
import java.sql.Statement;

public class Modify {
    private Statement statement = null;
    private String sql = null;

    public void ModifyItem(Connection con) {
        try {
            statement = con.createStatement();
            sql = "update table1 set author = '菜鸟教程' where id != 2";
            statement.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
