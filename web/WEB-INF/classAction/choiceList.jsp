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
        <title>我要选课</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    选课列表
                </h3>
            </div>
            <div class="panel-body">
                <table class="table  table-bordered table-hover">
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
                                <th>${c.cid}</th>
                                <th>${c.lessionId}</th>
                                <th>${c.name}</th> 
                                <th>${c.tecId}</th> 
                                <th>${c.tecName}</th> 
                                <th>${c.menber}</th>
                                <th><a href="classAction_choiceClass?cId=${c.cid}">选择</a></th>
                            </tr> 
                        </s:iterator> 
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
