/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rnswall.actions;

import com.rnswall.crypto.CryptoUtils;
import com.rnswall.utility.CustomerUtilities;
import com.rnswall.utility.GetFileDecryptKey;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ramu Maloth
 */
public class DataUserFileRecovering extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       int ransomFileid = Integer.parseInt(request.getParameter("ransomFileid"));
       String ransomeFileName = request.getParameter("ransomeFileName");
       String filetype = request.getParameter("filetype");
       String recoverkey = request.getParameter("recoverkey").trim();
       boolean flag = CustomerUtilities.checkDecryptionSecretKey(ransomFileid, ransomeFileName, recoverkey);
        System.out.println("Flag Value "+recoverkey.length());
       if(flag == true){
           String decryptKey = GetFileDecryptKey.getDecryptkey(ransomFileid);
        File cipherFile = new File(getServletContext().getRealPath("/cipherfiles/" + ransomeFileName));
           System.out.println("File path "+cipherFile.getAbsolutePath());
           try {
              // CustomerUtilities.updateNoAttackStatus(ransomFileid);
                CryptoUtils.decrypt(decryptKey, cipherFile, cipherFile);
                response.sendRedirect("CustAttakedFiles.jsp?msg=recovered");
           } catch (Exception e) {
               e.printStackTrace();
           }
       }else{
       response.sendRedirect("CustmoreRecovering.jsp?ransomFileid="+ransomFileid+"&ransomeFileName="+ransomeFileName+"&filetype="+filetype+"&recoverkey="+recoverkey+"&msg=faild");
       }
       
       
       
    }

}
