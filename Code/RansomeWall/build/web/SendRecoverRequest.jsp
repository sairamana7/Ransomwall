<%-- 
    Document   : SendRecoverRequest
    Created on : Sep 22, 2018, 3:14:46 PM
    Author     : Ramu Maloth 
--%>

<%@page import="com.rnswall.db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
int ransomFileid = Integer.parseInt(request.getParameter("ransomFileid"));
String ransomeFileName = request.getParameter("ransomeFileName");
String filetype = request.getParameter("filetype");
String username = request.getParameter("username");
String email = request.getParameter("email");
String fileextension = request.getParameter("fileextension");
String recoverystatus = request.getParameter("recoverystatus");
java.sql.Date c_Date = new java.sql.Date(new java.util.Date().getTime());

Connection con = null;
PreparedStatement ps = null;
 try{
    con = DBConnection.getDBConnection();
    String sqlQuery = "insert into ransomeuserrequest(rfileid,filename,filetype,username,email,fileext,recoverystatus,cdate) values(?,?,?,?,?,?,?,?)";
    ps = con.prepareStatement(sqlQuery);
    ps.setInt(1, ransomFileid);
    ps.setString(2, ransomeFileName);
    ps.setString(3, filetype);
    ps.setString(4, username);
    ps.setString(5, email);
    ps.setString(6, fileextension);
    ps.setString(7, recoverystatus);
    ps.setDate(8, c_Date);
    int no = ps.executeUpdate();
    if(no>0){
    response.sendRedirect("CustAttakedFiles.jsp?msg=success");
    }else{
    response.sendRedirect("CustAttakedFiles.jsp?msg=faild");
    }
                 

        } catch (Exception e) {
            e.printStackTrace();
      } finally {
          try {
              //  rs.close();
                ps.close();
                con.close();
             } catch (Exception e) {
         }
     }


      
%>
    </body>
</html>
