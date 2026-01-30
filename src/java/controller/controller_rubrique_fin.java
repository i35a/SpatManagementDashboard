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
import model.Rubrique_saisie;
import model.Utilisateur;
import model.V_rubrique_fin;
import model.V_rubrique_saisie;
import service.Service_rubrique;
import utils.DBConnection;

/**
 *
 * @author PC
 */
@WebServlet("/rubrique_fin")
public class controller_rubrique_fin extends HttpServlet {

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
        HttpSession session = request.getSession();
        Utilisateur foundUser = new Utilisateur();

        Connection connection = DBConnection.getConnection();//sc.establish(loginSaisie, pwdSaisie,DirectionSaisie, foundUser); //sc.establish(loginSaisie, pwdSaisie, "", foundUser);
        boolean userConnected = false;

        if (session.getAttribute("loggedIn") != null && session.getAttribute("login") != "root") {

            userConnected = true;
        }

        if (userConnected) {
            // 1. Récupération de la liste depuis le service
            List<V_rubrique_fin> rubriques = Service_rubrique.getRubriqueFIN(); // .getAllRubriques();

            // 2. Création de l'objet Gson (compatible 2.2.2)
            Gson gson = new GsonBuilder().create();

            // 3. Conversion Liste -> JSON
            String json = gson.toJson(rubriques);

            // 4. Configuration de la réponse HTTP
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // 5. Envoi du JSON au client
            PrintWriter out = response.getWriter();

            request.setAttribute("fin_data", json);
            request.getRequestDispatcher("/rubrique_saisie_fin.jsp").forward(request, response);
            //out.print(json);
            //out.flush();
        } else {
            request.getRequestDispatcher("auth.jsp").forward(request, response);
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
            Logger.getLogger(controller_rubrique_fin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controller_rubrique_fin.class.getName()).log(Level.SEVERE, null, ex);
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
