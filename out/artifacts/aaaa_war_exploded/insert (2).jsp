<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/10/13
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入数据</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String in_id = (String)request.getParameter("in_id");
    String in_title = (String)request.getParameter("in_title");
    String in_author = (String)request.getParameter("in_author");
    // java.util.Date utildate = new java.util.Date();
    // Date in_date = new Date(utildate.getTime());
    %>

<br>

<%
    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();

    Statement statement = null;
    String sql = null;

    try {
        statement = con.createStatement();
        sql = "insert into table1 values(" +
                in_id +
                ",'" +
                in_title +
                "','" +
                in_author +
                "', NOW())";
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

    out.print("<script language='javaScript'> alert('已经插入数据');</script>");
    response.setHeader("refresh", "0, url=index.jsp");

%>


</body>
</html>
