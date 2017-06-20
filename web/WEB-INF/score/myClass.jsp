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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>成绩录入</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    成绩预览
                </h3>
            </div>
            <div class="panel-body" style="padding:0px 0px 0px 0px;">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>班级编号</th>
                            <th>课程编号</th>
                            <th>课程名称</th>
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
                                <td>${c.menber}</td>
                                <td><a href="score_classList?cid=${c.cid}"  class="btn btn-default btn-xs  btn-primary" role="button">查看</a></td>
                            </tr> 
                        </s:iterator>                          
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

