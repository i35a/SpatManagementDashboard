/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.GenericDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import service.ServiceArticle;
//import service.ServiceStock;
//import controller.setConnectionDB;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Utilisateur;
//import service.ServiceTypeArticle;
import model.TypeRoleUtilisateur;
import model.V_rubrique_fin;
import service.ServiceRoleUtilisateur;
import utils.DBConnection;
import service.ServiceUtilisateur;
import service.Service_rubrique;
import utils.Utils;

/**
 *
 * @author PC
 */
public class UserLoginServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
 
        Utilisateur foundUser = new Utilisateur();

        Connection connection = DBConnection.getConnection();//sc.establish(loginSaisie, pwdSaisie,DirectionSaisie, foundUser); //sc.establish(loginSaisie, pwdSaisie, "", foundUser);
        boolean userConnected = false;
 
      
        if (session.getAttribute("loggedIn") != null && session.getAttribute("login") != "root") {
            loginSaisie = session.getAttribute("login").toString();
            userConnected = true;
            foundUser = ServiceUtilisateur.getUserByLogin(Integer.valueOf(loginSaisie), connection);
 
        } else if (request.getParameter("login") != null) {
            loginSaisie = request.getParameter("login").toString();
            pwdSaisie = request.getParameter("password").toString();
            DirectionSaisie = request.getParameter("direction").toString();
        }
        if (loginSaisie != null && pwdSaisie != null && !loginSaisie.trim().isEmpty() && !pwdSaisie.trim().isEmpty()) {
            System.out.println("__login saisie" + Integer.valueOf(loginSaisie));

            foundUser = ServiceUtilisateur.getUserByLogin(Integer.valueOf(loginSaisie), connection);
            //init user found 
            if (Utils.checkPasswordBcrypt(pwdSaisie, foundUser.getPwd())) {
                userConnected = true;
                System.out.println("Hash matched!!!");
            }
        } else {
            System.out.println("empty login saisie et pwd saisie");
        }

 
        if (userConnected) {
            System.out.println("***User found: " + foundUser.getFullname());
        } else {
            System.out.println("*no user found");
        }
        if (connection == null) {
            //request.setAttribute("msg", "Echec de connexion! Verifier vos informations de connection!");
            session.invalidate();
            session = request.getSession();
            String msgerror = "Echec de connexion! Vérifiez vos informations de connection!";
            System.out.println("Cant connect to db");
            request.getRequestDispatcher("auth.jsp?msg=" + msgerror).forward(request, response);
        } else if (connection != null && userConnected) {
            System.out.println("Connected:");
            System.out.println("***User found: " + foundUser.getFullname());

            TypeRoleUtilisateur tru = ServiceRoleUtilisateur.getTypeById(foundUser.getIdRole(), connection);
            session.setAttribute("loggedIn", foundUser.getId());
            session.setAttribute("userType", "admin");
            session.setAttribute("userTypeId", tru.getId());
            session.setAttribute("login", foundUser.getLogin());

            //get finance data 
            List<V_rubrique_fin> rubriques = Service_rubrique.getRubriqueFIN(); // .getAllRubriques();
 
            Gson gson = new GsonBuilder().create(); 
            String json = gson.toJson(rubriques);
            request.setAttribute("fin_data",json);
            
            
            connection.close();

            request.getRequestDispatcher("dashboard-user.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("auth.jsp").forward(request,response);
        }
    }

    protected HashMap<String, String> getListMonth() {
        HashMap<String, String> mois = new HashMap<String, String>();

        mois.put("1", "Janvier");
        mois.put("2", "Fevrier");
        mois.put("3", "Mars");
        mois.put("4", "Avril");
        mois.put("5", "Mai");
        mois.put("6", "Juin");
        mois.put("7", "Juilllet");
        mois.put("8", "Août");
        mois.put("9", "Septembre");
        mois.put("10", "Octobre");
        mois.put("11", "Novembre");
        mois.put("12", "Décembre");

        return mois;
    }

    protected HashMap<String, String> getListYear() {
        HashMap<String, String> annee = new HashMap<String, String>();

        annee.put("2023", "2023");
        annee.put("2024", "2024");
        annee.put("2025", "2025");
        annee.put("2026", "2026");
        annee.put("2027", "2027");
        annee.put("2028", "2028");
        annee.put("2029", "2029");
        annee.put("2030", "2030");
        annee.put("2031", "2031");
        annee.put("2032", "2032");
        annee.put("2033", "2033");
        annee.put("2034", "2034");

        return annee;
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
            Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            System.out.println("\n***Exception error: " + ex.getMessage());
            Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
