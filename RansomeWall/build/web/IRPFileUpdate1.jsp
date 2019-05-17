<%@page import="com.rnswall.db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
int fid = Integer.parseInt(request.getParameter("fid"));

Connection con = null;
PreparedStatement ps = null;

 try{
     String sqlQuery = "update custhoneyfiles set iomnagerstayus = ? where id = ?";
     con = DBConnection.getDBConnection();
     ps = con.prepareStatement(sqlQuery);
     ps.setString(1, "accepted"); 
     ps.setInt(2, fid);
     int no = ps.executeUpdate();
     if(no>0){
      response.sendRedirect("IRPFileUpdate.jsp?msg=succeess");
     }else{
      response.sendRedirect("IRPFileUpdate.jsp?msg=Faild");
     }                              
    } catch (Exception e) {
            e.printStackTrace();
      } finally {
          try {
               
                ps.close();
                con.close();
             } catch (Exception e) {
         }
     }


%>