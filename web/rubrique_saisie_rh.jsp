<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

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
        <title>Volet RH</title>
    </head>
    <body>
        <h1>VOLET RH SAISIE</h1>
        <% 
           Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
           int annee = taona.getValeur();
           
            String json = request.getAttribute("rh_data").toString();
            Gson gson = new Gson();
            V_rubrique_saisie[] rubriques = gson.fromJson(json, V_rubrique_saisie[].class);
            //Rubrique_saisie rub = new Rubrique_saisie();
        %>
        <form action="controller_updateVoletRH" method="post">
            
            <div class="card bg-light mb-3" style="max-width: 45rem;">
                <h5 class="card-header">Effectif par categorie</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_saisie item : rubriques) {
                            if(item.getCategorie_rubrique().equals("categorieRH")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_categrh" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_categrh" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_categrh" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_categrh" value="<%out.print(item.getAnnee3());%>"></td>
                       </tr>
                 <%          }
                        } %>
                     </table>
                    
                </div>
            </div>
            
            <div class="card bg-light mb-3" style="max-width: 45rem;">
                <h5 class="card-header">Effectif par genre</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_saisie item : rubriques) {
                            if(item.getCategorie_rubrique().equals("genreRH")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_genrerh" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_genrerh" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_genrerh" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_genrerh" value="<%out.print(item.getAnnee3());%>"></td>
                       </tr>
                 <%         } 
                        }%>
                     </table>
                    
                </div>
            </div>
            
            <div class="card bg-light mb-3" style="max-width: 45rem;">
                <h5 class="card-header">Salaire</h5>
                <div class="card-body">
                      <table border="1">
                       <tr>
                         <th>Description</th>
                         <th><% out.println(annee-2);%></th>
                         <th><% out.println(annee-1);%></th>
                         <th><% out.println(annee-0);%></th>
                       </tr>
                 <%     for (V_rubrique_saisie item : rubriques) {
                            if(item.getCategorie_rubrique().equals("salaireRH")|| item.getCategorie_rubrique().equals("salaireRH_prev")){
                 %>
                           <tr>
                         <td><input type="text" name="designation_salrh" value="<%out.print(item.getDesignation());%>"></td>
                         <td><input type="number" name="annee1_salrh" value="<%out.print(item.getAnnee1());%>"></td>
                         <td><input type="text" name="annee2_salrh" value="<%out.print(item.getAnnee2());%>"></td>
                         <td><input type="text" name="annee3_salrh" value="<%out.print(item.getAnnee3());%>"></td>
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
