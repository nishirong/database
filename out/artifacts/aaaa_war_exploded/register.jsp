<%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/17
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.Register" %>
<html>
<head>
    <title>登录界面</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String userName= (String)request.getParameter("user");
    String passWord =request.getParameter("pass");

    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();

    Register register = new Register(con,userName,passWord);
    int i = register.RegisterItem();
    if(i==0){
        //out.print("<script language='javaScript'> alert('登录成功欢迎你');</script>");
        String id = register.getId();
        out.print("<script language='javaScript'> alert('登录成功欢迎你');</script>");
        response.sendRedirect("person.jsp?id="+id);
    }else if(i==2){
        //out.println("不存在该账号信息");
        out.print("<script language='javaScript'> alert('不存在该账号信息');</script>");
        response.setHeader("refresh","5;URL=index.jsp");
    }else {
        out.print("<script language='javaScript'> alert('密码错误');</script>");
        response.setHeader("refresh","5;URL=index.jsp");}
%>

<input type="button" name="register_back" onclick="javascript:history.back(-1);" value="返回上一页">

</body>
</html>
