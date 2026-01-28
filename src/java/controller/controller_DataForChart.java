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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.V_rubrique_fin;
import model.V_rubrique_global;
import service.Service_rubrique;

/**
 *
 * @author PC
 */
@WebServlet("/data_chart")
public class controller_DataForChart extends HttpServlet {

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
            throws ServletException, IOException {
        // 1. Récupération de la liste depuis le service
        List<V_rubrique_global> rub_chart_rh = Service_rubrique.getRubriqueGlobal_RH(); // .getRubriqueGlobal_RH();
        List<V_rubrique_global> rub_chart_fin = Service_rubrique.getRubriqueGlobal_FIN(); // .getRubriqueGlobal_FIN();
        List<V_rubrique_global> rub_chart_op = Service_rubrique.getRubriqueGlobal_OP(); // .getRubriqueGlobal_OP();

        // 2. Création de l'objet Gson (compatible 2.2.2)
        Gson gson = new GsonBuilder().create();

        // 3. Conversion Liste -> JSON
        String json_data_rh = gson.toJson(rub_chart_rh);
        String json_data_fin = gson.toJson(rub_chart_fin);
        String json_data_op = gson.toJson(rub_chart_op);

        // 4. Configuration de la réponse HTTP
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // 5. Envoi du JSON au client
        PrintWriter out = response.getWriter();
        
        request.setAttribute("data_chart_rh",json_data_rh);
        request.setAttribute("data_chart_fin",json_data_fin);
        request.setAttribute("data_chart_op",json_data_op);
        
        //6. page chart où vont atterir les données
        //request.getRequestDispatcher("/userlogin").forward(request, response);
        
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
        processRequest(request, response);
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
