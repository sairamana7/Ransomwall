<%@page import="com.rnswall.db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <a href="IRPHome.jsp"  target="_parent"  class="hlinks">Home &nbsp;&nbsp;</a> 
        <a href="IRPFileUpdate.jsp" target="_parent" class="hlinks">Cust Files &nbsp;&nbsp;</a>  
	<a href="UserRecoveryRequest.jsp"  style="background-color: #F7F77C" target="_parent" class="hlinks">Recovery Request &nbsp;&nbsp;</a>    
	<a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->

<h2><font color="#0066FF">Customer Recovery Request</font></h2>

<h3>Welcome to IRP Manager</h3>


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
            <td>
            <%
              if(recoverystatus.equalsIgnoreCase("NO")){
              %>
              <a href="ProcessRecoverMLApproach.jsp?rfileid=<%=rfileid%>&filename=<%=filename%>&email=<%=email%>">Recover</a>
              <%
              }else{
              out.println("Recovered");
              }
            %>
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
&nbsp;&nbsp;<a href="index.html" target="_parent" class="hlinks">Home&nbsp;</a> 
<a href="#" target="_parent" class="hlinks">Services&nbsp;</a>
<a href="#" target="_parent" class="hlinks">Contact-Us&nbsp;</a>
<a href="#" target="_parent" class="hlinks">Find-Us&nbsp;</a>
<a href="#" target="_parent" class="h2links">Alex Lolita &nbsp;</a>
</p>
</div><!-- end #footer -->
 
</div><!-- end #container -->
</body>
</html>
