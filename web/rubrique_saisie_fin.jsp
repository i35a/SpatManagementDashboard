<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

<%@page import="model.V_evolution_annuel_fin_prev"%>
<%@page import="model.V_evolution_annuel_fin"%>
<%@page import="model.V_indicateur_fin"%>
<%@page import="service.Service_mois"%>
<%@page import="model.Mois"%>
<%@page import="service.Service_indicateur_fin"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page import="model.V_rubrique_fin"%>
<%@page import="model.Annee"%>
<%@page import="service.Service_annee"%>
<%@page import="model.V_rubrique_saisie"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="model.Rubrique_saisie"%>
<%@page import="org.json.JSONObject"%>
<%@page import="model.V_tendance_fin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finances</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>

                    <div class="container-fluid">
                        <h3 style="text-align: center;margin-bottom: 2%;">Tableau de bord - Finances</h3>
                        
                        
                        <div style="display:flex;gap:45px;justify-content:flex-start;">

<!--                             <div><canvas id="financeChart" width="400" height="400"></canvas>
                                <p>CA, EBIDTA, Resultat Chart.</p>
                            </div>-->
                        

                             <div>
                                 <label for="moisSelect"><b>Mois :</b>
                                    <select id="moisSelect" class="form-select" style="width:200px; display:inline-block;">
                                        <option value="1">Janvier</option>
                                        <option value="2">Février</option>
                                        <option value="3">Mars</option>
                                        <option value="4">Avril</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Juin</option>
                                        <option value="7">Juillet</option>
                                        <option value="8">Août</option>
                                        <option value="9">Septembre</option>
                                        <option value="10">Octobre</option>
                                        <option value="11">Novembre</option>
                                        <option value="12">Décembre</option>
                                    </select>
                                     </label>
                                 
                                 <canvas id="multiRubriqueChart" width="400" height="400"></canvas>
                                <p>Evolution annuelle du resulat de l'exercice et ses composantes.</p>
                            </div>
                            <div><canvas id="caEbitdaResultChart" width="400" height="400"></canvas>
                                <p>Evolution annuelle du CA, de l'EBIDTA et du Resultat de l'exercice</p>
                            </div>
                            <div><canvas id="tendanceChart" width="400" height="400"></canvas>
                                <p>Tendance de l'exercice</p>
                            </div>
                            
                        </div>
                        
                        
                        
                        <%
                            
                            java.time.LocalDate today = java.time.LocalDate.now();
                            int moisCourant = today.getMonthValue();

                            Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
                            int annee = taona.getValeur();
                            int annee1 = annee - 1;
                            int annee2 = annee - 2;
                            Mois res_mois = Service_mois.getCurrentMoisLib();
                            String mois = res_mois.getLibelle();
                            
                            String json = request.getAttribute("fin_data").toString();
                            String json_prev = request.getAttribute("fin_prev_data").toString();
                            Gson gson = new Gson(); Gson gson1 = new Gson();
                            V_evolution_annuel_fin[] rubriques = gson.fromJson(json, V_evolution_annuel_fin[].class);
                            V_evolution_annuel_fin_prev[] rubriques_prev = gson1.fromJson(json_prev, V_evolution_annuel_fin_prev[].class);
                            
                            DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.FRANCE);
                            DecimalFormat df = new DecimalFormat("#,##0.00", symbols);
                            String json_tendance_fin = request.getAttribute("fin_data_tendances").toString();
                            V_tendance_fin[] tendances = gson.fromJson(json_tendance_fin, V_tendance_fin[].class);
                        %>
                        
                        <% //check user type  
                            if(session.getAttribute("userType")!=null ){
                            final String USER_TYPE =  session.getAttribute("userType").toString().toLowerCase(); 
                                if(USER_TYPE.equals("fin") || USER_TYPE.equals("admin")){
                             %>
                             
                             <script>
let tendancesData = [];

<%
for (V_tendance_fin item : tendances) {
%>
tendancesData.push({
    designation: "<%= item.getDesignation() %>",
    annee: <%= item.getPeriode_ann() %>,
    mois: [
        <%= item.getJanvier() %>,
        <%= item.getFevrier() %>,
        <%= item.getMars() %>,
        <%= item.getAvril() %>,
        <%= item.getMai() %>,
        <%= item.getJuin() %>,
        <%= item.getJuillet() %>,
        <%= item.getAout() %>,
        <%= item.getSeptembre() %>,
        <%= item.getOctobre() %>,
        <%= item.getNovembre() %>,
        <%= item.getDecembre() %>
    ]
});
<%
}
%>
</script>
                        <form action="controller_updateVoletFIN" method="post">

                            <div class="card bg-light mb-3">
                                <h5 class="card-header">Chiffre d' affaires</h5>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <div class="col-12 col-md-7">
                                        <table border="1" class="table-responsive table-bordered">
                                            <tr>
                                                <th> </th>
                                                <th> </th>
                                                <th colspan="3" style="text-align: center;">Réalisation</th>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <th>Mois</th>
                                                <th><% out.println(annee2);%></th>
                                                <th><% out.println(annee1);%></th>
                                                <th><% out.println(annee);%></th>
                                            </tr>
                                            <%     for (V_evolution_annuel_fin item : rubriques) {
                                                    if (item.getCategorie_rubrique().equals("CAFIN") || item.getCategorie_rubrique().equals("CAFIN_prev")) {
                                            %>
                                            <tr>
                                                <td><input type="text" readonly name="designation_cafin" value="<%out.print(item.getDesignation());%>"></td>
                                                <td><input type="text" readonly name="mois_cafin" value="<%out.print(Service_mois.getMoisLibbyId(item.getPeriode_mensuel()).getLibelle());%>"></td>
                                                <td><input type="text" name="annee1_cafin" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                                <td><input type="text" name="annee2_cafin" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                                <td><input type="text" name="annee3_cafin" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>

                                            </tr>
                                            <%          }
                                                } %>
                                        </table>
                                        </div>
                                    <div class="col-12 col-md-5">    
                                    <table border="1">
                                        <tr class="border">
                                            <th colspan="3" style="text-align: center;">Budget</th>
                                        </tr>
                                        <tr>
                                            <th><% out.println(annee2);%></th>
                                            <th><% out.println(annee1);%></th>
                                            <th><% out.println(annee);%></th>
                                        </tr>
                                        <%     for (V_evolution_annuel_fin_prev item : rubriques_prev) {
                                                if (item.getCategorie_rubrique().equals("CAFIN") || item.getCategorie_rubrique().equals("CAFIN_prev")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="annee1_cafin" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                            <td><input type="text" name="annee2_cafin" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                            <td><input type="text" name="annee3_cafin" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>
                                            
                                        </tr>
                                        <%          }
                                            } %>
                                    </table>
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card bg-light mb-3">
                                <h5 class="card-header">Marge opérationnelle - EBIDTA</h5>
                                <div class="card-body">
                                     <div class="row g-3">
                                        <div class="col-12 col-md-7">
                                        <table border="1">
                                            <tr class="border">
                                                <th> </th>
                                                <th> </th>
                                                <th colspan="3" style="text-align: center;">Réalisation</th>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <th>Mois</th>
                                                <th><% out.println(annee2);%></th>
                                                <th><% out.println(annee1);%></th>
                                                <th><% out.println(annee);%></th>
                                            </tr>
                                            <%     for (V_evolution_annuel_fin item : rubriques) {
                                                    if (item.getCategorie_rubrique().equals("EBIDTAFIN") || item.getCategorie_rubrique().equals("EBIDTAFIN_prev")) {
                                            %>
                                            <tr>
                                                <td><input type="text" readonly name="designation_ebidta" value="<%out.print(item.getDesignation());%>"></td>
                                                <td><input type="text" readonly name="mois_ebidta" value="<%out.print(Service_mois.getMoisLibbyId(item.getPeriode_mensuel()).getLibelle());%>"></td>
                                                <td><input type="text" name="annee2_ebidta" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                                <td><input type="text" name="annee1_ebidta" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                                <td><input type="text" name="annee_ebidta" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>

                                            </tr>
                                            <%         }
                                                }%>
                                        </table>
                                        </div>
                                        <div class="col-12 col-md-5">    
                                        <table border="1">
                                            <tr class="border">
                                                <th colspan="3" style="text-align: center;">Budget</th>
                                            </tr>
                                            <tr>
                                                <th><% out.println(annee2);%></th>
                                                <th><% out.println(annee1);%></th>
                                                <th><% out.println(annee);%></th>
                                            </tr>
                                            <%     for (V_evolution_annuel_fin_prev item : rubriques_prev) {
                                                    if (item.getCategorie_rubrique().equals("EBIDTAFIN") || item.getCategorie_rubrique().equals("EBIDTAFIN_prev")) {
                                            %>
                                            <tr>
                                                <td><input type="text" name="annee1_ebidta" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                                <td><input type="text" name="annee2_ebidta" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                                <td><input type="text" name="annee3_ebidta" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>

                                            </tr>
                                            <%          }
                                                } %>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card bg-light mb-3">
                                <h5 class="card-header">Resultat de l'exercice</h5>
                                <div class="card-body">
                                     <div class="row g-3">
                                        <div class="col-12 col-md-7">
                                        <table border="1">
                                            <tr class="border">
                                                <th> </th>
                                                <th> </th>
                                                <th colspan="3" style="text-align: center;">Réalisation</th>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <th>Mois</th>
                                                <th><% out.println(annee2);%></th>
                                                <th><% out.println(annee1);%></th>
                                                <th><% out.println(annee);%></th>
                                            </tr>
                                            <%     for (V_evolution_annuel_fin item : rubriques) {
                                                    if (item.getCategorie_rubrique().equals("ExoFIN") || item.getCategorie_rubrique().equals("ExoFIN_prev")) {
                                            %>
                                            <tr>
                                                <td><input type="text" readonly name="designation_exofin" value="<%out.print(item.getDesignation());%>"></td>
                                                <td><input type="text" readonly name="mois_exofin" value="<%out.print(Service_mois.getMoisLibbyId(item.getPeriode_mensuel()).getLibelle());%>"></td>
                                                <td><input type="text" name="exo2_exofin" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                                <td><input type="text" name="exo1_exofin" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                                <td><input type="text" name="exo_exofin" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>
                                            </tr>
                                            <%         }
                                                }%>
                                        </table>
                                        </div>
                                        <div class="col-12 col-md-5">    
                                        <table border="1">
                                            <tr class="border">
                                                <th colspan="3" style="text-align: center;">Budget</th>
                                            </tr>
                                            <tr>
                                                <th><% out.println(annee2);%></th>
                                                <th><% out.println(annee1);%></th>
                                                <th><% out.println(annee);%></th>
                                            </tr>
                                            <%     for (V_evolution_annuel_fin_prev item : rubriques_prev) {
                                                    if (item.getCategorie_rubrique().equals("ExoFIN") || item.getCategorie_rubrique().equals("ExoFIN_prev")) {
                                            %>
                                            <tr>
                                                <td><input type="text" name="annee1_exofin" value="<%out.print(df.format(item.getAnnee()));%>"></td>
                                                <td><input type="text" name="annee2_exofin" value="<%out.print(df.format(item.getAnnee_n1()));%>"></td>
                                                <td><input type="text" name="annee3_exofin" value="<%out.print(df.format(item.getAnnee_n2()));%>"></td>

                                            </tr>
                                            <%          }
                                                } %>
                                        </table>
                                        </div>
                                    </div>    
                                </div>
                            </div>       
                                        
                                        <!--tendance du resultat --> 
                                        <div class="card bg-light mb-3">
    <h5 class="card-header">Tendance financière</h5>
    <div class="card-body">
        <div class="row g-3">
            <div class="col-12" style='overflow-x:scroll;'>

                <table border="1" class="table-responsive table-bordered">
                    <tr>
                        <th rowspan="2">Description</th>
                        <th rowspan="2">Année</th>
                        <th colspan="12" style="text-align: center;">Mois</th>
                    </tr>
                    <tr>
                        <th>Jan</th>
                        <th>Fév</th>
                        <th>Mar</th>
                        <th>Avr</th>
                        <th>Mai</th>
                        <th>Juin</th>
                        <th>Juil</th>
                        <th>Août</th>
                        <th>Sep</th>
                        <th>Oct</th>
                        <th>Nov</th>
                        <th>Déc</th>
                    </tr>
                    <script>
                    let datasetsMap = {};
                    </script>

                    <% for (V_tendance_fin item : tendances) { 
                    String anneeTendance = item.getPeriode_ann().toString();
                    %>
                    <tr>
                        <td>
                            <input type="text" readonly name="designation_tendance"
                                   value="<% out.print(item.getDesignation()); %>">
                        </td>

                        <td>
                            <input type="text" readonly name="annee_tendance"
                                   value="<% out.print(anneeTendance); %>">
                        </td>
                        <script>
if (!datasetsMap["<%= anneeTendance %>"]) {
    datasetsMap["<%= anneeTendance %>"] = new Array(12).fill(0);
}

datasetsMap["<%= anneeTendance %>"][0] += <%= item.getJanvier() %>;
datasetsMap["<%= anneeTendance %>"][1] += <%= item.getFevrier() %>;
datasetsMap["<%= anneeTendance %>"][2] += <%= item.getMars() %>;
datasetsMap["<%= anneeTendance %>"][3] += <%= item.getAvril() %>;
datasetsMap["<%= anneeTendance %>"][4] += <%= item.getMai() %>;
datasetsMap["<%= anneeTendance %>"][5] += <%= item.getJuin() %>;
datasetsMap["<%= anneeTendance %>"][6] += <%= item.getJuillet() %>;
datasetsMap["<%= anneeTendance %>"][7] += <%= item.getAout() %>;
datasetsMap["<%= anneeTendance %>"][8] += <%= item.getSeptembre() %>;
datasetsMap["<%= anneeTendance %>"][9] += <%= item.getOctobre() %>;
datasetsMap["<%= anneeTendance %>"][10] += <%= item.getNovembre() %>;
datasetsMap["<%= anneeTendance %>"][11] += <%= item.getDecembre() %>;

</script>
                        <td><input type="text" name="janvier" value="<% out.print(item.getJanvier()); %>"></td>
                        <td><input type="text" name="fevrier" value="<% out.print(item.getFevrier()); %>"></td>
                        <td><input type="text" name="mars" value="<% out.print(item.getMars()); %>"></td>
                        <td><input type="text" name="avril" value="<% out.print(item.getAvril()); %>"></td>
                        <td><input type="text" name="mai" value="<% out.print(item.getMai()); %>"></td>
                        <td><input type="text" name="juin" value="<% out.print(item.getJuin()); %>"></td>
                        <td><input type="text" name="juillet" value="<% out.print(item.getJuillet()); %>"></td>
                        <td><input type="text" name="aout" value="<% out.print(item.getAout()); %>"></td>
                        <td><input type="text" name="septembre" value="<% out.print(item.getSeptembre()); %>"></td>
                        <td><input type="text" name="octobre" value="<% out.print(item.getOctobre()); %>"></td>
                        <td><input type="text" name="novembre" value="<% out.print(item.getNovembre()); %>"></td>
                        <td><input type="text" name="decembre" value="<% out.print(item.getDecembre()); %>"></td>
                    </tr>
                    <% } %>

                </table>

            </div>
        </div>
    </div>
</div><!--end tendnace fin-->
                    
                            <button class="btn btn-primary" type="submit">Mettre à jour</button>
                        </form>
                                    <%  
                                        } 
} %>
                    </div> 
                </div> 
            </div> 
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.2/chart.min.js"></script>
        <script>
