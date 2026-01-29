<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="model.V_rubrique_op"%>
<%@page import="model.V_rubrique_fin"%>
<%@page import="model.Annee"%>
<%@page import="service.Service_annee"%>
<%@page import="model.V_rubrique_saisie"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="model.Rubrique_saisie"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <link href="assets/img/logo-spat-p.ico" rel="icon" type="image/x-icon" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/chart2.9.js"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OPERATIONS</title>
    </head>
    <body>
<<<<<<< Updated upstream
        <h1>VOLET OPERATION SAISIE</h1>
        <% 
           Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
           int annee = taona.getValeur();
           
            String json = request.getAttribute("op_data").toString();
            Gson gson = new Gson();
            V_rubrique_op[] rubriques = gson.fromJson(json, V_rubrique_op[].class);
            //Rubrique_saisie rub = new Rubrique_saisie();
        %>
        <form action="controller_updateVoletOP" method="post">
            
            <div class="card bg-light mb-3" style="max-width: 65rem;">
                <h5 class="card-header">Trafic maritime Global</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-4);%></th>
                         <th><% out.println(annee-3);%></th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_op item : rubriques) {
                            if(item.getCategorie_rubrique().equals("TraficGBL") || item.getCategorie_rubrique().equals("TraficGBL_prev")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_trafic" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_trafic" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_trafic" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_trafic" value="<%out.print(item.getAnnee3());%>"></td>
                         <td><input type="text" name="annee4_trafic" value="<%out.print(item.getAnnee4());%>"></td>
                         <td><input type="text" name="annee5_trafic" value="<%out.print(item.getAnnee5());%>"></td>
                       
                           </tr>
                 <%          }
                        } %>
                     </table>
                    
                </div>
            </div>
            
            <div class="card bg-light mb-3" style="max-width: 65rem;">
                <h5 class="card-header">Touchée de navire</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-4);%></th>
                         <th><% out.println(annee-3);%></th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_op item : rubriques) {
                            if(item.getCategorie_rubrique().equals("Touchee") || item.getCategorie_rubrique().equals("Touchee_prev")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_touch" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_touch" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_touch" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_touch" value="<%out.print(item.getAnnee3());%>"></td>
                         <td><input type="text" name="annee4_touch" value="<%out.print(item.getAnnee4());%>"></td>
                         <td><input type="text" name="annee5_touch" value="<%out.print(item.getAnnee5());%>"></td>
                       
                           </tr>
                 <%         } 
                        }%>
                     </table>
                    
                </div>
            </div>
            
            <div class="card bg-light mb-3" style="max-width: 65rem;">
                <h5 class="card-header">Trafic en EVP</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-4);%></th>
                         <th><% out.println(annee-3);%></th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_op item : rubriques) {
                            if(item.getCategorie_rubrique().equals("TraficEVP") || item.getCategorie_rubrique().equals("TraficEVP_prev")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_evp" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_evp" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_evp" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_evp" value="<%out.print(item.getAnnee3());%>"></td>
                         <td><input type="text" name="annee4_evp" value="<%out.print(item.getAnnee4());%>"></td>
                         <td><input type="text" name="annee5_evp" value="<%out.print(item.getAnnee5());%>"></td>
                       </tr>
                 <%         } 
                        }%>
                     </table>
                </div>
