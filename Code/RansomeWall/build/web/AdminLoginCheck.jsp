<%
String loginname = request.getParameter("loginname");
String pswd = request.getParameter("pswd");
if(loginname.equalsIgnoreCase("Admin")&&pswd.equalsIgnoreCase("Admin")){
response.sendRedirect("AdminHome.jsp");
}else{
response.sendRedirect("Admin.jsp?msg=faild");
}
%>