//            try {
//                const ctx = document.getElementById('myChart').getContext('2d');
//                const myChart = new Chart(ctx, {
//                    type: 'bar',
//                    data: {
//                        labels: ['RH', 'Finances', 'Environnement', 'Capitainerie', 'Environnement', 'Facturation'],
//                        datasets: [{
//                                label: '# of Votes',
//                                data: [12, 19, 3, 5, 2, 3],
//                                backgroundColor: [
//                                    'rgba(255, 99, 132, 0.2)',
//                                    'rgba(54, 162, 235, 0.2)',
//                                    'rgba(255, 206, 86, 0.2)',
//                                    'rgba(75, 192, 192, 0.2)',
//                                    'rgba(153, 102, 255, 0.2)',
//                                    'rgba(255, 159, 64, 0.2)'
//                                ],
//                                borderColor: [
//                                    'rgba(255, 99, 132, 1)',
//                                    'rgba(54, 162, 235, 1)',
//                                    'rgba(255, 206, 86, 1)',
//                                    'rgba(75, 192, 192, 1)',
//                                    'rgba(153, 102, 255, 1)',
//                                    'rgba(255, 159, 64, 1)'
//                                ],
//                                borderWidth: 1
//                            }]
//                    },
//                    options: {
//                        scales: {
//                            y: {
//                                beginAtZero: true
//                            }
//                        }
//                    }
//                });
//            } catch (e) {
//                console.log("chart error exception:" + e);
//            }
        </script>
        <script>
            try {

                // Labels = last 5 years
                const labels = [
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let caData = [];
                let caLabel = "Chiffre d'Affaire";

            <%
                for (V_evolution_annuel_fin item : rubriques) {
                    if ("CAFIN".equals(item.getCategorie_rubrique())) {
            %>
                caLabel = "<%= item.getDesignation()%>";
                caData = [
            <%=item.getAnnee_n2()  %>,
            <%=item.getAnnee_n1()%>,
            <%=item.getAnnee()%>
                ];
            <%
                        break; // remove if you want multiple CAFIN datasets
                    }
                }
            %>

                const ctx = document.getElementById('caChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: caLabel,
                                data: caData,
                                backgroundColor: 'rgba(75, 192, 192, 0.5)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return context.raw.toLocaleString() + " Ariary";
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return value.toLocaleString();
                                    }
                                }
                            }
                        }
                    }
                });

            } catch (e) {
                console.log("chart error exception: " + e);
            }
        </script>
        <script>
            try {

                // Labels = 5 dernières années
                const labels = [
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let ebidtaData = [];
                let ebidtaLabel = "Marge opérationnelle (EBITDA)";

            <%
                for (V_evolution_annuel_fin item : rubriques) {
                    if ("EBIDTAFIN".equals(item.getCategorie_rubrique())) {
            %>
                ebidtaLabel = "<%= item.getDesignation()%>";
                ebidtaData = [
            <%= item.getAnnee_n2()  %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee()  %>
               
                ];
            <%
                        break; // enlève si tu veux plusieurs lignes EBIDTA
                    }
                }
            %>

                const ctx = document.getElementById('margeChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'line', // plus lisible pour une marge
                    data: {
                        labels: labels,
                        datasets: [{
                                label: ebidtaLabel,
                                data: ebidtaData,
                                fill: false,
                                tension: 0.3,
                                backgroundColor: 'rgba(153, 102, 255, 0.5)',
                                borderColor: 'rgba(153, 102, 255, 1)',
                                borderWidth: 2,
                                pointRadius: 5
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return context.raw.toLocaleString() + " %";
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return value + " %";
                                    }
                                }
                            }
                        }
                    }
                });

            } catch (e) {
                console.log("chart error exception: " + e);
            }
        </script>
        <script>
            try {

                // Labels = 5 dernières années
                const labels = [
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let resultatData = [];
                let resultatLabel = "Résultat de l'exercice";

            <%
        for (V_evolution_annuel_fin item : rubriques) {
            if ("ExoFIN".equals(item.getCategorie_rubrique())) {
            %>
                resultatLabel = "<%= item.getDesignation()%>";
                resultatData = [
            <%= item.getAnnee_n2()  %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee()  %>
                
                ];
            <%
                break; // enlève si plusieurs résultats à afficher
            }
        }
            %>

                const ctx = document.getElementById('resultChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'bar', // bar = plus parlant pour un résultat
                    data: {
                        labels: labels,
                        datasets: [{
                                label: resultatLabel,
                                data: resultatData,
                                backgroundColor: 'rgba(255, 159, 64, 0.5)',
                                borderColor: 'rgba(255, 159, 64, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return context.raw.toLocaleString() + " Ariary";
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: false, // autorise les valeurs négatives
                                ticks: {
                                    callback: function (value) {
                                        return value.toLocaleString();
                                    }
                                }
                            }
                        }
                    }
                });

            } catch (e) {
                console.log("chart error exception: " + e);
            }
        </script>
        
        <script>
