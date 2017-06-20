<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=request.getContextPath()%>/">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/model.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/list.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在线考试系统</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    用户列表
                </h3>
            </div>
            <div class="panel-body" style="padding:0px 0px 0px 0px;">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>学号/用户名</th>
                            <th>姓名</th>
                            <th>联系方式</th> 
                            <th>电子邮箱</th> 
                            <th>系别</th> 
                            <th>用户类型</th> 
                            <th>操作</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="userList" var="ul">  
                            <tr>
                                <td>${ul.username}</td>
                                <td>${ul.name}</td> 
                                <td>${ul.phone}</td>
                                <td>${ul.email}</td>
                                <td>${ul.major}</td>
                                <td>${ul.typeName}</td>
                                <td><s:if test="#session.user.username==#ul.username">无法删除</s:if><s:else><a href="user_delUser?username=${ul.username}"  onclick="return ifDel()" class="btn btn-default btn-xs  btn-danger" role="button" >删除</a></s:else></td>
                                </tr> 
                        </s:iterator>  
                    </tbody>
                </table>
                <button class="btn btn-default" data-toggle="modal" data-target="#addUserModel">添加用户</button>
            </div>
        </div>

        <div class="modal fade" id="addUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:450px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加用户
                        </h4>
                    </div>
                    <form role="form" class="form-horizontal" method="post" action="user_addUser" >
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="type" class="col-sm-4 control-label">类型:</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="user.type" >
                                        <option value="0">学生</option>
                                        <option value="1">教师</option>
                                        <option value="2">管理员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="col-sm-4 control-label" >用户名/学号 :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control"  name="user.username"  required="required"/>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="major" class="col-sm-4 control-label">系别 :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control"  name="user.major"  required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-4 control-label">姓名:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control"  name="user.name" required="required"/>
                                </div>
                            </div> 
                            <div class="form-group" >
                                <label for="phone" class="col-sm-4 control-label">联系方式:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control"  name="user.phone"/>
                                </div>
                            </div>                
                        </div>
                        <div class="modal-footer">   
                            <button type="reset" class="btn btn-default">重置</button>
                            <button type="sumbit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </body>   
</html>
