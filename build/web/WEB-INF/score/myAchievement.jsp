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
        <title>我的成绩</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    成绩预览
                </h3>
            </div>
            <div class="panel-body">
                <table class="table  table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>课程编号</th>
                            <th>课程名称</th>
                            <th>授课教师</th> 
                            <th>分数</th> 
                            <th>状态</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="scoreList"  var="s">  
                            <tr>
                                <td>${s.lessionId}</td>
                                <td>${s.lessionName}</td> 
                                <td>${s.tecName}</td>
                                <td>${s.score}</td>
                                <td>${s.state}</td>
                            </tr> 
                        </s:iterator>       
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
