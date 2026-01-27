/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.GenericDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import model.Article;
//import model.Typearticle;
//import service.ServiceArticle;
//import service.ServiceEntree;
//import service.ServiceTypeArticle;
//import controller.setConnectionDB;
import javax.servlet.http.HttpSession;
import model.Utilisateur;
import service.ServiceUtilisateur;
import utils.DBConnection;
/**
 *
 * @author PC
 */
public class ModifierUtilisateur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        String loginSaisie = "";
        String pwdSaisie = "";
        String DirectionSaisie = "";
        HttpSession session = request.getSession(false);
        if (session.getAttribute("login") != null) {
            loginSaisie = (String) session.getAttribute("login");
            pwdSaisie = (String) session.getAttribute("password");
            DirectionSaisie = (String) session.getAttribute("direction"); 
        }
//        setConnectionDB sc = new setConnectionDB();
        Connection connection = DBConnection.getConnection();//sc.connect2(request);
        //request.setAttribute("listeTypearticle", ServiceTypeArticle.getAllType(connection));
        // 
        // liste
        //Article arti = new Article();
        int count = 0;
        
        //utilisateur
        Utilisateur userUpdate = new Utilisateur();
        
        //id user 
        if (request.getParameter("idart") != null) { 
            userUpdate.setId(Integer.valueOf(request.getParameter("idart"))); 
        }
        //matricule and pwd 
        if (request.getParameter("userMatricule") != null && !request.getParameter("userMatricule").trim().isEmpty()) {
            //update here
        }
        if (request.getParameter("userRoleType") != null && !request.getParameter("userRoleType").trim().isEmpty()) {
            //change user role
            userUpdate.setIdRole(Integer.valueOf(request.getParameter("userRoleType")));
        }
        if (request.getParameter("userPassword") != null && !request.getParameter("userPassword").trim().isEmpty()) {
            System.out.println("updating pwd:"+request.getParameter("userPassword"));
            //change user password
            userUpdate.setPwd(request.getParameter("userPassword"));
        } else{
            System.out.println("\ncant updat pwd");
        }

        int r = 0;
        //ArrayList<Article> lst = new ArrayList<Article>();
        //lst.add(arti);
//        if (count >= 5) {
//           r =  ServiceArticle.updateArticle(arti, connection);
//        }
//        ServiceUtilisateur.getAllItems(userUpdate, connection);
        ServiceUtilisateur.updateArticle(userUpdate, connection);
        //        request.getRequestDispatcher("ControllerListMat").forward(request, response);
        connection.close();
        response.sendRedirect("users");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ModifierUtilisateur.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ModifierUtilisateur.class.getName()).log(Level.SEVERE, null, ex);
        }
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
