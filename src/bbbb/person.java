package bbbb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class person {
    private Statement statement = null;
    private String sql = null;
    private Connection con;
    private String id;
    private String nick;
    private String password;
    public person(Connection con,String id){
        this.id=id;
        this.con=con;
    }
    public String getNick(){
        return this.nick;
    }
    public void work(){
        try {
            statement = con.createStatement();
            sql = "SELECT nick,password FROM table1 where id" +
                    "='" +
                    id + "'";
            ResultSet rs = statement.executeQuery(sql);
            //System.out.println(user);
            if (rs.next()) {
                this.nick=rs.getString("nick");
                this.password=rs.getString("password");
            }
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
    public void changeNick(String nickname){
        int result=1;
        try {
            statement = con.createStatement();
            sql = "Update table1 Set nick= '"+nickname+"'where id" +
                    "='" +
                    id + "'";
            int ret = statement.executeUpdate(sql);
            nick = nickname;
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
    public int changePassWord(String pre,String now) throws SQLException {

        if(pre.equals(password)&&password!=null){
            try {
                statement = con.createStatement();
                sql = "Update table1 Set password= '"+now+"'where id" +
                        "='" +
                        id + "'";
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
            return 0;
        }else{
            return -1;
        }
    }
    public void delect(){
        try {
            statement = con.createStatement();
            sql = "DELETE FROM table1 where id" +
                    "='" +
                    id + "'";
            int ret = statement.executeUpdate(sql);
            //System.out.println(user);
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
