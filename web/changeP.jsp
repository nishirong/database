<%@ page import="bbbb.person" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %><%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改密码</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = (String)request.getParameter("id");
    String pre= (String)request.getParameter("old_p");
    String now= (String)request.getParameter("new_p");
    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();
    person person = new person(con,id);
    person.work();
    person.changePassWord(pre,now);
    out.print("<script language='javaScript'> alert('修改密码成功，请重新登陆');</script>");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
