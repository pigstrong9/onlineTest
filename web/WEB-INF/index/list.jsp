<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    通知公告
                </h3>
            </div>
            <div class="panel-body"  style="padding:0px 0px 0px 0px;">
                <table class="table table-bordered table-hover" >
                    <thead>
                        <tr>
                            <th>公告标题</th>
                            <th>发布人</th>
                            <th>发布时间</th>
                                <s:if test="#session.user.type==2" >
                                <th>操作</th>
                                </s:if>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#session.artList" var="art">  
                            <tr>
                                <td><a href="index_article?id=${art.id}">${art.title}</a></td>
                                <td>${art.author}</td> 
                                <td>${art.dateline}</td>
                                <s:if test="#session.user.type==2" >
                                    <td>
                                        <a href="" class="btn btn-default btn-xs btn-primary" role="button">修改</a>
                                        <a href="" class="btn btn-default btn-xs  btn-danger" role="button">删除</a>
                                    </td>
                                </s:if>
                            </tr> 
                        </s:iterator> 
                    </tbody>
                </table>
                <s:if test="#session.user.type==2" > <button class="btn btn-default">添加文章</button></s:if>
            </div>
        </div>
    </body>
</html>
