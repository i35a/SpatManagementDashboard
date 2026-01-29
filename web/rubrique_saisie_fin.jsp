<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

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
        <title>Volet Finance</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>

                    <div class="container-fluid">
                        <h1>VOLET FIN SAISIE</h1>
                        <div style="display:flex;gap:45px;justify-content:space-between;">
                            <div><canvas id="caChart" width="400" height="400"></canvas>
                                <p>C.A</p>
                            </div>
                            <div><canvas id="margeChart" width="400" height="400"></canvas>
                                <p>Marge Op.</p>
                            </div>
                            <div><canvas id="resultChart" width="400" height="400"></canvas>
                                <p>Resultat.</p>
                            </div>
                        </div>
                        <%
                            Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
                            int annee = taona.getValeur();

                            String json = request.getAttribute("fin_data").toString();
                            Gson gson = new Gson();
                            V_rubrique_fin[] rubriques = gson.fromJson(json, V_rubrique_fin[].class);
                            //Rubrique_saisie rub = new Rubrique_saisie();
                        %>
                        <form action="controller_updateVoletFIN" method="post">

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Chiffre d' affaires</h5>
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
                                        <%     for (V_rubrique_fin item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("CAFIN")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_cafin" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="number" name="annee1_cafin" value="<%out.print(item.getAnnee1());%>"></td>
                                            <td><input type="text" name="annee2_cafin" value="<%out.print(item.getAnnee2());%>"></td>
                                            <td><input type="text" name="annee3_cafin" value="<%out.print(item.getAnnee3());%>"></td>
                                            <td><input type="text" name="annee4_cafin" value="<%out.print(item.getAnnee4());%>"></td>
                                            <td><input type="text" name="annee5_cafin" value="<%out.print(item.getAnnee5());%>"></td>

                                        </tr>
                                        <%          }
                                            } %>
                                    </table>

                                </div>
                            </div>

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Marge opérationnelle - EBIDTA</h5>
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
                                        <%     for (V_rubrique_fin item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("EBIDTAFIN")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_ebidta" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="number" name="annee1_ebidta" value="<%out.print(item.getAnnee1());%>"></td>
                                            <td><input type="text" name="annee2_ebidta" value="<%out.print(item.getAnnee2());%>"></td>
                                            <td><input type="text" name="annee3_ebidta" value="<%out.print(item.getAnnee3());%>"></td>
                                            <td><input type="text" name="annee4_ebidta" value="<%out.print(item.getAnnee4());%>"></td>
                                            <td><input type="text" name="annee5_ebidta" value="<%out.print(item.getAnnee5());%>"></td>

                                        </tr>
                                        <%         }
                                            }%>
                                    </table>

                                </div>
                            </div>

                            <div class="card bg-light mb-3" style="max-width: 65rem;">
                                <h5 class="card-header">Resultat de l'exercice</h5>
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
                                        <%     for (V_rubrique_fin item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("ExoFIN")) {
                                        %>
                                        <tr>
                                            <td><input type="text" name="designation_exofin" value="<%out.print(item.getDesignation());%>"></td>
                                            <td><input type="number" name="annee1_exofin" value="<%out.print(item.getAnnee1());%>"></td>
                                            <td><input type="text" name="annee2_exofin" value="<%out.print(item.getAnnee2());%>"></td>
                                            <td><input type="text" name="annee3_exofin" value="<%out.print(item.getAnnee3());%>"></td>
                                            <td><input type="text" name="annee4_exofin" value="<%out.print(item.getAnnee4());%>"></td>
                                            <td><input type="text" name="annee5_exofin" value="<%out.print(item.getAnnee5());%>"></td>
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
                    "<%= annee - 4%>",
                    "<%= annee - 3%>",
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let caData = [];
                let caLabel = "Chiffre d'Affaire";

            <%
                for (V_rubrique_fin item : rubriques) {
                    if ("CAFIN".equals(item.getCategorie_rubrique())) {
            %>
                caLabel = "<%= item.getDesignation()%>";
                caData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
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
                    "<%= annee - 4%>",
                    "<%= annee - 3%>",
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let ebidtaData = [];
                let ebidtaLabel = "Marge opérationnelle (EBITDA)";

            <%
                for (V_rubrique_fin item : rubriques) {
                    if ("EBIDTAFIN".equals(item.getCategorie_rubrique())) {
            %>
                ebidtaLabel = "<%= item.getDesignation()%>";
                ebidtaData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
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
                    "<%= annee - 4%>",
                    "<%= annee - 3%>",
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let resultatData = [];
                let resultatLabel = "Résultat de l'exercice";

            <%
        for (V_rubrique_fin item : rubriques) {
            if ("ExoFIN".equals(item.getCategorie_rubrique())) {
            %>
                resultatLabel = "<%= item.getDesignation()%>";
                resultatData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
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

    </body>
</html>
