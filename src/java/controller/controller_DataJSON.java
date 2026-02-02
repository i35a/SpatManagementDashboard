/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.TypeRoleUtilisateur;
import model.Utilisateur;
import model.V_PercentBudget_actuel;
import model.V_rubrique_fin;
import model.V_rubrique_global;
import service.ServiceRoleUtilisateur;
import service.ServiceUtilisateur;
import service.Service_rubrique;
import utils.DBConnection;
import utils.Utils;

/**
 *
 * @author PC
 */
@WebServlet("/homepage")
public class controller_DataJSON extends HttpServlet {

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
        //login feature 
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
        try {
            if (loginSaisie != null && pwdSaisie != null && !loginSaisie.trim().isEmpty() && !pwdSaisie.trim().isEmpty()) {

                foundUser = ServiceUtilisateur.getUserByLogin(Integer.valueOf(loginSaisie), connection);
                //init user found 
                if (Utils.checkPasswordBcrypt(pwdSaisie, foundUser.getPwd())) {
                    userConnected = true;

                }
            }
        } catch (NumberFormatException e) {
            session.invalidate();
            session = request.getSession();
            String msgerror = "Echec de connexion! Le login n'est pas correcte"; 
            request.getRequestDispatcher("auth.jsp?msg=" + msgerror).forward(request, response);
        }

        if (connection == null) {
            //request.setAttribute("msg", "Echec de connexion! Verifier vos informations de connection!");
            session.invalidate();
            session = request.getSession();
            String msgerror = "Echec de connexion! Vérifiez vos informations de connection!";
            System.out.println("Cant connect to db");
            request.getRequestDispatcher("auth.jsp?msg=" + msgerror).forward(request, response);
        } else if (connection != null && userConnected) {
            // 1. Récupération de la liste depuis le service
            List<V_rubrique_global> rub_chart_rh = Service_rubrique.getRubriqueGlobal_RH(); // .getRubriqueGlobal_RH();
            List<V_rubrique_global> rub_chart_fin = Service_rubrique.getRubriqueGlobal_FIN(); // .getRubriqueGlobal_FIN();
            List<V_rubrique_global> rub_chart_op = Service_rubrique.getRubriqueGlobal_OP(); // .getRubriqueGlobal_OP();
            List<V_PercentBudget_actuel> rub_percent = Service_rubrique.getPercentBudget_actuel();
            // 2. Création de l'objet Gson (compatible 2.2.2)
            Gson gson = new GsonBuilder().create();

            // 3. Conversion Liste -> JSON
            String json_data_rh = gson.toJson(rub_chart_rh);
            String json_data_fin = gson.toJson(rub_chart_fin);
            String json_data_op = gson.toJson(rub_chart_op);
            String json_data_percent = gson.toJson(rub_percent);
            // 4. Configuration de la réponse HTTP
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // 5. Envoi du JSON au client
            PrintWriter out = response.getWriter();

            request.setAttribute("data_chart_rh", json_data_rh);
            request.setAttribute("data_chart_fin", json_data_fin);
            request.setAttribute("data_chart_op", json_data_op);
            request.setAttribute("data_percent", json_data_percent);
            //creating sessions 
            TypeRoleUtilisateur tru = ServiceRoleUtilisateur.getTypeById(foundUser.getIdRole(), connection);
            session.setAttribute("loggedIn", foundUser.getId());
            session.setAttribute("userType", tru.getDescription());
            session.setAttribute("userTypeId", tru.getId());
            System.out.println("^^^^user type found: " + tru.getDescription() + "^^^^^^^^");
            session.setAttribute("login", foundUser.getLogin());
            //6. page chart où vont atterir les données
            request.getRequestDispatcher("/homepage.jsp").forward(request, response);
        } else {
            session.invalidate();
            session = request.getSession();
            String msgerror = "Echec de connexion! Vérifiez vos informations de connection!";
            System.out.println("Cant connect to db");
            request.getRequestDispatcher("auth.jsp?msg=" + msgerror).forward(request, response);
        }
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
            Logger.getLogger(controller_DataJSON.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controller_DataJSON.class.getName()).log(Level.SEVERE, null, ex);
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
