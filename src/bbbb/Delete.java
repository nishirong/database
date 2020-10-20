package bbbb;
//hsxugwdcjbc
import java.sql.Connection;
import java.sql.Statement;

public class Delete {
    private Statement statement = null;
    private String sql = null;

    public void DeleteItem(Connection con) {
        try {
            statement = con.createStatement();
            sql = "delete from table1 where author='百度'";
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
