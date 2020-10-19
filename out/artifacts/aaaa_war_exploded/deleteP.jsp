<%@ page import="bbbb.MyConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.person" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销用户</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = (String)request.getParameter("id");
    String password= (String)request.getParameter("password");
    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();
    person person = new person(con,id);
    person.work();
    person.delect();
    out.print("<script language='javaScript'> alert('注销成功');</script>");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