try {

    const labels = [
        "<%= annee - 2 %>",
        "<%= annee - 1 %>",
        "<%= annee %>"
    ];

    let caData = [];
    let ebidtaData = [];
    let resultatData = [];

    let caLabel = "Chiffre d'Affaire";
    let ebidtaLabel = "EBITDA";
    let resultatLabel = "Résultat";

<%
    for (V_evolution_annuel_fin item : rubriques) {

        if ("CAFIN".equals(item.getCategorie_rubrique())) {
%>
    caLabel = "<%= item.getDesignation() %>";
    caData = [
            <%= item.getAnnee_n2()  %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee()  %>
                    
    ];
<%
        }

        if ("EBIDTAFIN".equals(item.getCategorie_rubrique())) {
%>
    ebidtaLabel = "<%= item.getDesignation() %>";
    ebidtaData = [
         <%= item.getAnnee_n2()  %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee()  %>
                    
    ];
<%
        }

        if ("ExoFIN".equals(item.getCategorie_rubrique())) {
%>
    resultatLabel = "<%= item.getDesignation() %>";
    resultatData = [
        <%= item.getAnnee_n2()  %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee()  %>
                     
    ];
<%
        }
    }
%>

    const ctx = document.getElementById('financeChart').getContext('2d');

    new Chart(ctx, {
        data: {
            labels: labels,
            datasets: [

                // CA
                {
                    type: 'bar',
                    label: caLabel,
                    data: caData,
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                },

                // Résultat
                {
                    type: 'bar',
                    label: resultatLabel,
                    data: resultatData,
                    backgroundColor: 'rgba(255, 159, 64, 0.5)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                },

                // EBITDA
                {
                    type: 'line',
                    label: ebidtaLabel,
                    data: ebidtaData,
                    tension: 0.3,
                    borderWidth: 3,
                    pointRadius: 5,
                    fill: false,
                    borderColor: 'rgba(153, 102, 255, 1)',
                    backgroundColor: 'rgba(153, 102, 255, 0.5)'
                }
            ]
        },
        options: {
            responsive: true,
            interaction: {
                mode: 'index',
                intersect: false
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return context.dataset.label + " : " +
                                   context.raw.toLocaleString() + " K Ariary";
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: false,
                    ticks: {
                        callback: function (value) {
                            return value.toLocaleString() + " K Ariary";
                        }
                    }
                }
            }
        }
    });

} catch (e) {
    console.log("chart error exception: " + e);
}
</script>

