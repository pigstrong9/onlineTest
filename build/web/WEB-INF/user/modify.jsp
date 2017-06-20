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
        <style type="text/css">
           #collapseOne{
                text-align: center;
            }
        </style>
    </head>
    <body>       
            <aside class="col-md-2">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" 
                                   href="#collapseOne">
                                    按用户筛选
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="user_list?type=0" target="list">学生</a></li>                              
                                    <li class="list-group-item"><a href="user_list?type=1" target="list">教师</a></li>                              
                                    <li class="list-group-item"><a href="user_list?type=2" target="list">管理员</a></li>  
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" 
                                   href="#collapseTwo">
                                    按学号搜索
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <form action="user_list" method="get" target="list">
                                    <div class="input-group">
                                        <input type="text" name="username"  class="form-control" required="required">
                                        <span class="input-group-btn">
                                            <center>
                                                <button class="btn btn-default" id="search" type="sumbit">
                                                    搜索
                                                </button>
                                            </center>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" 
                                   href="#collapseThree">
                                    排序
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>暂未开放:)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <div class="col-md-10">
                <iframe id="list" name="list"  frameborder="0" width="100%"  height="680" src="user_list"></iframe>
            </div>
    </body>
    <script type="text/javascript">
        $(function () {
            $('#collapseOne').collapse({
                toggle: false
            })
        });
        $(function () {
            $('#collapseTwo').collapse({
                toggle: false
            })
        });
        $(function () {
            $('#collapseThree').collapse({
                toggle: false
            })
        });

    </script>
</html>
