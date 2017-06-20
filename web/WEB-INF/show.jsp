<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>   
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="<%=request.getContextPath()%>/">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/model.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在线考试系统</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index_show">在线考试系统</a>
                </div>
                <div>
                    <ul class="nav navbar-nav" id="menu">
                        <li class="active" onclick="changeActive(this,${fn:length(session.Menu)})" id="menu0"><a href="index_list" target="iframeBox" >首页</a></li>
                            <s:iterator value="#session.Menu" var="m"> 
                            <li onclick="changeActive(this,${fn:length(session.Menu)})" id="menu${m.sx}"><a href="${m.menuUrl}" target="iframeBox" >${m.menu}</a></li>                                               
                            </s:iterator>
                    </ul>
                </div>
                <ul class="nav navbar-nav navbar-right"> 
                    <li><a href="javascript:void(0)" data-toggle="modal" data-target="#myInfo" style="outline:none;"><span class="glyphicon glyphicon-user"></span> 欢迎你,${user.name}</a></li> 
                    <li><a href="user/logout" ><span class="glyphicon glyphicon-log-in"></span> 注销</a></li> 
                </ul> 
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <iframe id="iframeBox"  name="iframeBox" frameborder="0" width="100%"  height="690" src="index_list"></iframe>
            </div>
        </div>


        <div class="modal fade" id="myInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:450px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">个人资料</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="index_modifyInfo" id="user_form">
                            <input type="hidden" name="user.type" value="${user.type}"/>
                            <div class="form-group">
                                <label for="username" class="col-sm-4 control-label">用户名/学号 :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control input1"  name="user.username" readonly="true" value="${user.username}"/>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="major"  class="col-sm-4 control-label">系别 :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control input1"  name="user.major" readonly="true" value="${user.major}"/>
                                </div>

                            </div>
                            <div class="form-group" >
                                <label for="name"  class="col-sm-4 control-label">姓名:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control input1" value="${user.name}"  name="user.name" required="required"/>
                                </div>

                            </div> 
                            <div class="form-group" >
                                <label for="phone"  class="col-sm-4 control-label">联系方式:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control input1" value="${user.phone}" name="user.phone" required="required"/>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="email"  class="col-sm-4 control-label">电子邮箱 :</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control input1" value="${user.email}" name="user.email"/>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myPassword" data-dismiss="modal">修改密码</button>
                        <button type="sumbit" class="btn btn-primary" form="user_form" >提交更改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="myPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            密码修改
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" action="index_modifyPassword" method="post" onsubmit="return jg()" id="user_passwordForm">
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">旧密码:</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" name="password" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newPassword" class="col-sm-4 control-label">新密码:</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" name="newPassword" id="password" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="qPassword" class="col-sm-4 control-label">确认密码 :</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control"  name="qPassword" id="password_confirm" required="required"/>
                                </div>
                            </div>         
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#myInfo">
                            修改资料
                        </button>
                        <button class="btn btn-primary" type="sumbit" class="btn btn-primary" form="user_passwordForm">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </body>
    <script src="js/jquery.min.js" ></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/list.js"></script>
</html>
