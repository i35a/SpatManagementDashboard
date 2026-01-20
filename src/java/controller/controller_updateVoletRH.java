/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Annee;
import model.Rubrique_saisie;
import static org.postgresql.util.ByteConverter.bool;
import service.Service_annee;
import service.Service_rubrique;

/**
 *
 * @author PC
 */
public class controller_updateVoletRH extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String[] designation_categrh = request.getParameterValues("designation_categrh");
        String[] annee1_categrh = request.getParameterValues("annee1_categrh");
        String[] annee2_categrh = request.getParameterValues("annee2_categrh");
        String[] annee3_categrh = request.getParameterValues("annee3_categrh");
        
        String[] designation_genrerh = request.getParameterValues("designation_genrerh");
        String[] annee1_genrerh = request.getParameterValues("annee1_genrerh");
        String[] annee2_genrerh = request.getParameterValues("annee2_genrerh");
        String[] annee3_genrerh = request.getParameterValues("annee3_genrerh");
        
        String[] designation_salrh = request.getParameterValues("designation_salrh");
        String[] annee1_salrh = request.getParameterValues("annee1_salrh");
        String[] annee2_salrh = request.getParameterValues("annee2_salrh");
        String[] annee3_salrh = request.getParameterValues("annee3_salrh");
        
        Annee taona3 = Service_annee.findAnnee("annee3");
        Annee taona2 = Service_annee.findAnnee("annee2"); 
        Annee taona1 = Service_annee.findAnnee("annee1");
        boolean update_jiaby = true;
        /*****************MISE A JOUR DES EFFECTIFS PAR CATEGORIE*****************************/
        
        if (designation_categrh != null) {
            for (int i = 0; i < designation_categrh.length; i++) { 
                System.out.println(designation_categrh[i] +"|"+annee1_categrh[i]+"|"+annee2_categrh[i]+"|"+annee3_categrh[i]);
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_categrh[i]);
                rs.setValeur_saisie(Double.parseDouble(annee1_categrh[i]));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int j = 0; j < designation_categrh.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_categrh[j]);
                rs.setValeur_saisie(Double.parseDouble(annee2_categrh[j]));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int k = 0; k < designation_categrh.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_categrh[k]);
                rs.setValeur_saisie(Double.parseDouble(annee3_categrh[k]));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
        }
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_genrerh != null) {
            for (int i = 0; i < designation_genrerh.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_genrerh[i]);
                rs.setValeur_saisie(Double.parseDouble(annee1_genrerh[i]));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int j = 0; j < designation_genrerh.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_genrerh[j]);
                rs.setValeur_saisie(Double.parseDouble(annee2_genrerh[j]));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int k = 0; k < designation_genrerh.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_genrerh[k]);
                rs.setValeur_saisie(Double.parseDouble(annee3_genrerh[k]));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
        }
        
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_salrh != null) {
            for (int i = 0; i < designation_salrh.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_salrh[i]);
                rs.setValeur_saisie(Double.parseDouble(annee1_salrh[i]));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int j = 0; j < designation_salrh.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_salrh[j]);
                rs.setValeur_saisie(Double.parseDouble(annee2_salrh[j]));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
            for (int k = 0; k < designation_salrh.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_salrh[k]);
                rs.setValeur_saisie(Double.parseDouble(annee3_salrh[k]));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_jiaby = Service_rubrique.update(rs);
            }
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controller_updateVoletRH</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controller_updateVoletRH at " + request.getContextPath() + "</h1>");
            out.println("update : "+update_jiaby);
            out.println("</body>");
            out.println("</html>");
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