<script>
try {

    const labels = [
        "<%= annee - 2 %>",
        "<%= annee - 1 %>",
        "<%= annee %>"
    ];

    let realData = [];
    let budgetData = [];
    let labelReal = "Réalisation";
    let labelBudget = "Budget";

    <% 
        for (V_evolution_annuel_fin item : rubriques) {
            if ("ExoFIN".equals(item.getCategorie_rubrique())) {
    %>
        labelReal = "<%= item.getDesignation() %>";
        realData = [
            <%= item.getAnnee_n2() %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee() %>
        ];
    <%
            break;
        }
    }

        for (V_evolution_annuel_fin_prev item : rubriques_prev) {
            if ("ExoFIN".equals(item.getCategorie_rubrique())) {
    %>
        budgetData = [
            <%= item.getAnnee_n2() %>,
            <%= item.getAnnee_n1() %>,
            <%= item.getAnnee() %>
        ];
    <%
            break;
        }
    }
    %>

    const ctx = document.getElementById('exoFinChart').getContext('2d');

    const exoFinChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    label: labelReal,
                    data: realData,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)'
                },
                {
                    label: labelBudget,
                    data: budgetData,
                    backgroundColor: 'rgba(255, 99, 132, 0.6)'
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return context.dataset.label + ": " 
                                   + context.raw.toLocaleString() + " Ariary";
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return value.toLocaleString();
                        }
                    }
                }
            }
        }
    });

} catch (e) {
    console.log("chart error exception: " + e);
}
</script>
 
