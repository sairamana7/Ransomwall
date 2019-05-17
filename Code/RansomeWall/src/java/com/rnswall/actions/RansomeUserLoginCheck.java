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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ramu Maloth
 */
public class RansomeUserLoginCheck extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       String loginname = request.getParameter("loginname");
        String pswd = request.getParameter("pswd");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        HttpSession hs = null;
        try {
            con = DBConnection.getDBConnection();
            String sqlQuery = "select * from ransomeuser where loginid = ? and pswd = ? ";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, loginname);
            ps.setString(2, pswd);
            rs = ps.executeQuery();
            if(rs.next()){
            hs = request.getSession();
            hs.setAttribute("rnsloginid", loginname);
            hs.setAttribute("rnsname", rs.getString("name"));
            hs.setAttribute("rnsmail", rs.getString("email"));
            response.sendRedirect("RansomHome.jsp?msg=success");
            }else{
            response.sendRedirect("RansomeAttacker.jsp?msg=faild");
            }
            
        }catch(Exception e){
            System.out.println("RansomeAttacker Login Error "+e.getMessage());
            response.sendRedirect("RansomeAttacker.jsp?msg=faild");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
