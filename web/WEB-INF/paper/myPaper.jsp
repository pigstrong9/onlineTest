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
        <title>在线考试系统</title>
        <style type="text/css">
            .modal-body input[type=text]{
                width:250px;
            }
            </style>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    试卷预览    
                </h3> 
            </div>
            <div class="panel-body" style="padding:0px 0px 0px 0px;">
                <table align="center" class="table table-bordered  table-hover">
                    <thead>
                        <tr>
                            <td>试卷编号</td>
                            <th>班级编号</th>
                            <th>课程名称</th>
                            <th>单选题数目</th>
                            <th>多选题数目</th>
                            <th>简答题题数目</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="examList"  var="e">  
                            <tr>
                                <td>${e.id}</td>
                                <td>${e.cId}</td> 
                                <td>${e.name}</td>
                                <td><s:if test="#e.scqNumber > 0"><a href="paper_selectSCQ?examId=${e.id}"></s:if>${e.scqNumber}</a></td>
                                <td><s:if test="#e.mcqNumber > 0"><a href="paper_selectMCQ?examId=${e.id}"></s:if>${e.mcqNumber}</a></td>
                                <td><s:if test="#e.codeqNumber > 0"><a href="paper_selectCODEQ?examId=${e.id}"></s:if>${e.codeqNumber}</a></td>
                                <td>${e.dateline}</td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle btn-xs" 
                                                data-toggle="dropdown">
                                            添加 <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li id="addSCQ" onclick="addSCQ(${e.id})"><a href="javascript:void(0)"  data-toggle="modal" data-target="#addSCQModel">单选题</a></li>
                                            <li id="addMCQ"  onclick="addMCQ(${e.id})"><a href="javascript:void(0)" data-toggle="modal" data-target="#addMCQModel" >多选题</a></li>
                                            <li id="addCODEQ" onclick="addCODEQ(${e.id})"><a href="javascript:void(0)"  data-toggle="modal" data-target="#addCODEQModel">简答题</a></li>
                                        </ul>
                                    </div>
                                    <a href="paper_del?id=${e.id}" class="btn btn-default btn-xs  btn-danger"  onclick="return ifDel()" role="button">删除试卷</a>
                            </tr> 
                        </s:iterator>
                    </tbody>
                </table>
                <button class="btn btn-default" id="flip" >新建试卷</button>  <small class="close text-danger">没有添加题目的试卷无法被答题</small>
                <div id="selectLession" class="div-hide">
                    <s:if test="noExamList.isEmpty()" >全部科目已经出题完毕!</s:if>
                    <s:else>
                        <form  role="form" class="form-inline" action="paper_add" method="post">
                            <div class="form-group">
                                <label for="name">选择一门科目:&nbsp;</label>
                                <select class="form-control" name="cid">
                                    <s:iterator value="noExamList"  var="no">  
                                        <option value="${no.cid}" label="${no.tecName}的${no.name}">
                                        </s:iterator>
                                </select>
                            </div>                       
                            <div class="form-group">
                                <button type="sumbit" class="btn btn-primary" >新增试卷</button>
                            </div>

                        </form>
                    </s:else>
                </div>
            </div>
        </div>              
        <div class="modal fade" id="addSCQModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span id="SCQtitle"></span>
                        </h4>
                    </div>
                    <form role="form" action="paper_add" method="post" id="SCQfrom">
                        <div class="modal-body">
                            <input type="hidden" name="newSCQ.examId" id="scqId" value=""/> 
                            <div class="form-group">
                                <label >题目:</label>
                                <textarea  class="form-control"   name="newSCQ.question" cols="60" rows="5" placeholder="请输入单选题题目" required="required"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label >选项:(请选择答案)</label><br>
                                <label class="checkbox-inline">
                                    <input type="radio" name="newSCQ.answer" id="op1" value="A" >A.<input type="text"  class="form-control" placeholder="请输入A选项" name="newSCQ.selectionA" required="required"/>
                                </label>
                                <label class="checkbox-inline">                      
                                    <input type="radio" name="newSCQ.answer" id="op2" value="B">B.<input type="text"  class="form-control" placeholder="请输入B选项" name="newSCQ.selectionB" required="required"/>
                                </label><label class="checkbox-inline">
                                    <input type="radio" name="newSCQ.answer" id="op3" value="C">C.<input type="text"  class="form-control" placeholder="请输入C选项" name="newSCQ.selectionC" required="required"/>
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="newSCQ.answer" id="op4" value="D">D.<input type="text"  class="form-control" placeholder="请输入D选项" name="newSCQ.selectionD" required="required"/>
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">   
                            <button type="reset" class="btn btn-default">重置</button>
                            <button type="sumbit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>


        <div class="modal fade" id="addMCQModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span id="MCQtitle"></span>
                        </h4>
                    </div>
                    <form role="form" action="paper_add" method="post" id="MCQfrom">
                        <div class="modal-body">
                            <input type="hidden" name="newMCQ.examId" id="mcqId" value=""/> 
                            <div class="form-group">
                                <label >题目:</label>
                                <textarea  class="form-control"    name="newMCQ.question" cols="60" rows="5" placeholder="请输入多选题题目"  required="required"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label >选项:(请勾选答案)</label><br>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="newMCQ.answer" id="op1" value="A">A.<input type="text"  class="form-control" placeholder="请输入A选项" name="newMCQ.selectionA" required="required"/>
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="newMCQ.answer" id="op2" value="B">B.<input type="text"  class="form-control" placeholder="请输入B选项" name="newMCQ.selectionB" required="required"/>
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="newMCQ.answer" id="op3" value="C">C.<input type="text"   class="form-control" placeholder="请输入C选项" name="newMCQ.selectionC" required="required"/>
                                </label> 
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="newMCQ.answer" id="op4" value="D">D.<input type="text"   class="form-control" placeholder="请输入D选项" name="newMCQ.selectionD" required="required"/>
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">   
                            <button type="reset" class="btn btn-default">重置</button>
                            <button type="sumbit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="addCODEQModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span id="CODEQtitle"></span>
                        </h4>
                    </div>
                    <form role="form" action="paper_add" method="post" id="MCQfrom">
                        <div class="modal-body">
                            <input type="hidden" name="newCODEQ.examId" id="codeqId" value=""/> 
                            <div class="form-group">
                                <label >题目:</label>
                                <textarea  class="form-control"   name="newCODEQ.question" cols="60" rows="5" placeholder="请输入简答题题目" required="required"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label >答案</label><br>
                                <textarea  class="form-control"   name="newCODEQ.answer" cols="60" rows="5"  placeholder="请输入简答题答案" required="required"></textarea>
                            </div>                          
                        </div>
                        <div class="modal-footer">   
                            <button type="reset" class="btn btn-default">重置</button>
                            <button type="sumbit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </body>
</html>
