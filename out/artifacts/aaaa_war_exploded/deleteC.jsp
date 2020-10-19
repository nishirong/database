<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.Commodity" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除商品</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String pub= (String)request.getParameter("pub");
    String com= (String)request.getParameter("com");
    Connection con = new MyConnection().getConnection();
    Commodity commodity = new Commodity(con);
    commodity.deleteC(pub,com);
    out.print("<script language='javaScript'> alert('成功删除商品');</script>");
%>
</body>
<input type="button" name="register_back" onclick="javascript:history.back(-1);" value="返回上一页">
</html>
