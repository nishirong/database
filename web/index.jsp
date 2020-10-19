<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/10/12
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html xmlns:th="http://www.thymeleaf.org">
<html>
  <head>
    <title>作业一</title>
      <link
              href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"
              rel="stylesheet" />
      <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
      <script
              src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js">

      </script>
      <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
      <script
              src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js">

      </script>
  </head>
  <body>
  <%@ page import="bbbb.*"  %>
  <%@ page import="java.sql.ResultSet" %>
  <%@ page import="java.sql.Connection" %>
  <%@ page import="java.sql.Date" %>
  <%@ page import="java.sql.Statement" %>
  <%@ page import="bbbb.Register" %>
  <%@ page import="org.w3c.dom.CDATASection" %>
  <%--用户登陆表格--%>
  <form id="form1" class="well"
        style="width: 30em; margin: auto; margin-top: 150px;"action="register.jsp";method="post">
      <h3>用户登录</h3>
      <div class=" input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon1"><i
                      class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
          <input
              id="userName" name="user" type="text" class="form-control" placeholder="用户名"
              aria-describedby="sizing-addon1" />
      </div>
      <br />
      <div class="input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon1"><i
                      class="glyphicon glyphicon-lock"></i></span>
          <input type="password"
                 id="password" name="pass" class="form-control" placeholder="密码"
                 aria-describedby="sizing-addon1" />
      </div>
      <!--     <div class="well well-sm" style="text-align: center;">
               <input  type="radio" name="kind" value="tea" /> 管理员 <input
                     type="radio" name="kind" value="stu" /> 学生
           </div>
       -->
      <td><input type="submit" value="登录" style="color:#BC8F8F"></td>
      <a class="btn btn-sm btn-white btn-block" style="text-align: right;"
         th:href="@{register}" href="loginer.jsp"><h6>还没有账户？前往注册</h6></a>

  </form>
  <script>
      $("#form1").on("click",".btn",function(e){
          var radioValue = $('input:radio[name="kind"]:checked').val();
          var formData=$("#form1").serialize();

          $.ajax({
              url:"/login",
              type:"post",
              data:{"userName":$("#userName").val(),"password":$("#password").val()},
              dataType:"json",
              success:function(result){
                      window.location.href = "http://www.baidu.com";
              }
          })
      })
  </script>
  </body>
</html>
