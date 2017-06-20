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
        <title>我的试卷</title>      
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    多选题列表
                </h3>
            </div>
            <div class="panel-body">
                <s:if test="MCQlist==null ||MCQlist.size()<1">没有题目!<a href="paper_myPaper">返回列表</a></s:if>
                <s:iterator value="MCQlist" var="m" status="sta">
                    <div class="col-lg-6" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    第${sta.count}道多选题
                                    <a class="close" href="paper_del?type=mcq&id=${m.id}" >
                                        &times;
                                    </a>
                                </h3>                     
                            </div>
                            <div class="panel-body">
                                <form role="form" action="paper_modify" method="post" id="MCQfrom">
                                    <input type="hidden" name="newMCQ.id" id="mcqId" value="${m.id}"/> 
                                    <div class="form-group">
                                        <label >题目:</label>
                                        <textarea  class="form-control"  style="width:50%"   name="newMCQ.question" cols="60" rows="5"  required="required">${m.question}</textarea>
                                    </div>
                                    <div class="form-group"> 
                                        <label >选项:(请勾选答案)</label><br>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="newMCQ.answer" id="op1" value="A" <s:if test="#m.answer.contains('A'.toString())" > checked </s:if>  >A.<input type="text"  class="form-control" value="${m.selectionA}" name="newMCQ.selectionA" required="required"/>
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="newMCQ.answer" id="op2" value="B"  <s:if test="#m.answer.contains('B'.toString())" > checked </s:if> >B.<input type="text"  class="form-control" value="${m.selectionB}" name="newMCQ.selectionB" required="required"/>
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="newMCQ.answer" id="op3" value="C"  <s:if test="#m.answer.contains('C'.toString())" > checked </s:if> >C.<input type="text"   class="form-control" value="${m.selectionC}" name="newMCQ.selectionC" required="required"/>
                                            </label> 
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="newMCQ.answer" id="op4" value="D"  <s:if test="#m.answer.contains('D'.toString())" > checked </s:if> >D.<input type="text"   class="form-control" value="${m.selectionD}" name="newMCQ.selectionD" required="required"/>
                                            </label>
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