=======
        <div id="wrapper">
            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>

                    <div class="container-fluid">
                        <h3 style="text-align: center;margin-bottom: 2%;">Tableau de bord - Opérations</h3>
                        
                        <%
                            Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
                            int annee = taona.getValeur();

                            String json = request.getAttribute("op_data").toString();
                            Gson gson = new Gson();
                            V_rubrique_op[] rubriques = gson.fromJson(json, V_rubrique_op[].class);
                            
                            DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.FRANCE);
                            DecimalFormat df = new DecimalFormat("#,##0.00", symbols);
    
                        %>
                        <form action="controller_updateVoletOP" method="post">

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Trafic maritime Global</h5>
                                <div class="card-body">
                                    <table border="1">
                                        <tr>
                                            <th>Description</th>
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("TraficGBL") || item.getCategorie_rubrique().equals("TraficGBL_prev")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_trafic" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="text" name="annee1_trafic" value="<%out.print(df.format(item.getAnnee1()));%>"></td>
                                            <td><input type="text" name="annee2_trafic" value="<%out.print(df.format(item.getAnnee2()));%>"></td>
                                            <td><input type="text" name="annee3_trafic" value="<%out.print(df.format(item.getAnnee3()));%>"></td>
                                            <td><input type="text" name="annee4_trafic" value="<%out.print(df.format(item.getAnnee4()));%>"></td>
                                            <td><input type="text" name="annee5_trafic" value="<%out.print(df.format(item.getAnnee5()));%>"></td>

                                        </tr>
                                        <%          }
                            } %>
                                    </table>

                                </div>
                            </div>

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Touchée de navire</h5>
                                <div class="card-body">
                                    <table border="1">
                                        <tr>
                                            <th>Description</th>
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("Touchee") || item.getCategorie_rubrique().equals("TraficEVP_prev")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_touch" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="text" name="annee1_touch" value="<%out.print(df.format(item.getAnnee1()));%>"></td>
                                            <td><input type="text" name="annee2_touch" value="<%out.print(df.format(item.getAnnee2()));%>"></td>
                                            <td><input type="text" name="annee3_touch" value="<%out.print(df.format(item.getAnnee3()));%>"></td>
                                            <td><input type="text" name="annee4_touch" value="<%out.print(df.format(item.getAnnee4()));%>"></td>
                                            <td><input type="text" name="annee5_touch" value="<%out.print(df.format(item.getAnnee5()));%>"></td>

                                        </tr>
                                        <%         }
                            }%>
                                    </table>

                                </div>
                            </div>

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Trafic en EVP</h5>
                                <div class="card-body">
                                    <table border="1">
                                        <tr>
                                            <th>Description</th>
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("TraficEVP") || item.getCategorie_rubrique().equals("TraficEVP_prev")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_evp" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="text" name="annee1_evp" value="<%out.print(df.format(item.getAnnee1()));%>"></td>
                                            <td><input type="text" name="annee2_evp" value="<%out.print(df.format(item.getAnnee2()));%>"></td>
                                            <td><input type="text" name="annee3_evp" value="<%out.print(df.format(item.getAnnee3()));%>"></td>
                                            <td><input type="text" name="annee4_evp" value="<%out.print(df.format(item.getAnnee4()));%>"></td>
                                            <td><input type="text" name="annee5_evp" value="<%out.print(df.format(item.getAnnee5()));%>"></td>
                                        </tr>
                                        <%         }
                            }%>
                                    </table>
                                </div>
                            </div> 

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Performance MICTSL</h5>
                                <div class="card-body">
                                    <table border="1">
                                        <tr>
                                            <th>Description</th>
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("RdmtMICTSL") || item.getCategorie_rubrique().equals("RdmtMICTSL_prev")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_mictsl" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="text" name="annee1_mictsl" value="<%out.print(df.format(item.getAnnee1()));%>"></td>
                                            <td><input type="text" name="annee2_mictsl" value="<%out.print(df.format(item.getAnnee2()));%>"></td>
                                            <td><input type="text" name="annee3_mictsl" value="<%out.print(df.format(item.getAnnee3()));%>"></td>
                                            <td><input type="text" name="annee4_mictsl" value="<%out.print(df.format(item.getAnnee4()));%>"></td>
                                            <td><input type="text" name="annee5_mictsl" value="<%out.print(df.format(item.getAnnee5()));%>"></td>
                                        </tr>
                                        <%         }
                            }%>
                                    </table>
                                </div>
                            </div>          
                            <button class="btn btn-primary" type="submit">Mettre à jour</button>
                        </form>
                    </div> 
                </div> 
>>>>>>> Stashed changes
            </div> 
                     
            <div class="card bg-light mb-3" style="max-width: 65rem;">
                <h5 class="card-header">Performance MICTSL</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-4);%></th>
                         <th><% out.println(annee-3);%></th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_op item : rubriques) {
                            if(item.getCategorie_rubrique().equals("RdmtMICTSL") || item.getCategorie_rubrique().equals("RdmtMICTSL_prev")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_mictsl" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_mictsl" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_mictsl" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_mictsl" value="<%out.print(item.getAnnee3());%>"></td>
                         <td><input type="text" name="annee4_mictsl" value="<%out.print(item.getAnnee4());%>"></td>
                         <td><input type="text" name="annee5_mictsl" value="<%out.print(item.getAnnee5());%>"></td>
                       </tr>
                 <%         } 
                        }%>
                     </table>
                </div>
            </div>          
            <button class="btn btn-primary" type="submit">Mettre à jour</button>
        </form>
    </body>
</html>
