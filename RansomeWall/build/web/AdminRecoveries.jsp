<%@page import="com.rnswall.db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="description" content="Free WebTemplate">
<meta name="keywords" content="put,key,words,here" />
<link type="text/css" rel="stylesheet" href="styles.css">
    <link rel="icon" href="images/titlelogo.jpg" type="image/png"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript">
<title>RansomWall</title>
</head>

<body class="thrColLiqHdr" bgcolor="#8093C2">
    <div id="container"> 

<div> 
<table id="tableheader">
  <tr>
     <td width="100%"><div align="left"><h2>RansomWall: A Layered Defense System against Cryptographic Ransomware Attacks using Machine Learning</h2></div></td>
    
     <td width=""><div align="right"><img src="images/headerright.jpg"></div></a> </td>
  </tr>
</table>
   <!-- end #header -->
</div> 

<div id="headerlinks"> 
    <div align="CENTER" style="font-size: large;">        
        <a href="AdminHome.jsp"  target="_parent"   class="hlinks">Home &nbsp;&nbsp;</a> 
        <a href="AdminUsers.jsp"target="_parent" class="hlinks">Users &nbsp;&nbsp;</a>  
	<a href="AdminFiles.jsp"  target="_parent" class="hlinks">Files &nbsp;&nbsp;</a>    
	<a href="AdminRecoveries.jsp" style="background-color: #F7F77C" target="_parent" class="hlinks">User Request&nbsp; &nbsp;&nbsp;</a>        
        <a href="AdminAttackedFiles.jsp" target="_parent" class="hlinks">Attacked Files&nbsp; &nbsp;&nbsp;</a>        
        <a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->



<h2><font color="#0066FF">List of Recovery Request Files</font></h2>

<table border="1" width="5" cellspacing="1" cellpadding="1">
    <thead>
        <tr>
            <th>S.No</th>
            <th>File ID</th>
            <th>File Name</th>
            <th>File Type</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>File Extension</th>           
            <th>Recovery Status</th>
            <th>Request Date</th>            
           
        </tr>
    </thead>
    <tbody>
    <%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
int rowCount = 0;
 try{
     con = DBConnection.getDBConnection();
     String sqlQuery = "select  distinct filename,rfileid, filetype,username,email,fileext,recoverystatus,cdate from ransomeuserrequest";
     ps = con.prepareStatement(sqlQuery);            
     
     rs = ps.executeQuery();
     while(rs.next()){
     rowCount++;
     int rfileid = rs.getInt("rfileid");
     String filename = rs.getString("filename");
     String filetype = rs.getString("filetype");
     String username = rs.getString("username");     
     String email = rs.getString("email");
     String fileext = rs.getString("fileext");
     String recoverystatus = rs.getString("recoverystatus");
     
     
     %>
    <tr>
            <td><%=rowCount%></td>
            <td><%=rfileid%></td>
            <td><%=filename%></td>
            <td><%=filetype%></td>
            <td><%=username%></td>
            <td><%=email%></td>  
            <td><%=fileext%></td>
            <td><%=recoverystatus%></td>                       
            <td><%=rs.getDate("cdate")%></td>
       
            
           
        </tr>
    <%
     
     }
    } catch (Exception e) {
            e.printStackTrace();
      } finally {
          try {
                rs.close();
                ps.close();
                con.close();
             } catch (Exception e) {
         }
     }


%>
        
    </tbody>
</table>








<!-- end #maincontent --><br class="clearfloat" />

<div id="footer">
<p><em>Ransomware Attacks using Machine Learning</em> 
&nbsp;&nbsp;<a href="index.jsp" target="_parent" class="hlinks">Home&nbsp;</a> 
<a href="#" target="_parent" class="hlinks">Services&nbsp;</a>
<a href="#" target="_parent" class="hlinks">Contact-Us&nbsp;</a>
<a href="#" target="_parent" class="hlinks">Find-Us&nbsp;</a>
<a href="#" target="_parent" class="h2links">Alex Lolita &nbsp;</a>
</p>
</div><!-- end #footer -->
 
</div><!-- end #container -->
</body>
</html>
