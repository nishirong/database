<%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/17
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.logger" %>
<html>
<head>
    <title>注册信息</title>
</head>
<body>
<div>
    <form id="login" name="login" action="login_success.jsp" method="post">
        <table border="0">
            <tr>
                <td>id</td>
                <td><input type="text" name="login_id"></td>
            </tr>
            <tr>
                <td>author</td>
                <td><input type="text" name="login_author"></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input type="password" name="login_pass0"></td>
            </tr>
            <tr>
                <td>昵称</td>
                <td><input type="text" name="nick_name"></td>
            </tr>
            <td><input type="submit" value="注册" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
    <br>
</div>
<form id="index_back" name="index_back" action="index.jsp" method="post">
<input type="submit" name="index_back"  value="返回登陆界面">
</form>
</body>
</html>
