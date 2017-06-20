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
        <title>在线考试系统</title>
    </head>
    <body> 
        <div class="col-md-2">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseOne">
                                <li>待考试科目</li>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <s:iterator value="#session.lessionList1" var="List" > 
                                <p> <a href="exam_test?id=${List.cid}" target="test">${List.name}</a> </p>                              
                            </s:iterator>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseTwo">
                                <li>待补考科目</li>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <s:iterator value="#session.lessionList2" var="List"> 
                                <p> <a href="exam_test?id=${List.cid}" target="test">${List.name}</a> </p>                              
                            </s:iterator>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseThree">
                                <li>待批阅科目</li>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <s:iterator value="#session.lessionList3" var="List"> 
                                <p> ${List.name} </p>                              
                            </s:iterator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <iframe id="test" name="test"  frameborder="0" width="100%"  height="680" src="exam_welcome"></iframe>
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
