
<%@page import="com.rnswall.utility.IRPUtility"%>
<%@page import="com.rnswall.utility.SendingMails"%>
<%@page import="com.rnswall.utility.GetFileDecryptKey"%>
<%@page import="com.rnswall.crypto.CryptoUtils"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.rnswall.utility.GetFileExtension"%>
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
                    <script type="text/javascript">
                        function showMessage(i){
                            alert("File Recovery Status "+i);
                            window.location("http://localhost:8084/RansomeWall/UserRecoveryRequest.jsp");
                           
                            
                        }
                    </script>
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
                                    <a href="" target="_parent" class="hlinks">Bla Bla Files&nbsp; &nbsp;&nbsp;</a> 
                                    <a href="#.jsp" target="_parent" class="hlinks">Menu 2&nbsp; &nbsp;&nbsp;</a> 
                                    <a href="Logout.jsp" target="_parent" class="hlinks">Log out&nbsp; &nbsp;&nbsp;</a> 
                                </div>
                            </div><!-- end #headerlinks -->

                            <h2><font color="#0066FF">Customer Recovery Request</font></h2>

                            <h3>Welcome to IRP Manager</h3>
                            <%!String msg = null;%>
                            <%
                                FileOutputStream fis1 = null;
                                int fileId = Integer.parseInt(request.getParameter("rfileid"));
                                String filename = request.getParameter("filename");
                                String email = request.getParameter("email");
                                 String getFileExtension = GetFileExtension.getFileExtension(filename);
                                String decryptKey = GetFileDecryptKey.getDecryptkey(fileId);
                               if(decryptKey!=null){
                                  boolean fStatus =  IRPUtility.updaterecoverStatus(fileId);
                                  IRPUtility.updateRansometableStatus(fileId);
                                   String sub = "Message from IRP Manager";
                                   String body = "Dear User Your recovery request of file name "+filename+" and the file id is "+fileId+" by using this file key "+decryptKey+" yiu can Recover your file from Honeycomb layer. No need to pay any thing to attackers. thanking you...!!!!!!!!!!!!!";
                                 boolean mStatus =   SendingMails.sendMail(body, sub, email, email);
                                 if(fStatus==true && mStatus == true){
                                 //Done...!
                                     File cipherFile = new File(getServletContext().getRealPath("/cipherfiles/" + filename));
                                File directory  = new File(getServletContext().getRealPath("/irpFiles/" + filename));
                                fis1 = new FileOutputStream(directory.getAbsolutePath());
                                InputStream inputStream = new FileInputStream(cipherFile);
                                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                                int nRead;
                                byte[] data = new byte[(int) inputStream.available()];
                                while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                                    buffer.write(data, 0, nRead);
                                }
                                fis1.write(data);
                                 fis1.close();
                                 CryptoUtils.decrypt(decryptKey, directory, directory); // Original Attacking happens Here
                                try { 
                                   
                                   %>
                            <script>
                                                self.setTimeout('showMessage(<%=fStatus%>)', 1000)
                            </script>
                            <%
                                      
                                        // Thread.sleep(100);
                                    
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                               }else{
                               out.println("Error Strongly Ronsmed");
                               }
                           
                                 }else{
                                 // Not Done.....!
                                 }
                                
 %>

 <h2>File Recoverd and Send to mail status is true</h2>                           
 <span id="msg1"></span>
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
