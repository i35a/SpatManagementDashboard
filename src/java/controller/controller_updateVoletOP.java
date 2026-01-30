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
public class controller_updateVoletOP extends HttpServlet {

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

        String[] designation_trafic = request.getParameterValues("designation_trafic");
        String[] annee1_trafic = request.getParameterValues("annee1_trafic");
        String[] annee2_trafic = request.getParameterValues("annee2_trafic");
        String[] annee3_trafic = request.getParameterValues("annee3_trafic");
        String[] annee4_trafic = request.getParameterValues("annee4_trafic");
        String[] annee5_trafic = request.getParameterValues("annee5_trafic");
        
        String[] designation_touch = request.getParameterValues("designation_touch");
        String[] annee1_touch = request.getParameterValues("annee1_touch");
        String[] annee2_touch = request.getParameterValues("annee2_touch");
        String[] annee3_touch = request.getParameterValues("annee3_touch");
        String[] annee4_touch = request.getParameterValues("annee4_touch");
        String[] annee5_touch = request.getParameterValues("annee5_touch");
        
        String[] designation_evp = request.getParameterValues("designation_evp");
        String[] annee1_evp = request.getParameterValues("annee1_evp");
        String[] annee2_evp = request.getParameterValues("annee2_evp");
        String[] annee3_evp = request.getParameterValues("annee3_evp");
        String[] annee4_evp = request.getParameterValues("annee4_evp");
        String[] annee5_evp = request.getParameterValues("annee5_evp");
        
        String[] designation_mictsl = request.getParameterValues("designation_mictsl");
        String[] annee1_mictsl = request.getParameterValues("annee1_mictsl");
        String[] annee2_mictsl = request.getParameterValues("annee2_mictsl");
        String[] annee3_mictsl = request.getParameterValues("annee3_mictsl");
        String[] annee4_mictsl = request.getParameterValues("annee4_mictsl");
        String[] annee5_mictsl = request.getParameterValues("annee5_mictsl");
        
        Annee taona5 = Service_annee.findAnnee("annee5");
        Annee taona4 = Service_annee.findAnnee("annee4"); 
        Annee taona3 = Service_annee.findAnnee("annee3");
        Annee taona2 = Service_annee.findAnnee("annee2");
        Annee taona1 = Service_annee.findAnnee("annee1");
        int update_success = 1;
        /*****************MISE A JOUR DES EFFECTIFS PAR CATEGORIE*****************************/
        
        if (designation_trafic != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_trafic.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_trafic[i]);
                String  temp = annee1_trafic[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_trafic.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_trafic[j]);
                String  temp = annee2_trafic[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_trafic.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_trafic[k]);
                String  temp = annee3_trafic[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_trafic.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_trafic[k]);
                String  temp = annee4_trafic[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_trafic.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_trafic[k]);
                String  temp = annee5_trafic[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_touch != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_touch.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_touch[i]);
                String  temp = annee1_touch[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_touch.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_touch[j]);
                String  temp = annee2_touch[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_touch.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_touch[k]);
                String  temp = annee3_touch[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_touch.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_touch[k]);
                String  temp = annee4_touch[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_touch.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_touch[k]);
                String  temp = annee5_touch[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        
        /*****************MISE A JOUR DES EFFECTIFS PAR GENRE*****************************/
        
        if (designation_evp != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_evp.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_evp[i]);
                String  temp = annee1_evp[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_evp.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_evp[j]);
                String  temp = annee2_evp[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_evp.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_evp[k]);
                String  temp = annee3_evp[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_evp.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_evp[k]);
                String  temp = annee4_evp[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_evp.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_evp[k]);
                String  temp = annee5_evp[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona5.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
        }
        
        if (designation_mictsl != null) {
            boolean update_ok = true;
            for (int i = 0; i < designation_mictsl.length; i++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_mictsl[i]);
                String  temp = annee1_mictsl[i].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona1.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int j = 0; j < designation_mictsl.length; j++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_mictsl[j]);
                String  temp = annee2_mictsl[j].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona2.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_mictsl.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_mictsl[k]);
                String  temp = annee3_mictsl[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona3.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_mictsl.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_mictsl[k]);
                String  temp = annee4_mictsl[k].replace(" ", "") ;
                temp = temp.replace(",", ".");
                rs.setValeur_saisie(Double.parseDouble(temp));
                rs.setPeriode_annuel(taona4.getValeur());
                
                update_ok = Service_rubrique.update(rs);
                if(!update_ok) update_success++;
            }
            for (int k = 0; k < designation_mictsl.length; k++) { 
                Rubrique_saisie rs = new Rubrique_saisie();
                rs.setDesignation(designation_mictsl[k]);
                String  temp = annee5_mictsl[k].replace(" ", "") ;
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
        request.getRequestDispatcher("/rubrique_op").forward(request, response);
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
