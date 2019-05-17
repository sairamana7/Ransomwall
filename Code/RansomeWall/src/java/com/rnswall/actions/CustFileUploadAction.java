/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rnswall.actions;

import com.rnswall.crypto.SecureFileIDGenerator;
import com.rnswall.db.DBConnection;
import com.rnswall.utility.GetFileExtension;
import com.rnswall.utility.testSig;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ramu Maloth
 */
@MultipartConfig
public class CustFileUploadAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileType = request.getParameter("filetype");
        Part filePart = request.getPart("fileupload");
        InputStream inputStream = filePart.getInputStream();
       // InputStream is = null;
       // inputStream = is;
        String fileName = getFileName(filePart);
        String getFileExtension = GetFileExtension.getFileExtension(fileName);

        Connection con = null;
        PreparedStatement ps = null;
        String serailFileId = null;
        FileOutputStream fis1 = null;
        String newFileId = null;
        HttpSession hs = request.getSession();
        String custName = hs.getAttribute("custloginid").toString();
        String custEmail = hs.getAttribute("custemail").toString();
        try {
            serailFileId = SecureFileIDGenerator.calculateSecurityHash(fileName, "MD5");
            newFileId = serailFileId + "" + getFileExtension;
            File directory = new File(getServletContext().getRealPath("/cipherfiles"));   //This is the folder of your application
            //FileInputStream iss = new FileInputStream(inputStream.available());
            fis1 = new FileOutputStream(directory.getAbsolutePath() + "\\" + newFileId);
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int nRead;
            byte[] data = new byte[(int) inputStream.available()];
            while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }
            fis1.write(data);
            String fPath = directory.getAbsolutePath() + "\\" + newFileId;
            System.out.println("FPath is " + fPath);
            boolean staticAnalysis = testSig.verifySign(fPath);
           // System.out.println("Boolean Val = " + staticAnalysis);
            java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
            con = DBConnection.getDBConnection();
            String sqlQuery = "insert into custhoneyfiles(custname,custemail,filetypes,filename,fileextension,filestore,filenewname,singverify,iomnagerstayus,attackingstatus,cdate) values(?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, custName);
            ps.setString(2, custEmail);
            ps.setString(3, fileType);
            ps.setString(4, fileName);
            ps.setString(5, getFileExtension);
            ps.setBinaryStream(6, filePart.getInputStream());
            ps.setString(7, newFileId);
            ps.setString(8, "" + staticAnalysis);
            ps.setString(9, "waiting");
            ps.setString(10, "noattack");
            ps.setDate(11, sqlDate);
            int no = ps.executeUpdate();
            if (no > 0) {
                response.sendRedirect("CustSecureFileUpload.jsp?msg=success");
            } else {
                response.sendRedirect("CustSecureFileUpload.jsp?msg=faild");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //inputStream.close();
            fis1.close();
        }


        /*    
         File file = new File("D:\\Delete\\document.txt");
         byte[] fileData = new byte[(int) file.length()];
         FileInputStream in = new FileInputStream(file);
         in.read(fileData);
         in.close();
         String content = "";
         for (byte b : fileData) {
         content += getBits(b);
         }
         */

        //  File directory = new File(getServletContext().getRealPath("/cipherfiles"));   //This is the folder of your application
//directory = directory.getParentFile();   // webapps folder of server
//directory = directory.getParentFile(); 
        //  FileOutputStream fis1 = new FileOutputStream(directory.getAbsolutePath() + "\\ramra2.txt");
        //  fis1.write(content.getBytes());
        //  fis1.close();

    }

    public static String getBits(byte b) {
        String result = "";
        for (int i = 0; i < 8; i++) {
            result += (b & (1 << i)) == 0 ? "0" : "1";
        }
        return result;
    }

    private String getFileName(Part filePart) {
        for (String cd : filePart.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }
}