<script>
try {
    //auto-select du mois
    document.getElementById("moisSelect").value = <%= java.time.LocalDate.now().getMonthValue() %>;
    let chart;

function buildChart(selectedMonth) {

    const labels = [
        "<%= annee - 2 %>",
        "<%= annee - 1 %>",
        "<%= annee %>"
    ];

    let dataOp = [0, 0, 0];
    let dataFin = [0, 0, 0];
    let dataExtra = [0, 0, 0];
    let dataResultat = [0, 0, 0];

    tendancesData.forEach(item => {

        let valeur = item.mois[selectedMonth - 1];

        let index = -1;

        if (item.annee == <%= annee - 2 %>) index = 0;
        else if (item.annee == <%= annee - 1 %>) index = 1;
        else if (item.annee == <%= annee %>) index = 2;

        if (index === -1) return;

        if (item.designation === "Resultat operationnel" || item.designation === "Résultat opérationnel") {
            dataOp[index] += valeur;
        } else if (item.designation === "Resultat financier") {
            dataFin[index] += valeur;
        } else if (item.designation === "Resultat extraordinaire") {
            dataExtra[index] += valeur;
        } else if (item.designation === "Resultat de l'exercice") {
            dataResultat[index] += valeur;
        }

    });

    if (chart) {
        chart.destroy();
    }

    const ctx = document.getElementById('multiRubriqueChart').getContext('2d');

    chart = new Chart(ctx, {
        data: {
            labels: labels,
            datasets: [
                {
                    type: 'bar',
                    label: 'Résultat opérationnel',
                    data: dataOp,
                    backgroundColor: 'blue'
                },
                {
                    type: 'bar',
                    label: 'Résultat financier',
                    data: dataFin,
                    backgroundColor: 'red'
                },
                {
                    type: 'bar',
                    label: 'Résultat extraordinaire',
                    data: dataExtra,
                    backgroundColor: 'gray'
                },
                {
                    type: 'line',
                    label: "Résultat de l'exercice",
                    data: dataResultat,
                    borderColor: 'orange',
                    backgroundColor: 'orange',
                    tension: 0.4,
                    yAxisID: 'y1'
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: (ctx) => ctx.dataset.label + ": " + ctx.raw.toLocaleString() + " Ariary"
                    }
                }
            },
            scales: {
                y: {
                    ticks: {
                        callback: v => v.toLocaleString()
                    }
                },
                y1: {
                    position: 'right',
                    grid: { drawOnChartArea: false },
                    ticks: {
                        callback: v => v.toLocaleString()
                    }
                }
            }
        }
    });
}

