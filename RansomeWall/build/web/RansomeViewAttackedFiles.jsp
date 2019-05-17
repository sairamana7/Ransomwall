<%@page import="com.rnswall.db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>

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
        <a href="RansomHome.jsp"  target="_parent" class="hlinks">Ransome Home &nbsp;&nbsp;</a> 
        <a href="RansomeUserFileViews.jsp"   target="_parent" class="hlinks">View Files &nbsp;&nbsp;</a>  
	<a href="RansomeViewAttackedFiles.jsp" target="_parent" style="background-color: #F7F77C"  class="hlinks">View Attacked Files &nbsp;&nbsp;</a>    
	<a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->




<h2><font color="#0066FF">Ransome Wall View Attacked Files</font></h2>
<% String rnsName = session.getAttribute("rnsname").toString(); %>
<h3>Welcome to <%=rnsName%></h3>


<table border="2" width="7" cellspacing="6" cellpadding="4">
    <thead>
        <tr>
            <th>S.No</th>
            <th>File Name</th>
            <th>File Type</th>
            <th>User Name</th>
            <th>Email</th>
            <th>File Extension</th>           
            
            <th>Payment Status</th>
            <th>Recovery Status</th>
            <th>Date</th>
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
     String sqlQuery = "select * from ransomeattacking where attackername = ?";
     ps = con.prepareStatement(sqlQuery);            
     ps.setString(1,rnsName);
     rs = ps.executeQuery();
     while(rs.next()){
     rowCount++;
     
     String ransomeFileName = rs.getString("ransomeFileName");
     String filetype = rs.getString("filetype");
     String username = rs.getString("username");
     String email = rs.getString("email");
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
            <td><%=paymentstatus%></td>
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


<h3><font color="#0066FF">File Backup Layer</font></h3>
The computation and analysis of features collected during the sample?s execution and classification decision by Machine Learning layer takes some time, while Ransomware is already encrypting user data files. Therefore, there is a need to tag a process as suspicious based on initial features of Static, Dynamic and Trap layers. Files modified by the suspicious process are backed up in a separate folder to preserve user data until the process is classified as Ransomware or Benign by Machine Learning layer. RansomWall maintains list of files that are backed up along with their original locations and Process ID of the suspicious process. If Machine Learning layer classifies as Ransomware, then the process is killed and files modified by it are restored to their original locations. If it is classified as Benign then these files are deleted from the backup folder.  
<br /><br />

<br />
<h2><font color="#0066FF">Machine Learning Engine</font></h2>
This layer builds a generalized model which is effective against zero-day Ransomware attacks. It takes feature values collected by Static, Dynamic and Trap layers as input and classifies the executable as Ransomware or Benign. The Machine Learning Engine is trained offline using Supervised algorithms. Training data consists of feature values with Ransomware and Benign labels. Trained Machine Learning Engine use the learned model to classify executables in real-time based on input feature values. Performance of following Supervised Machine Learning algorithms is evaluated: Logistic Regression, Support Vector Machines (Gaussian-Kernel), Artificial Neural Networks, Random Forests and Gradient Tree Boosting. 

</div><!-- end #maincontent --><br class="clearfloat" />

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
