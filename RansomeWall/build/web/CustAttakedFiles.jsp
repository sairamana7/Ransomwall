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
        <a href="UserHome.jsp"  target="_parent"  class="hlinks">User Home &nbsp;&nbsp;</a> 
        <a href="CustSecureFileUpload.jsp" target="_parent" class="hlinks">Secure File &nbsp;&nbsp;</a>  
	<a href="CustViewFiles.jsp" target="_parent" class="hlinks">View Files &nbsp;&nbsp;</a>    
	<a href="CustAttakedFiles.jsp"   style="background-color: #F7F77C" target="_parent" class="hlinks">Attacked Files &nbsp; &nbsp;&nbsp;</a> 
        <a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->



<h2><font color="#0066FF">Data User View Attacked Files</font></h2>
<% String cstName = session.getAttribute("custname").toString();
   String email = session.getAttribute("custemail").toString();%>
<h3>Welcome to <%=cstName%></h3>
<table border="1" width="5" cellspacing="1" cellpadding="1">
    <thead>
        <tr>
            <th>S.No</th>
            <th>File Name</th>
            <th>File Type</th>
            <th>User Name</th>
            <th>Email</th>
            <th>File Extension</th>           
            <th>Payment URL</th>
            <th>Payment Status</th>
            <th>Recovery Status</th>
            <th>Attack Date</th>
            <th>Actions</th>
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
     String sqlQuery = "select * from ransomeattacking where email = ?";
     ps = con.prepareStatement(sqlQuery);            
     ps.setString(1,email);
     rs = ps.executeQuery();
     while(rs.next()){
     rowCount++;
     int ransomFileid = rs.getInt("rowid");
     String ransomeFileName = rs.getString("ransomeFileName");
     String filetype = rs.getString("filetype");
     String username = rs.getString("username");
     //String email = rs.getString("email");
     String fileextension = rs.getString("fileextension");
     String paymneturl = rs.getString("paymneturl");
     String paymentstatus = rs.getString("paymentstatus");
     String recoverystatus = rs.getString("recoverystatus");
     
     %>
    <tr>
            <td><%=rowCount%></td>
            <td><%=ransomeFileName%></td>
            <td><%=filetype%></td>
            <td><%=username%></td>
            <td><%=email%></td>
            <td><%=fileextension%></td>  
            <td><a href="<%=paymneturl%>">Click</a></td>
            <td><%=paymentstatus%></td>
            <td><%=recoverystatus%></td>            
            <td><%=rs.getDate("cdate")%></td>
            <td>
                <%if(recoverystatus.equalsIgnoreCase("NO")){
                                   %><a href="Downolad?filename=<%=ransomeFileName%>">Download</a> /<a href="SendRecoverRequest.jsp?ransomFileid=<%=ransomFileid%>&ransomeFileName=<%=ransomeFileName%>&filetype=<%=filetype%>&username=<%=username%>&email=<%=email%>&fileextension=<%=fileextension%>&recoverystatus=<%=recoverystatus%>">Send Recover Request</a> <%
}else{
%><a href="CustmoreRecovering.jsp?ransomFileid=<%=ransomFileid%>&ransomeFileName=<%=ransomeFileName%>&filetype=<%=filetype%>">Recover</a>/<a href="Downolad?filename=<%=ransomeFileName%>">Download</a>  <%
} %>
            </td>
           
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
