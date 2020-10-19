<%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/17
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.logger" %>
<html>
<head>
    <title>注册结果</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String in_id = (String) request.getParameter("login_id");
        String in_author = (String) request.getParameter("login_author");
        String in_pass = (String) request.getParameter("login_pass0");
        Connection con  = new MyConnection().getConnection();
        logger log = new logger(con);
        System.out.println(in_id);
        System.out.println(in_author);
        System.out.println(in_pass);
        int result = log.work(in_id,in_author,in_pass);
        switch(result){
            case 0:
                out.print("<script language='javaScript'> alert('注册成功');</script>");
                response.setHeader("refresh", "0, url=loginer.jsp");
                break;
            case 1:
                out.print("<script language='javaScript'> alert('手机号码不合法');</script>");
                response.setHeader("refresh", "0, url=loginer.jsp");
                break;
            case 2:
                out.print("<script language='javaScript'> alert('账号或者密码太长');</script>");
                response.setHeader("refresh", "0, url=loginer.jsp");
                break;
            case 3:
                out.print("<script language='javaScript'> alert('该账号已存在');</script>");
                response.setHeader("refresh", "0, url=loginer.jsp");
                break;
            default:
                out.print("<script language='javaScript'> alert('发生了一些不可预知的错误');</script>");
                response.setHeader("refresh", "0, url=loginer.jsp");
                break;
        }
    %>

</body>
</html>
