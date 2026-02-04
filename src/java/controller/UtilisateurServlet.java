/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import excelexport.ExcelExport;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import model.Article;
//import model.Typearticle;
import model.Utilisateur;
//import service.ServiceArticle;
import service.ServiceRoleUtilisateur;
//import service.ServiceTypeArticle;
import service.ServiceUtilisateur;
import utils.DBConnection;

public class UtilisateurServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            request.getRequestDispatcher("users.jsp").forward(request, response);
//        }
        String loginSaisie = "";
        String pwdSaisie = "";
        String DirectionSaisie = "";
        HttpSession session = request.getSession(false);
        Boolean userConnected = false;
        if (session != null && session.getAttribute("login") != null && session.getAttribute("userType") != null && session.getAttribute("userType").toString().toLowerCase().equals("admin")) {
//            loginSaisie = (String) session.getAttribute("login");
//            pwdSaisie = (String) session.getAttribute("password");
//            DirectionSaisie = (String) session.getAttribute("direction");
            userConnected = true;
        }

        Connection connection = DBConnection.getConnection();
        // 
        // liste
//        Article arti = new Article();
        //search user 
        Utilisateur searchUser = new Utilisateur();
        if (userConnected) {
            if (request.getParameter("loginSearch") != null && !request.getParameter("loginSearch").trim().isEmpty()) {
                searchUser.setLogin(Integer.parseInt("0" + request.getParameter("loginSearch")));
            }
            if (request.getParameter("userNameSearch") != null) {
                searchUser.setFullname(request.getParameter("userNameSearch"));
                
                try{
                    searchUser.setLogin(Integer.valueOf(request.getParameter("userNameSearch")));
                    System.out.println("Query found: "+request.getParameter("userNameSearch"));
                }catch(NumberFormatException e){
                    System.out.println("NSearch user number format exception, query: "+request.getParameter("userNameSearch"));
                }
            }
            if (request.getParameter("userRoleSearch") != null && !request.getParameter("userRoleSearch").trim().isEmpty()) {
                searchUser.setIdRole(Integer.parseInt("0" + request.getParameter("userRoleSearch")));
                System.out.println("Role found:" + request.getParameter("userRoleSearch"));
            } else {
                System.out.println("**Cant find role type**");
            }
//        if (request.getParameter("designationrecherche") != null && !request.getParameter("designationrecherche").replace(" ", "").equals("")) {
//            String tmp = request.getParameter("designationrecherche").toLowerCase();
//            arti.setDesignation(tmp);
//        }
//        if (request.getParameter("typeartrecherche") != null && !request.getParameter("typeartrecherche").replace(" ", "").equals("")) {
//            arti.setIdtypeart(Integer.parseInt(request.getParameter("typeartrecherche")));
//        }
//        if (request.getParameter("referencerecherche") != null && !request.getParameter("referencerecherche").replace(" ", "").equals("")) {
//            String tmp = request.getParameter("referencerecherche").toLowerCase();
//            arti.setReference(tmp);
//        }
//        if (request.getParameter("fabricantrecherche") != null && !request.getParameter("fabricantrecherche").replace(" ", "").equals("")) {
//            String tmp = request.getParameter("fabricantrecherche").toLowerCase();
//            arti.setFabricant(tmp);
//        }
//        if (request.getParameter("etatrecherche") != null && !request.getParameter("etatrecherche").replace(" ", "").equals("")) {
//            arti.setEtat(request.getParameter("etatrecherche"));
//        }
//        if (request.getParameter("daterecherche") != null && !request.getParameter("daterecherche").replace(" ", "").equals("")) {
//            arti.setDateadd(Date.valueOf(request.getParameter("daterecherche")));
//        }
//        List<Article> arts =  ServiceArticle.getAllitems(arti, connection);
//        List<Typearticle> typearts = ServiceTypeArticle.getAllType(connection);

//        request.setAttribute("artrecherche", arti);
            if (request.getAttribute("userSearchRole") != null) {
                request.setAttribute("userSearchRole", searchUser.getIdRole());
            } else {
                request.setAttribute("userSearchRole", "0");
            }

            request.setAttribute("listeTypeRole", ServiceRoleUtilisateur.getAllType(connection));
            request.setAttribute("listeUsers", ServiceUtilisateur.getAllItems(searchUser, connection));

            connection.close();

            if (request.getParameter("export") != null) {
                Timestamp time = new Timestamp(System.currentTimeMillis());
                String name = "article_" + time;
                name = name.replace(" ", "_");
                name = name.replace(":", ".");
                String extension = request.getParameter("extension");
                String path = System.getProperty("catalina.base") + "\\work\\Catalina\\localhost\\stockInformatique\\";
                String filePath = path + name + extension;
                String[] columns = {"Idart", "Designation", "Reference", "Fabricant", "Type", "Etat", "Date"};
//            ServiceArticle.exportArticleToExcel(arts, filePath, "Article", columns);
//            ExcelExport.download(filePath, response, name + extension);
//            File file = new File(filePath);
//            file.delete();
            } else if (request.getParameter("download") != null) {

                String url = this.getServletContext().getRealPath("/");
                url = url + "assets/template/";
                String path = url.toString();
                String name = "TemplateImport";
                String extension = ".xlsx";
                String filePath = path + name + extension;
//              ExcelExport.download(filePath, response, name + extension);
            } else {
                request.getRequestDispatcher("users.jsp").forward(request, response);

            }
        } else {

            request.getRequestDispatcher("homepage").forward(request, response);

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
            Logger.getLogger(UtilisateurServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UtilisateurServlet.class.getName()).log(Level.SEVERE, null, ex);
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
