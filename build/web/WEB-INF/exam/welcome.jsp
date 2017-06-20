
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
        <title>在线考试系统_我的考试</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    ${art.title}
                </h3>
            </div>
            <div class="panel-body"> 
                ${art.content}

                <blockquote class="pull-right">
                    发布人:&nbsp;${art.author}
                    <small>发布时间: &nbsp;&nbsp;${art.dateline}</small>
                </blockquote>

            </div>
        </div>
    </body>
</html>
