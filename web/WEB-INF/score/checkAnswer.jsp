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
                    学生${sid}的答题情况
                </h3>
            </div>

            <div class="panel-body" style="padding:0px 0px 0px 0px;">
                <form action="score_calculate" method="post">
                    <input value="${sid}" name="sid" type="hidden"/>
                    <input value="${cid}" name="cid" type="hidden"/>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th width="50px;">题目编号</th>
                                <th width="150px;">题目信息</th>
                                <th width="200px;">正确答案</th>
                                <th width="300px;">学生答案</th> 
                                <th width="50px;">分数</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="answerList"  var="al" status="sta">  
                                <tr>
                                    <td>${al.id}</td>
                                    <td>${al.question}</td>
                                    <td>${al.answer}</td> 
                                    <td>${al.stuAnswer}</td>
                                    <td><input type="number" name="score" id="defen" class="form-control" placeholder="分值:${fenzhi}"  min="0"  max="${fenzhi}" style="width:100px;" value="0"/></td>
                                </tr> 
                            </s:iterator>  
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-default">提交成绩</button>
                </form>
            </div>
        </div>
    </body>

</html>
