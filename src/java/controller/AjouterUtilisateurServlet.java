/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Utilisateur;
import service.ServiceRoleUtilisateur;
import service.ServiceUtilisateur;
import utils.Utils;
import utils.DBConnection;

/**
 *
 * @author ThunderRobot
 */
@WebServlet(name = "AjouterUtilisateurServlet", urlPatterns = {"/AjouterUtilisateur"})
public class AjouterUtilisateurServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        String loginSaisie = "";
        String pwdSaisie = "";
        String DirectionSaisie = "";
        HttpSession session = request.getSession(false);

        if (session.getAttribute("login") != null) {
            loginSaisie = (String) session.getAttribute("login");
            pwdSaisie = (String) session.getAttribute("password");
            DirectionSaisie = (String) session.getAttribute("direction");
        }
        //setConnectionDB sc = new setConnectionDB();
        Connection connection = DBConnection.getConnection();//sc.connect2(request);

        //request.setAttribute("listeTypearticle", ServiceTypeArticle.getAllType(connection));
        //request.setAttribute("listeUtilisateur", ServiceUtilisateur.getAllUsers(connection));
        request.setAttribute("listeTypeRole", ServiceRoleUtilisateur.getAllType(connection));
        //Article arti = new Article();
        int count = 0;
        Utilisateur user = new Utilisateur();
        //login and password 
        if(request.getParameter("userRole")!=null){
            user.setIdRole(Integer.parseInt(request.getParameter("userRole")));
        }
        if(request.getParameter("loginUser") != null){ 
            user.setLogin(Integer.parseInt(request.getParameter("loginUser")));
            count++;
        } 
        if(request.getParameter("passwordUser") != null){ 
            user.setPwd(request.getParameter("passwordUser"));
            count++;
        }
        // if (request.getParameter("designation") != null) {
        //     String designation = request.getParameter("designation");
        //     arti.setDesignation(designation);
        //     count++;
        // }
        // if (request.getParameter("typeart") != null) {
        //     int idtypeart = Integer.parseInt(request.getParameter("typeart"));
        //     arti.setIdtypeart(idtypeart);
        //     count++;
        // }
        // if (request.getParameter("etat") != null) {
        //     String etat = request.getParameter("etat");
        //     arti.setEtat(etat);
        //     count++;
        // }
        // if (request.getParameter("qtealert") != null) {
        //     int qtealert = Integer.parseInt(request.getParameter("qtealert"));
        //     arti.setQtealert(qtealert);
        //     count++;
        // }
        // if (request.getParameter("seuilalert") != null) {
        //     String seuilalert = request.getParameter("seuilalert");
        //     arti.setSeuilalert(seuilalert.charAt(0));
        //     count++;
        // }
        // if (request.getParameter("reference") != null) {
        //     String reference = request.getParameter("reference");
        //     arti.setReference(reference);
        //     count++;
        // }
        // if (request.getParameter("fabricant") != null) {
        //     String fabricant = request.getParameter("fabricant");
        //     arti.setFabricant(fabricant);
        //     count++;
        // }
        // if (request.getParameter("fabricant") != null) {
        //     String fabricant = request.getParameter("fabricant");
        //     arti.setFabricant(fabricant);
        //     count++;
        // }
        // if (request.getParameter("commentMessage") != null) {
        //     System.out.println("\n***************************\n comment variable found\n***************************\n");
        //     System.out.println("comment: " + request.getParameter("commentMessage"));
        //     String comment = request.getParameter("commentMessage");
        //     arti.setComment(comment);
        //     count++;
        // } else {
        //     System.out.println("\n***************************\nno comment variable found\n***************************\n");

        // }

        //ArrayList<Article> listart = new ArrayList<Article>();
        //listart.add(arti);
        ArrayList<Utilisateur> listUser = new ArrayList<Utilisateur>();
        
        listUser.add(user);
        System.out.println("adding user "+ user.getLogin());
        System.out.println("user login: "+ user.getPwd());
        System.out.println("user pwd: "+ Utils.hashPasswordBcrypt(user.getPwd()));
        
        ServiceUtilisateur.addUser(listUser, connection);
        System.out.println("User added");
        //String res = ServiceArticle.addArticle(listart, connection);
        //request.getRequestDispatcher("users.jsp").forward(request, response);

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
        } catch (SQLException ex) {
            Logger.getLogger(AjouterUtilisateurServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(AjouterUtilisateurServlet.class.getName()).log(Level.SEVERE, null, ex);
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
