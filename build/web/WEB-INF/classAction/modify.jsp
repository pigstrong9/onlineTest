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
        <title>课程管理</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    班级列表
                </h3>
            </div>
            <div class="panel-body " style="padding:0px 0px 0px 0px;">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>班级编号</th>
                            <th>课程编号</th>
                            <th>课程名称</th>
                            <th>教师编号</th>
                            <th>教师名称</th>
                            <th>班级人数</th> 
                            <th>操作</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="classList"  var="c">  
                            <tr>
                                <td>${c.cid}</td>
                                <td>${c.lessionId}</td>
                                <td>${c.name}</td> 
                                <td>${c.tecId}</td> 
                                <td>${c.tecName}</td> 
                                <td>${c.menber}</td>
                                <td><a href="classAction_delClass?cId=${c.cid}"  class="btn btn-default btn-xs  btn-danger" role="button" onclick="return ifDel()">删除</a></td>
                            </tr> 
                        </s:iterator> 
                    </tbody>
                </table>
                <button class="btn btn-default" id="newClass">开设新班级</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" id="newLession">添加课程</button>
            </div>
        </div>
        <div class="panel panel-default div-hide" id="addClass">
            <div class="panel-heading">
                <a class="close" id="addClassClose" >
                    &times;
                </a>
                <h3 class="panel-title">
                    开设新班级
                </h3>
            </div>
            <div class="panel-body ">
                <form role="form" class="form-inline" method="post" action="classAction_addClass">
                    <div class="form-group">
                        <label for="lessionId">请选择课程:</label>
                        <select class="form-control" name="newClass.lessionId">
                            <s:iterator value="lessionList"  var="l">  
                                <option value="${l.lessionId}">${l.name}</option>
                            </s:iterator>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tecId">请选择授课教师:</label>
                        <select class="form-control" name="newClass.tecId">
                            <s:iterator value="teacherList"  var="t">  
                                <option value="${t.username}">${t.name}</option>
                            </s:iterator>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
        <div class="panel panel-default div-hide" id="addLession">
            <div class="panel-heading">
                <a class="close" id="addLessionClose" >
                    &times;
                </a>
                <h3 class="panel-title">
                    添加课程
                </h3>
            </div>
            <div class="panel-body">
                <form role="form" class="form-inline" method="post" action="classAction_addLession">
                    <div class="form-group">
                        <label for="lessionId">课程编号:</label>
                        <input type="text" class="form-control"  name="newLession.lessionId" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="name">课程名称:</label>
                        <input type="text" class="form-control"  name="newLession.name" required="required"/>
                    </div>        
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </body>
</html>

