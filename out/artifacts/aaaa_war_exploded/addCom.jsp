<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.Commodity" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name= (String)request.getParameter("name");
    String type= (String)request.getParameter("type");
    String price= (String)request.getParameter("price");
    String details = (String)request.getParameter("details");
    String pub = (String)request.getParameter("publisher");
    Connection con = new MyConnection().getConnection();
    Commodity com = new Commodity(con);
    com.add(name,type,price,details,pub);
    out.println();
    out.print("<script language='javaScript'> alert('添加商品成功');</script>");
%>
</body>
<input type="button" name="register_back" onclick="javascript:history.back(-1);" value="返回上一页">
</html>
