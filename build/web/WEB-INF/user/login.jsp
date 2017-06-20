<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=request.getContextPath()%>/"/>
        <title>登录在线考试系统</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <script src="js/list.js"></script>   
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
        <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/model.css"/>
        <style type="text/css">
            #error{
                width: 430px;
                margin-bottom: -20px; 
                list-style-type:none;
            }
            .button1{
                margin-left: 25px;
                margin-right: 20px;
                width: 100px;
            }
            .op{
                padding-left: 90px;
            }
        </style>

    </head>
    <body class="templatemo-bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="margin-bottom-15">登录在线考试系统</h1>             
                    <form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="user/checkLogin" method="post" onsubmit="return check()" name="form">				
                        <div class="form-group">
                            <div class="col-xs-12">		            
                                <div class="control-wrapper">
                                    <label for="username" class="control-label fa-label glyphicon glyphicon-user"></label>
                                    <input type="text" class="form-control" name="user.username"id="username" placeholder="用户名或学号" required="required" >
                                </div>		            	            
                            </div>              
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="control-wrapper">
                                    <label for="password" class="control-label fa-label glyphicon glyphicon-lock"></label>
                                    <input type="password" class="form-control" name="user.password" id="password" placeholder="密码" required="required">                           
                                </div>
                            </div>
                        </div>
                        <div class="form-group op">
                            <div class="col-xs-12">
                                <label class="checkbox-inline">
                                    <input type="radio" name="user.type"  value="0">学生
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="user.type"  value="1">教师
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" name="user.type" id="type" value="2">管理员
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="control-wrapper"  style="padding-left:60px;">
                                    <input type="submit"value="登录" class="btn btn-info button1"> 
                                    <input type="reset" value="重置" class="btn btn-info button1"> 
                                </div>
                            </div>
                        </div>                            
                        <hr>	
                        <div class="text-center">
                            <div class="alert alert-danger alert-dismissable errorAndmes" id="error"><s:actionerror/></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" >
        var errorBox = document.getElementById("error");
        if (errorBox.innerHTML === "" || errorBox.innerHTML === null) {
            errorBox.style.display = "none";
        }
    </script>
</html>