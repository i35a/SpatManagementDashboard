<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

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
        <title>Volet OPERATION</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>

                    <div class="container-fluid">
                        <h1>VOLET OPERATION SAISIE</h1>
                        <div style="display:flex;gap:45px;justify-content:space-between;">
                            <div  ><canvas id="traficChart" width="300" height="400"></canvas>
                                <p>Trafic Maritime.</p>
                            </div> 
                            <div  ><canvas id="toucheesChart" width="300" height="400"></canvas>
                                <p>Touchées de navires</p>
                            </div>

                            <div  ><canvas id="traficEvpChart" width="300" height="400"></canvas>
                                <p>Trafic EVP.</p>
                            </div>
                          
                            <div  ><canvas id="perfMictslChart" width="300" height="400"></canvas>
                                <p>Perf. MICTSL</p>
                            </div>

                        </div>
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
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("TraficGBL")) {
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
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("Touchée")) {
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
                                            <th><% out.println(annee - 4);%></th>
                                            <th><% out.println(annee - 3);%></th>
                                            <th><% out.println(annee - 2);%></th>
                                            <th><% out.println(annee - 1);%></th>
                                            <th><% out.println(annee - 0);%></th>
                                        </tr>
                                        <%     for (V_rubrique_op item : rubriques) {
                                                if (item.getCategorie_rubrique().equals("TraficEVP")) {
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
                                                if (item.getCategorie_rubrique().equals("RdmtMICTSL")) {
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

                // Labels = 5 dernières années
                const labels = [
                    "<%= annee - 4%>",
                    "<%= annee - 3%>",
                    "<%= annee - 2%>",
                    "<%= annee - 1%>",
                    "<%= annee%>"
                ];

                let traficData = [];
                let traficLabel = "Trafic maritime global";

            <%
        for (V_rubrique_op item : rubriques) {
            if ("TraficGBL".equals(item.getCategorie_rubrique())) {
            %>
                traficLabel = "<%= item.getDesignation()%>";
                traficData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
                ];
            <%
                break; // enlève si plusieurs lignes trafic
            }
        }
            %>

                const ctx = document.getElementById('traficChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: traficLabel,
                                data: traficData,
                                fill: false,
                                tension: 0.3,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
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
                                        return context.raw.toLocaleString();
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

                let toucheesData = [];
                let toucheesLabel = "Touchées de navires";

            <%
                for (V_rubrique_op item : rubriques) {
                    if ("Touchée".equals(item.getCategorie_rubrique())) {
            %>
                toucheesLabel = "<%= item.getDesignation()%>";
                toucheesData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
                ];
            <%
                        break; // enlève si plusieurs lignes "Touchée"
                    }
                }
            %>

                const ctx = document.getElementById('toucheesChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: toucheesLabel,
                                data: toucheesData,
                                backgroundColor: 'rgba(0, 123, 255, 0.5)',
                                borderColor: 'rgba(0, 123, 255, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return context.raw.toLocaleString() + " escales";
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 1,
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

                let evpData = [];
                let evpLabel = "Trafic en EVP";

            <%
                for (V_rubrique_op item : rubriques) {
                    if ("TraficEVP".equals(item.getCategorie_rubrique())) {
            %>
                evpLabel = "<%= item.getDesignation()%>";
                evpData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
                ];
            <%
                        break; // enlève si plusieurs lignes EVP
                    }
                }
            %>

                const ctx = document.getElementById('traficEvpChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: evpLabel,
                                data: evpData,
                                fill: false,
                                tension: 0.3,
                                backgroundColor: 'rgba(40, 167, 69, 0.5)',
                                borderColor: 'rgba(40, 167, 69, 1)',
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
                                        return context.raw.toLocaleString() + " EVP";
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

                let mictslData = [];
                let mictslLabel = "Performance MICTSL";

            <%
                for (V_rubrique_op item : rubriques) {
                    if ("RdmtMICTSL".equals(item.getCategorie_rubrique())) {
            %>
                mictslLabel = "<%= item.getDesignation()%>";
                mictslData = [
            <%= item.getAnnee1()%>,
            <%= item.getAnnee2()%>,
            <%= item.getAnnee3()%>,
            <%= item.getAnnee4()%>,
            <%= item.getAnnee5()%>
                ];
            <%
                        break; // enlève si plusieurs indicateurs MICTSL
                    }
                }
            %>

                const ctx = document.getElementById('perfMictslChart').getContext('2d');

                const myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: mictslLabel,
                                data: mictslData,
                                fill: false,
                                tension: 0.3,
                                backgroundColor: 'rgba(255, 193, 7, 0.5)',
                                borderColor: 'rgba(255, 193, 7, 1)',
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
                                        return context.raw.toLocaleString();
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

    </body>
</html>
