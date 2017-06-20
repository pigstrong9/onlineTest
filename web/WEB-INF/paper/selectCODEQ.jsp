<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    简答题列表
                </h3>
            </div>
            <div class="panel-body">
                <s:if test="CODEQlist==null ||CODEQlist.size()<1">没有题目!<a href="paper_myPaper">返回列表</a></s:if>
                <s:iterator value="CODEQlist" var="c" status="sta">
                    <div class="col-lg-6" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    第${sta.count}道简答题
                                    <a class="close" href="paper_del?type=codeq&id=${c.id}" >
                                        &times;
                                    </a>
                                </h3>                     
                            </div>
                            <div class="panel-body">
                                <form role="form" action="paper_modify" method="post" id="CODEfrom">
                                    <input type="hidden" name="newCODEQ.id"  value="${c.id}"/> 
                                    <div class="form-group">
                                        <label >题目:</label>
                                        <textarea  class="form-control"  style="width:50%"   name="newCODEQ.question" cols="60" rows="5" required="required">${c.question}</textarea>
                                    </div>
                                    <div class="form-group"> 
                                        <label >答案</label><br>
                                        <textarea  class="form-control"  style="width:50%"   name="newCODEQ.answer" cols="60" rows="5" required="required">${c.answer}</textarea>
                                    </div>
                                    <div class="form-group"> 
                                        <button class="btn btn-default" type="sumbit">提交</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </s:iterator>
            </div>
        </div>

    </body>
</html>