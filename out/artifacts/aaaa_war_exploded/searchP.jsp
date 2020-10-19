<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.Commodity" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查找我的商品</title>
</head>
<body>
<%
    Connection con = new MyConnection().getConnection();
    Commodity commodity = new Commodity(con);
    String na =(String)request.getParameter("publisher");
    ArrayList<HashMap<String,String>> mmm = commodity.searchP(na);
    out.print("<table border=\"1\">" +
            "<tr>" +
            "<td>id</td>" +
            "<td>name</td>" +
            "<td>type</td>" +
            "<td>submission</td>" +
            "<td>price</td>" +
            "<td>details</td>" +
            "<td>publisher</td>"+
            "</tr>");
    //System.out.println(rs.next());
    for(int i=0;i<mmm.size();i++){
        HashMap<String,String> rs= mmm.get(i);
        String id = rs.get("id");
        String name = rs.get("name");
        String type = rs.get("type");
        String date = rs.get("submission");
        String price = rs.get("price");
        String details = rs.get("details");
        String publisher = rs.get("publisher");
        out.print("<tr>" +
                "<td>" + id + "</td>" +
                "<td>" + name + "</td>" +
                "<td>" + type+ "</td>" +
                "<td>" + date + "</td>" +
                "<td>" + price + "</td>" +
                "<td>" + details + "</td>" +
                "<td>" + publisher + "</td>" +
                "</tr>");
    }
%>
</body>
<input type="button" name="register_back" onclick="javascript:history.back(-1);" value="返回上一页">
</html>
