/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rnswall.actions;

import com.rnswall.db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ramu Maloth
 */
public class RansomeuserRegisterAction extends HttpServlet {

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String loginid = request.getParameter("loginid");
        String pswd = request.getParameter("pswd");
        String custname = request.getParameter("custname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
        con = DBConnection.getDBConnection();
        String sqlQuery = "insert into ransomeuser(loginid,pswd,name,email,mobile,address) values(?,?,?,?,?,?)";
        ps = con.prepareStatement(sqlQuery);
        ps.setString(1, loginid);
        ps.setString(2, pswd);
        ps.setString(3, custname);
        ps.setString(4, email);
        ps.setString(5,mobile);
        ps.setString(6, address);
        int no = ps.executeUpdate();
        if(no > 0){
        response.sendRedirect("RansomeuserRegister.jsp?msg=success");
        }else{
        response.sendRedirect("RansomeuserRegister.jsp?msg=faild");
        }
        }catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("RansomeuserRegister.jsp?msg=faild");
        } finally {            
            
            try {
                ps.close();
                con.close();
            } catch (Exception e) {
            }
    }

    
}
}
