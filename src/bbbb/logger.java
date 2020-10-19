package bbbb;

import java.sql.Connection;
import java.sql.Statement;

public class logger {

    private Statement statement = null;
    private String sql = null;
    private Connection con;
    public logger(Connection con){
        this.con=con;
    }
    public int work(String id,String author,String password){
        int result;
        try {
            statement = con.createStatement();
            sql = "insert into table1(id, author, submisssion_date, password) values('" +
                    id +
                    "','" +
                    author +
                    "', NOW(),'"+
                    password+"');";
            //System.out.println(sql.toString());
            statement.executeUpdate(sql);
            result=0;
        } catch (Exception e) {
            boolean x = e.getClass().toString().equals("class java.sql.SQLIntegrityConstraintViolationException");
            System.out.println(e.getClass().toString());
            boolean y = e.getClass().toString().equals("class com.mysql.cj.jdbc.exceptions.MysqlDataTruncation");
            if(x){
                result=3;
            }else if(y){
                result=2;
            } else{
            result=-1;
            e.printStackTrace();}
        } finally {
            try {
                if (statement != null)
                {
                    statement.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
