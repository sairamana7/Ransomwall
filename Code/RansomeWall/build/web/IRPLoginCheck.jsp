<%-- 
    Document   : IRPLoginCheck
    Created on : Sep 26, 2018, 2:47:25 PM
    Author     : Ramu Maloth 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String loginname = request.getParameter("loginname");
    String pswd = request.getParameter("pswd");
    
    if(loginname.equalsIgnoreCase("irp")&& pswd.equalsIgnoreCase("irp")){
    response.sendRedirect("IRPHome.jsp?msg=success");
    }else{
    response.sendRedirect("IRPManager.jsp?msg=faild");
    }
%>
    </body>
</html>
