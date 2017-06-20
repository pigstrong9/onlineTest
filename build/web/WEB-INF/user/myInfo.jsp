<%@page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>   
    <head>
        <base href="<%=request.getContextPath()%>/">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/model.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在线考试系统</title>
        <style type="text/css">
            input[type="text"]:disabled{
                width:80px;
            }
            .input1{
                margin-top: 5px;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    个人资料
                </h3>
            </div>
            <div class="panel-body">
                <form role="form" class="form-inline" method="post" action="user_modifyInfo">
                    <input type="hidden" name="user.type" value="${user .type}"/>
                    <div class="form-group">
                        <label for="username">用户名/学号 :</label>
                        <input type="text" class="form-control input1"  name="user.username" disabled value="${user.username}"/>
                    </div>
                    <div class="form-group">
                        <label for="major">系别 :</label>
                        <input type="text" class="form-control input1"  name="user.major" disabled value="${user.major}"/>
                    </div>
                    <div class="form-group">
                        <label for="name">姓名:</label>
                        <input type="text" class="form-control input1" value="${user.name}"  name="user.name" required="required"/>
                    </div> 
                    <div class="form-group">
                        <label for="phone">联系方式:</label>
                        <input type="text" class="form-control input1" value="${user.phone}" name="user.phone" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="email">电子邮箱 :</label>
                        <input type="email" class="form-control input1" value="${user.email}" name="user.email"/>
                    </div>
                    <button type="submit" class="btn btn-default">修改资料</button>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    密码修改
                </h3>
            </div>
            <div class="panel-body">
                <form role="form" class="form-inline" action="user_modifyPassword" method="post" onsubmit="return jg()">
                    <div class="form-group">
                        <label for="password">旧密码:</label>
                        <input type="password" class="form-control" name="password" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">新密码:</label>
                        <input type="password" class="form-control" name="newPassword" id="password" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="qPassword">确认密码 :</label>
                        <input type="password" class="form-control"  name="qPassword" id="password_confirm" required="required"/>
                    </div>         
                    <button type="submit" class="btn btn-default">修改密码</button>
                </form>
            </div>
        </div>
    </body>
    <script language="JavaScript">
        function jg() {
            if (document.getElementById("password").value !== document.getElementById("password_confirm").value)
            {
                alert("两次输入密码不相同!");
                return false;
            }
        }
    </script>
</html>

