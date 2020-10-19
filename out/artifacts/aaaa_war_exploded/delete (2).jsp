<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/10/14
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除数据</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String in_delete = (String)request.getParameter("in_delete");
    String value = request.getParameter("del_slt");

    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();

    Statement statement = null;
    String sql = null;


    try {
        statement = con.createStatement();
        sql = "delete from table1 where " +
                value + "=\"" +
                in_delete + "\"";
        statement.executeUpdate(sql);
    } catch (Exception e) {
        e.printStackTrace();
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

    out.print("<script language='javaScript'> alert('已经删除数据');</script>");
    response.setHeader("refresh", "0, url=index.jsp");
%>



</body>
</html>