// initial
buildChart(document.getElementById("moisSelect").value);

// changement utilisateur
document.getElementById("moisSelect").addEventListener("change", function () {
    buildChart(parseInt(this.value));
});

} catch (e) {
    console.log("chart error exception: " + e);
}
</script>

<script>
try {

    const labels = [
        "<%= annee - 2 %>",
        "<%= annee - 1 %>",
        "<%= annee %>"
    ];

    let dataCA = [0, 0, 0];
    let dataEBITDA = [0, 0, 0];
    let dataResultat = [0, 0, 0];

    <% 
        for (V_evolution_annuel_fin item : rubriques) {

            String cat = item.getCategorie_rubrique();

            // ================= CA =================
            if ("CAFIN".equals(cat)) {
    %>
        dataCA[0] += <%= item.getAnnee_n2() %>;
        dataCA[1] += <%= item.getAnnee_n1() %>;
        dataCA[2] += <%= item.getAnnee() %>;
    <%
            }

            // ================= EBITDA =================
            if ("EBIDTAFIN".equals(cat)) {
    %>
        dataEBITDA[0] += <%= item.getAnnee_n2() %>;
        dataEBITDA[1] += <%= item.getAnnee_n1() %>;
        dataEBITDA[2] += <%= item.getAnnee() %>;
    <%
            }

            // ================= RESULTAT =================
            if ("ExoFIN".equals(cat) 
                && "Resultat de l'exercice".equals(item.getDesignation())) {
    %>
        dataResultat[0] += <%= item.getAnnee_n2() %>;
        dataResultat[1] += <%= item.getAnnee_n1() %>;
        dataResultat[2] += <%= item.getAnnee() %>;
    <%
            }
        }
    %>

    const ctx = document.getElementById('caEbitdaResultChart').getContext('2d');

    const chart = new Chart(ctx, {
        data: {
            labels: labels,
            datasets: [
                {
                    type: 'bar',
                    label: "Chiffre d'affaires",
                    data: dataCA,
                    backgroundColor: 'orange'
                },
                {
                    type: 'line',
                    label: "EBITDA",
                    data: dataEBITDA,
                    borderColor: 'green',
                    backgroundColor: 'green',
                    tension: 0.4
                },
                {
                    type: 'line',
                    label: "Résultat de l'exercice",
                    data: dataResultat,
                    borderColor: 'blue',
                    backgroundColor: 'blue',
                    tension: 0.4
                }
            ]
        },
        options: {
            responsive: true,
            interaction: {
                mode: 'index',
                intersect: false
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return context.dataset.label + ": " +
                                   context.raw.toLocaleString() + " Ariary";
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return value.toLocaleString();
                        }
                    }
                }
            }
        }
    });

} catch (e) {
    console.log("chart error exception: " + e);
}
</script>
<script>
    try{
const labels = [
    "Jan", "Fév", "Mar", "Avr", "Mai", "Juin",
    "Juil", "Août", "Sep", "Oct", "Nov", "Déc"
];

// Couleurs
const colors = [
    "#4e79a7", "#f28e2b", "#e15759",
    "#76b7b2", "#59a14f", "#edc949",
    "#af7aa1", "#ff9da7"
];

// 🔥 Récupération des années (hors budget)
let years = Object.keys(datasetsMap)
    .filter(k => k !== "BUDGET")
    .sort(); // tri croissant

// 🔥 Identifier année courante et N-1 automatiquement
let currentYear = years[years.length - 1];
let previousYear = years[years.length - 2];

// 🔥 Construction datasets dynamique
const datasets = Object.keys(datasetsMap).map((key, index) => {

    const isBudget = key === "BUDGET";
    const isCurrent = key === currentYear;
    const isPrevious = key === previousYear;

    let type = "line";

    // 🎯 logique demandée
    if (isBudget || isCurrent || isPrevious) {
        type = "line";
    }

    return {
        type: type,
        label: isBudget
            ? "Budget"
            : "Réalisations " + key,

        data: datasetsMap[key],

        backgroundColor: colors[index % colors.length],
        borderColor: colors[index % colors.length],

        tension: 0.4,
        fill: false,

        // 🔥 Mise en valeur visuelle
        borderWidth: (isCurrent || isPrevious || isBudget) ? 3 : 1,
        pointRadius: (isCurrent || isPrevious || isBudget) ? 4 : 2
    };
});

// 🔥 Chart
const ctx = document.getElementById('tendanceChartY').getContext('2d');

new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: datasets
    },
    options: {
        responsive: true,
        interaction: {
            mode: 'index',
            intersect: false
        },
        plugins: {
            tooltip: {
                callbacks: {
                    label: function (context) {
                        return context.dataset.label + " : " +
                               context.raw.toLocaleString() + " Ar";
                    }
                }
            },
            legend: {
                position: 'top'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: v => v.toLocaleString()
                }
            }
        }
    }
});
    }catch(e){
        console.log('Error tendances chart: '+e);
    }
