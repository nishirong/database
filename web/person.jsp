<%--
  Created by IntelliJ IDEA.
  User: nishirong
  Date: 2020/10/18
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbbb.Register" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="bbbb.MyConnection" %>
<%@ page import="bbbb.person" %>

<html>
<head>
    <title>个人主页</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id= (String)request.getParameter("id");
    MyConnection tmp = new MyConnection();
    Connection con = tmp.getConnection();
    person person = new person(con,id);
    person.work();
    out.println("昵称："+person.getNick());
%>
<div>
        <form id="changen" name="changen" action="changeN.jsp" method="post">
            <table border="0">
                <tr>
                    <td>id</td>
                    <td><input type="text" name="id"></td>
                    <td>新昵称</td>
                    <td><input type="text" name="new_nick"></td>
                </tr>
                <td><input type="submit" value="修改昵称" style="color:#BC8F8F"></td>
                </tr>
            </table>
        </form>
</div>
<div>
    <form id="login" name="login" action="changeP.jsp" method="post">
        <table border="0">
            <tr>
                <td>id</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>旧密码</td>
                <td><input type="password" name="old_p"></td>
            </tr>
            <tr>
                <td>新密码</td>
                <td><input type="password" name="new_p"></td>
            </tr>
            <td><input type="submit" value="修改密码" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
    <br>
</div>
<div>
    <form id="delete" name="delete" action="deleteP.jsp" method="post">
        <table border="0">
            <tr>
                <td>id</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password"></td>
            </tr>
            <td><input type="submit" value="注销用户" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
    <br>
</div>
<div>
    <form id="addCom" name="addCom" action="addCom.jsp" method="post">
        <table border="0">
            <tr>
                <td>发布者id</td>
                <td><input type="text" name="publisher"></td>
            </tr>
            <tr>
                <td>名字</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>种类</td>
                <td><input type="text" name="type"></td>
            </tr>
            <tr>
                <td>价格</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>详细描述</td>
                <td><input type="text" name="details"></td>
            </tr>
            <td><input type="submit" value="发布商品" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
</div>
<div>
    <form id="searchCom" name="searchCom" action="searchP.jsp" method="post">
        <table border="0">
            <tr>
                <td>发布者id</td>
                <td><input type="text" name="publisher"></td>
            </tr>
            <td><input type="submit" value="查找" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
</div>
<div>
    <form id="searchComC" name="searchComC" action="searchN.jsp" method="post">
        <table border="0">
            <tr>
                <td>查找人id</td>
                <td><input type="text" name="id_p"></td>
            </tr>
            <tr>
                <td>商品名称</td>
                <td><input type="text" name="name"></td>
            </tr>
            <td><input type="submit" value="查找" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
</div>
<div>
    <form id="deleteC" name="deleteC" action="deleteC.jsp" method="post">
        <table border="0">
            <tr>
                <td>发布者id</td>
                <td><input type="text" name="pub"></td>
            </tr>
            <tr>
                <td>物品id</td>
                <td><input type="text" name="com"></td>
            </tr>
            <td><input type="submit" value="删除物品" style="color:#BC8F8F"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
