package bbbb;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class Commodity {
    private Connection con;
    private Statement statement;
    private String sql = null;
    private String id;
    public  Commodity(Connection con){
        this.con=con;
    }
    public void add(String name,String ty,String price,String deta,String pub){
        try {
            statement = con.createStatement();
            String id = name+pub;
            sql = "insert commodity(id, name, type,submission, price,details,publisher) values('" +
                    id + "','" + name + "','" + ty + "', NOW(),'"+ price+ "','" + deta +"','" +
                    pub+"');";
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
    public ArrayList<HashMap<String,String>> searchN(String name){
        ResultSet rs = null;
        ArrayList<HashMap<String,String>> x = new ArrayList<>();
        try {
            statement = con.createStatement();
            sql = "select * from commodity where name='"+name+"';";
            rs=statement.executeQuery(sql);
            while(rs.next()){
                HashMap<String,String> tmp = new HashMap<>();
                String id = rs.getString("id");
                String name0 = rs.getString("name");
                String type = rs.getString("type");
                Date date = rs.getDate("submission");
                String price = rs.getString("price");
                String details = rs.getString("details");
                String publisher = rs.getString("publisher");
                tmp.put("id",id);
                tmp.put("name",name0);
                tmp.put("type",type);
                tmp.put("submission",date.toString());
                tmp.put("price",price);
                tmp.put("details",details);
                tmp.put("publisher",publisher);
                x.add(tmp);
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
        return x;
    }

    public ArrayList<HashMap<String,String>> searchP(String publish){
        ResultSet rs=null;
        ArrayList<HashMap<String,String>> x = new ArrayList<>();
        try {
            statement = con.createStatement();
            sql = "select * from commodity where publisher='"+publish+"';";
            rs=statement.executeQuery(sql);
            while(rs.next()){
                HashMap<String,String> tmp = new HashMap<>();
                String id = rs.getString("id");
                String name = rs.getString("name");
                String type = rs.getString("type");
                Date date = rs.getDate("submission");
                String price = rs.getString("price");
                String details = rs.getString("details");
                String publisher = rs.getString("publisher");
                tmp.put("id",id);
                tmp.put("name",name);
                tmp.put("type",type);
                tmp.put("submission",date.toString());
                tmp.put("price",price);
                tmp.put("details",details);
                tmp.put("publisher",publisher);
                x.add(tmp);
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
        return x;
    }

    public void deleteC(String idp,String idc){

        try {
            statement = con.createStatement();
            sql = "delete from commodity where publisher='"+idp+"'and id='"+idc+"'";
            System.out.println(sql);
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
