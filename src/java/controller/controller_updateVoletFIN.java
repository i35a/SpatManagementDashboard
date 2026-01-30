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
public class controller_updateVoletFIN extends HttpServlet {

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

        String[] designation_cafin = request.getParameterValues("designation_cafin");
        String[] annee1_cafin = request.getParameterValues("annee1_cafin");
        String[] annee2_cafin = request.getParameterValues("annee2_cafin");
        String[] annee3_cafin = request.getParameterValues("annee3_cafin");
        String[] annee4_cafin = request.getParameterValues("annee4_cafin");
        String[] annee5_cafin = request.getParameterValues("annee5_cafin");
        
        String[] designation_ebidta = request.getParameterValues("designation_ebidta");
        String[] annee1_ebidta = request.getParameterValues("annee1_ebidta");
        String[] annee2_ebidta = request.getParameterValues("annee2_ebidta");
        String[] annee3_ebidta = request.getParameterValues("annee3_ebidta");
        String[] annee4_ebidta = request.getParameterValues("annee4_ebidta");
        String[] annee5_ebidta = request.getParameterValues("annee5_ebidta");
        
        String[] designation_exofin = request.getParameterValues("designation_exofin");
        String[] annee1_exofin = request.getParameterValues("annee1_exofin");
        String[] annee2_exofin = request.getParameterValues("annee2_exofin");
        String[] annee3_exofin = request.getParameterValues("annee3_exofin");
        String[] annee4_exofin = request.getParameterValues("annee4_exofin");
        String[] annee5_exofin = request.getParameterValues("annee5_exofin");
        
        Annee taona5 = Service_annee.findAnnee("annee5");
        Annee taona4 = Service_annee.findAnnee("annee4"); 
        Annee taona3 = Service_annee.findAnnee("annee3");
        Annee taona2 = Service_annee.findAnnee("annee2");
        Annee taona1 = Service_annee.findAnnee("annee1");
        int update_success = 1;
        /*****************MISE A JOUR DES EFFECTIFS PAR CATEGORIE*****************************/
        
        if (designation_cafin != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_cafin.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_cafin[i]);
                String  temp = annee1_cafin[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_cafin.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_cafin[j]);
                String  temp = annee2_cafin[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_cafin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_cafin[k]);
                String  temp = annee3_cafin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_cafin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_cafin[k]);
                String  temp = annee4_cafin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_cafin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_cafin[k]);
                String  temp = annee5_cafin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_ebidta != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_ebidta.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_ebidta[i]);
                String  temp = annee1_ebidta[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_ebidta.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_ebidta[j]);
                String  temp = annee2_ebidta[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_ebidta.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_ebidta[k]);
                String  temp = annee3_ebidta[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_ebidta.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_ebidta[k]);
                String  temp = annee4_ebidta[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_ebidta.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_ebidta[k]);
                String  temp = annee5_ebidta[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_exofin != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_exofin.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_exofin[i]);
                String  temp = annee1_exofin[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_exofin.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_exofin[j]);
                String  temp = annee2_exofin[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_exofin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_exofin[k]);
                String  temp = annee3_exofin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_exofin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_exofin[k]);
                String  temp = annee4_exofin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_exofin.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_exofin[k]);
                String  temp = annee5_exofin[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        String message_update = "Modification terminé avec succès !";
        if(update_success > 1 ) message_update = "Echec de modification. Veuillez verifier les informations saisies !";
        
        request.setAttribute("msg_update",message_update);
        request.getRequestDispatcher("/rubrique_fin").forward(request, response);
       // request.getRequestDispatcher("/rubrique_saisie_fin.jsp").forward(request, response);
        
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
