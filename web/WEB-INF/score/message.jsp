<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="<%=request.getContextPath()%>/">
    </head>
    <body>
        <script type = "text/javascript">
            window.onload = function ()
            {
                alert("${result}");
               window.location.href="score_classList?cid=${cid}";
            }
        </script>
    </head>
<body>
</body>
</html>