</script>
<script>
try {

const labels = [
    "Jan", "Fév", "Mar", "Avr", "Mai", "Juin",
    "Juil", "Août", "Sep", "Oct", "Nov", "Déc"
];

const colors = {
    current: "#e15759",   // 2026
    previous: "#4e79a7",  // 2025
    budget: "#59a14f"     // Budget
};

// 🔥 Trier les années (hors budget)
let years = Object.keys(datasetsMap)
    .filter(k => k !== "BUDGET")
    .sort();

// Sécurité si peu de données
let currentYear = years[years.length - 1];
let previousYear = years[years.length - 2];

// 🔥 Construction datasets ciblée
const datasets = [];

// 👉 Année courante (ex: 2026)
if (datasetsMap[currentYear]) {
    datasets.push({
        label: "Réalisation " + currentYear,
        data: datasetsMap[currentYear],
        borderColor: colors.current,
        backgroundColor: colors.current,
        tension: 0.4,
        fill: false,
        borderWidth: 3
    });
}

// 👉 Année précédente (ex: 2025)
if (datasetsMap[previousYear]) {
    datasets.push({
        label: "Réalisation " + previousYear,
        data: datasetsMap[previousYear],
        borderColor: colors.previous,
        backgroundColor: colors.previous,
        tension: 0.4,
        fill: false,
        borderWidth: 3
    });
}

// 👉 Budget
if (datasetsMap["BUDGET"]) {
    datasets.push({
        label: "Budget",
        data: datasetsMap["BUDGET"],
        borderColor: colors.budget,
        backgroundColor: colors.budget,
        tension: 0.4,
        fill: false,
        borderDash: [5, 5], // 🔥 différencier visuellement
        borderWidth: 3
    });
}

// 🔥 Chart
const ctx = document.getElementById('tendanceChart').getContext('2d');

new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: datasets
    },
    options: {
        responsive: true,
        interaction: {
            mode: 'index',
            intersect: false
        },
        plugins: {
            tooltip: {
                callbacks: {
                    label: function (context) {
                        return context.dataset.label + " : " +
                               context.raw.toLocaleString() + " Ar";
                    }
                }
            },
            legend: {
                position: 'top'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: v => v.toLocaleString()
                }
            }
        }
    }
});

} catch(e) {
    console.log('Error tendances chart: ' + e);
}
</script>
    </body>
</html>
