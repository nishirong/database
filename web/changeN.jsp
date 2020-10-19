<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.person" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id= (String)request.getParameter("id");
    String new_nick= (String)request.getParameter("new_nick");
    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();
    person person = new person(con,id);
    person.work();
    person.changeNick(new_nick);
    out.print("<script language='javaScript'> alert('修改昵称成功');</script>");
    response.sendRedirect("person.jsp?id="+id);
%>
</body>
</html>
