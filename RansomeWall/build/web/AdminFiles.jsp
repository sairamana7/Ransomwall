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
	<a href="AdminFiles.jsp"  style="background-color: #F7F77C" target="_parent" class="hlinks">Files &nbsp;&nbsp;</a>    
	<a href="AdminRecoveries.jsp" target="_parent" class="hlinks">User Request&nbsp; &nbsp;&nbsp;</a>        
        <a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->



<h2><font color="#0066FF">List of Uploaded Files for Honeycomb Servers</font></h2>

<table border="2" width="7" cellspacing="6" cellpadding="4">
    <thead>
        <tr>
            <th>S.No</th>
            <th>File Type</th>
            <th>File Name</th>
            <th>Extension</th>
            <th>Honey Name</th>
            <th>Sign Verification</th>
            <th>IRP Status</th>
            <th>Date</th>
            
        </tr>
    </thead>
    <tbody>
    <%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
//String custEmail = session.getAttribute("custemail").toString();
int rowCount = 0;
 try{
     con = DBConnection.getDBConnection();
     String sqlQuery = "select filetypes,filename,fileextension,filenewname,singverify,iomnagerstayus,cdate  from custhoneyfiles";
     ps = con.prepareStatement(sqlQuery);    
     rs = ps.executeQuery();
     while(rs.next()){
     rowCount++;
     String filetypes = rs.getString("filetypes");
     String filename = rs.getString("filename");
     String fileextension = rs.getString("fileextension");
     String filenewname = rs.getString("filenewname");
     String singverify = rs.getString("singverify");
     String iomnagerstayus = rs.getString("iomnagerstayus");
     
     %>
    <tr>
            <td><%=rowCount%></td>
            <td><%=filetypes%></td>
            <td><%=filename%></td>
            <td><%=fileextension%></td>
            <td><%=filenewname%></td>
            <td><%=singverify%></td>
            <td><%=iomnagerstayus%></td>
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
