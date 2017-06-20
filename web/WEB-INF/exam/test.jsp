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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在线考试系统</title>
    </head>
    <body>

        <form  id="test" role="form" action="exam_send" method="post" >
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseOne">
                                试卷信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <li>考试科目:  ${exam.name}</li>
                            <li>出题人:  ${exam.author}</li>
                            <li>出题时间:  ${exam.dateline}</li><br>
                            <input type="hidden" name="id" value="${exam.id}"/>
                            <input type="hidden" name="cId" value="${exam.cId}"/>
                            <input type="hidden" name="SCQscore" value="${exam.SCQscore}"/>
                            <input type="hidden" name="MCQscore" value="${exam.MCQscore}"/>
                            <input type="hidden" name="CODEscore" value="${exam.CODEscore}"/>
                            <p><strong>请勿刷新页面,刷新页面无法保存答题信息!</strong></p>
                            <button type="submit"  class="btn btn-default">提交答案</button>(请在下面答题区答题后再进行提交)
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseTwo">
                                单选题（本大题共${fn:length(exam.SCQlist)}小题，每小题${exam.SCQscore}分，共30分)
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <s:iterator value="exam.SCQlist" var="SCQ" status="sta"> 
                                <div class="form-group">
                                    <label >${sta.count}.${SCQ.question}</label><br>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="SCQanswer[${sta.count-1}]" id="op1" value="A" >A.${SCQ.selectionA}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="SCQanswer[${sta.count-1}]" id="op2" value="B">B.${SCQ.selectionB}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="SCQanswer[${sta.count-1}]" id="op3" value="C">C.${SCQ.selectionC}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="SCQanswer[${sta.count-1}]" id="op4" value="D">D.${SCQ.selectionD}
                                    </label>
                                </div>
                            </s:iterator>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseThree">
                                多选题（本大题共${fn:length(exam.MCQlist)}小题，每小题${exam.MCQscore}分，共20分)
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <s:iterator value="exam.MCQlist" var="MCQ" status="sta"> 
                                <div class="form-group">
                                    <label>${sta.count}.${MCQ.question}</label><br>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="MCQanswer[${sta.count-1}]" id="op1" value="A" >A.${MCQ.selectionA}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="MCQanswer[${sta.count-1}]" id="op2" value="B">B.${MCQ.selectionB}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="MCQanswer[${sta.count-1}]" id="op3" value="C">C.${MCQ.selectionC}
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="MCQanswer[${sta.count-1}]" id="op4" value="D">D.${MCQ.selectionD}
                                    </label>
                                </div>
                            </s:iterator>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" 
                               href="#collapseFour">
                                简答题（本大题共${fn:length(exam.codeQlist)}小题，每小题${exam.CODEscore}分，共50分)
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <s:iterator value="exam.CodeQlist" var="codeQ" status="sta"> 
                                <div class="form-group">
                                    <label>${sta.count}.${codeQ.question}</label><br>
                                    <input type="hidden" name="CODEanswer[${sta.count-1}].id" value="${codeQ.id}"/>
                                    <textarea  class="form-control"  style="width:90%" id="answer"  name="CODEanswer[${sta.count-1}].answer" cols="60" rows="5"  ></textarea>
                                </div>
                            </s:iterator>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>

</html>
