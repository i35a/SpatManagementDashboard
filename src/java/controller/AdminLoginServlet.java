/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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
import service.ServiceRoleUtilisateur;
import utils.DBConnection;

/**
 *
 * @author ThunderRobot
 */
@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/adminlogin"})
public class AdminLoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String loginSaisie = "";
            String pwdSaisie = "";
            String DirectionSaisie = "";
            HttpSession session = request.getSession();
            Boolean loggedIn = false;
//        if (session == null) {
//            request.getRequestDispatcher("adminauth.jsp?msg=nosess").forward(request, response);
//        }

            //setConnectionDB sc = new setConnectionDB();
            Utilisateur foundUser = new Utilisateur();

            if (session.getAttribute("adminLogged") != null) {
                //loginSaisie = (String) session.getAttribute("adminLogged");
                //pwdSaisie = (String) session.getAttribute("password");
                //DirectionSaisie = (String) session.getAttribute("direction");
                loggedIn = true;
                foundUser.setLogin(0);
                foundUser.setId(0);
                foundUser.setIdRole(1);
            } else {
                loginSaisie = request.getParameter("login").toString();
                pwdSaisie = request.getParameter("password").toString();
                //DirectionSaisie = request.getParameter("direction").toString();

                session.setAttribute("login", loginSaisie);
                session.setAttribute("password", pwdSaisie);
                //session.setAttribute("direction", DirectionSaisie);
            }

            Connection connection = DBConnection.getConnection();//sc.connectAdmin(loginSaisie, pwdSaisie, foundUser); //sc.establish(loginSaisie, pwdSaisie, "", foundUser);

            if (session.getAttribute("adminLogged") == null && loginSaisie.equals("root") && pwdSaisie.equals("root")) {
                System.out.println("checked login");
                foundUser.setLogin(0);
                foundUser.setId(0);
                foundUser.setIdRole(1);
                session.setAttribute("adminLogged", true);
                loggedIn = true;
            } else {
                System.out.println("NO LOGIN FOUND");
            }
//&& foundUser.getId()==null
            System.out.println("Login found: " + loginSaisie + ",\npwd saisie: " + pwdSaisie);
            if (connection == null) {
                //request.setAttribute("msg", "Echec de connexion! Verifier vos informations de connection!");
                session.invalidate();
                session = request.getSession();
                String msgerror = "Echec de connexion! Vérifiez vos informations de connection!";
                request.getRequestDispatcher("adminauth.jsp?msg=" + msgerror).forward(request, response);
            } else if (connection != null && loggedIn) {
                //System.out.println(connection+""+loginSaisie+""+pwdSaisie+""+DirectionSaisie);
                //request.setAttribute("listeType", ServiceTypeArticle.getAllType(connection));
                //request.setAttribute("listeMois", getListMonth());
                //request.setAttribute("listeAnnee", getListYear());
                TypeRoleUtilisateur tru = ServiceRoleUtilisateur.getTypeById(foundUser.getIdRole(), connection);
                //session.setAttribute("loggedIn", foundUser.getId());
                session.setAttribute("userType", "admin");
                //session.setAttribute("userTypeId", tru.getId());
                //System.out.println("user type found: "+ session.getAttribute("userType"));
                //ArrayList<HashMap<String, String>> res = ServiceStock.getEtatStock(connection);
                //request.setAttribute("ListEtatStockType", ServiceStock.getEtatStock(connection));

                connection.close();
                //request.getRequestDispatcher("index.jsp").forward(request, response);
                request.getRequestDispatcher("dashboard-admin.jsp").forward(request, response);
            }

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
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
