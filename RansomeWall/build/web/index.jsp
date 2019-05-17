﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        <a href="index.jsp"  target="_parent" style="background-color: #F7F77C" class="hlinks">Home &nbsp;&nbsp;</a> 
        <a href="User.jsp" target="_parent" class="hlinks">User &nbsp;&nbsp;</a>  
	<a href="RansomeAttacker.jsp" target="_parent" class="hlinks">Ransom User &nbsp;&nbsp;</a>    
	<a href="IRPManager.jsp" target="_parent" class="hlinks">IRP Manager&nbsp; &nbsp;&nbsp;</a> 
        <a href="Admin.jsp" target="_parent" class="hlinks">Admin&nbsp; &nbsp;&nbsp;</a> 
    </div>
</div><!-- end #headerlinks -->

<div id="sidebar1">
<br /> 
<table id="table2"><tr><td><br />
<p><p><a href="#" target="_parent" class="hlinks">Static Analysis Engine</a><br />
<a href="#" target="_parent" class="hlinks">Honey Files & Trap Layer</a><br />
<a href="#" target="_parent" class="hlinks">Dynamic Analysis Engine</a><br />
<a href="#" target="_parent" class="hlinks">File Backup Layer</a><br />
<a href="#" target="_parent" class="hlinks">Machine Learning Engine</a><br />

<br /> 
</td></tr></table><br />
 
<table id="table2"><tr><td>
<p><a class="hlinks" href="#" target="_parent">RansomWall File System Filter Driver</a><br ></p>
</td></tr></table><br />

<table id="table2"><tr><td>
<p>
    
<a href="#" target="_parent" class="hlinks">Machine Learning Layer Implementation</a><br />
</td></tr></table><br />

<table id="table2"><tr><td>Feature Vector Plots (Ransomware and Benign Samples)
<p><br>
</td></tr></table><br />

<table id="table2"><tr><td>RansomWall File System Filter Driver
<p><br>
</td></tr></table>

</div><!-- end #sidebar1 -->


<div id="mainContent">
 
<div id="leftMain">
<h2><font color="#0066FF">Honey Files & Trap Layer</font></h2>
The behavioral patterns characteristic of Cryptographic Ransomware involve performing malicious activities to break defenses of the victim’s system and encrypting user data files. This layer sets trap by tracking occurrence of these malicious activities. Cryptographic Ransomware perform encryption of user data files with specific extensions. Honey Files (with user data file extensions mostly attacked by Ransomware) and Honey Directories are deployed in critical user data folders. These are trap files/directories which are not expected to be modified by the user during normal operation. Modification of these files/directories by a process provides an indication of suspicious behavior.  
</div>

<div id="rightMain">
<table id="table"><tr><td>
<center>
    <img  src="images/argitech.jpg">
</center> 
</td></tr></table><br />
</div>

<h3><font color="#0066FF">File Backup Layer</font></h3>
The computation and analysis of features collected during the sample’s execution and classification decision by Machine Learning layer takes some time, while Ransomware is already encrypting user data files. Therefore, there is a need to tag a process as suspicious based on initial features of Static, Dynamic and Trap layers. Files modified by the suspicious process are backed up in a separate folder to preserve user data until the process is classified as Ransomware or Benign by Machine Learning layer. RansomWall maintains list of files that are backed up along with their original locations and Process ID of the suspicious process. If Machine Learning layer classifies as Ransomware, then the process is killed and files modified by it are restored to their original locations. If it is classified as Benign then these files are deleted from the backup folder.  
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
