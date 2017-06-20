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
        <title>成绩录入</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    班级${cid}的名单
                </h3>
            </div>
            <div class="panel-body" style="padding:0px 0px 0px 0px;">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>学号</th>
                            <th>学生姓名</th>
                            <th>成绩</th>
                            <th>成绩状态</th> 
                            <th>操作</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="scoreList"  var="s">  
                            <tr>
                                <td>${s.sid}</td>
                                <td>${s.stuName}</td>
                                <td>${s.score}</td> 
                                <td>${s.state}</td>
                                <td><s:if test="#s.state=='待批改'">
                                        <a href="score_checkAnswer?sid=${s.sid}&cid=${s.cid}" class="btn btn-default btn-xs  btn-primary" role="button">查看答题情况</a>
                                    </s:if>
                                    <s:elseif test="#s.state=='待考试'||#s.state=='待补考'">
                                        <a href="score_delScore?sid=${s.sid}&cid=${s.cid}" class="btn btn-default btn-xs  btn-danger" role="button" onclick="return ifDel()">退选</a>
                                    </s:elseif>
                                </td>
                            </tr> 
                        </s:iterator>                          
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

