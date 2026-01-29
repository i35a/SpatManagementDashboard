<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.GenericDao"%> 
<%@page import="java.util.List"%>
<%@page import="service.ServiceRoleUtilisateur"%>
<%@page import="model.TypeRoleUtilisateur"%>
<%@page import="model.Utilisateur"%>
<%@page import="service.ServiceUtilisateur"%>
<%@page import="model.V_rubrique_fin"%>
<%@page import="model.Annee"%>
<%@page import="service.Service_annee"%>
<%@page import="model.V_rubrique_saisie"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="model.Rubrique_saisie"%>
<%@page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Dashboard Utilisateur</title>
        <link href="assets/img/logo-spat-p.ico" rel="icon" type="image/x-icon" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
    </head>


    <style>
        /*      
                @media screen and (min-width: 676px) {
                    .big {
                        max-width: 60%;  New width for default modal 
                    }
                }
                .scrollable {
                    max-height: calc(100vh - 200px);
                    overflow-y: auto;
                }
                .sidebar-stock {
                    background-color: #0C3060 !important;
                    background-image: linear-gradient(180deg, #0C3060 10%, #224abe 100%) !important;
                    background-size: cover;
                
                }
                button img{
                    width : 25%;
                }
                .py-3 {
                    padding-bottom: 0 !important;
                    padding-top: 0 !important;
                }
                .card-header{
                    padding : 0 !important;
                }
                #sep{
                    width: 80%;
                    color: white;
                    height: 2px;
                }
                button, input, select{
                    font-size: 0.9em !important;
                    height: 90% !important;
                }
                button #logout{
                    font-size: 0.7em !important;
                }*/
    </style>


    <body id="page-top" style="font-size: 0.9em;">
        <div id="wrapper">

            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>
                    <%
                        Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
                        int annee = taona.getValeur();

                        String json = request.getAttribute("fin_data").toString();
                        Gson gson = new Gson();
                        V_rubrique_fin[] rubriques = gson.fromJson(json, V_rubrique_fin[].class);
                        //Rubrique_saisie rub = new Rubrique_saisie();
                    %>
                    <div class="container-fluid">
                        <h2>Tableau de bord</h2>
                        <p>Bienvenue à vous</p>
                        <div><a href="editiondonnees" class="btn btn-light ">Edition de données</a></div>
                        <!--                        <div style="display:flex;gap:45px;justify-content:space-between;">
                                                    <div  ><canvas id="myChart" width="250" height="250"></canvas>
                                                    </div>
                                                    <div  ><canvas id="monthChart" width="250" height="250"></canvas> </div>
                                                    <div  ><canvas id="pieChart" width="250" height="250"></canvas> </div>
                                                </div>
                                                <div style="display:flex;gap:25px;margin-top:45px;justify-content:space-between;">
                                                    <div  ><canvas id="horizontalBarChart" width="250" height="250"></canvas>
                                                    </div> 
                                                </div>-->
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
                    </div>
                </div>  <% //con.close();%>                                 
                <footer class="bg-white sticky-footer">
                    <div class="container my-auto">
                        <div class="text-center my-auto copyright"><span>Copyright® SPAT 2026</span></div>
                    </div>
                </footer>
                <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
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
//            try {
//                const labels = [
//                    'Janvier',
//                    'Fevrier',
//                    'Mars',
//                    'Avril',
//                    'Mai',
//                    'Juin',
//                ];
//
//                const data = {
//                    labels: labels,
//                    datasets: [{
//                            label: 'My First dataset',
//                            backgroundColor: 'rgb(255, 99, 132)',
//                            borderColor: 'rgb(255, 99, 132)',
//                            data: [0, 10, 5, 2, 20, 30, 45],
//                        }]
//                };
//
//                const config = {
//                    type: 'line',
//                    data: data,
//                    options: {}
//                };
//                const myChart = new Chart(
//                        document.getElementById('monthChart'),
//                        config
//                        );
//            } catch (e) {
//                console.log('Error chart date:' + e);
//            }
        </script>

        <script>
//            try {
//                const data = {
//                    labels: [
//                        'Red',
//                        'Blue',
//                        'Yellow'
//                    ],
//                    datasets: [{
//                            label: 'Pie dataset',
//                            data: [300, 50, 100],
//                            backgroundColor: [
//                                'rgb(255, 99, 132)',
//                                'rgb(54, 162, 235)',
//                                'rgb(255, 205, 86)'
//                            ],
//                            hoverOffset: 4
//                        }]
//                };
//
//                const config = {
//                    type: 'pie',
//                    data: data,
//                };
//
//                const myChart = new Chart(
//                        document.getElementById('pieChart'),
//                        config
//                        );
//            } catch (e) {
//                console.log("pie chart error: " + e);
//            }
        </script>
        <script>
//            try {
//                const labels = [
//                    'Janvier',
//                    'Fevrier',
//                    'Mars',
//                    'Avril',
//                    'Mai',
//                    'Juin',
//                    'Juillet'
//                ];
//                const data = {
//                    labels: labels,
//                    datasets: [{
//                            axis: 'y',
//                            label: 'Mois',
//                            data: [65, 59, 80, 81, 56, 55, 40],
//                            fill: false,
//                            backgroundColor: [
//                                'rgba(255, 99, 132, 0.2)',
//                                'rgba(255, 159, 64, 0.2)',
//                                'rgba(255, 205, 86, 0.2)',
//                                'rgba(75, 192, 192, 0.2)',
//                                'rgba(54, 162, 235, 0.2)',
//                                'rgba(153, 102, 255, 0.2)',
//                                'rgba(201, 203, 207, 0.2)'
//                            ],
//                            borderColor: [
//                                'rgb(255, 99, 132)',
//                                'rgb(255, 159, 64)',
//                                'rgb(255, 205, 86)',
//                                'rgb(75, 192, 192)',
//                                'rgb(54, 162, 235)',
//                                'rgb(153, 102, 255)',
//                                'rgb(201, 203, 207)'
//                            ],
//                            borderWidth: 1
//                        }]
//                };
//
//                const config = {
//                    type: 'bar',
//                    data,
//                    options: {
//                        indexAxis: 'y',
//                    }
//                };
//
//                //create chart here
//                const myChart = new Chart(
//                        document.getElementById('horizontalBarChart'),
//                        config
//                        );
//            } catch (e) {
//                console.log('horizontal bar chart error:' + e)
//            }
        </script>
        <!--FINANCES CHARTS SCRIPTS --> 
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
        <script src="assets/js/menu-switch.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="assets/js/jquery.js"></script>
        <script src = "assets/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                var table = $('#tableart').DataTable({
                    "paging": true,
                    "pageLength": 10,
                    "searching": false,
                    "select": true
                });
            });

            //update user
            $(document).on("click", ".editarticle", function () {

                $(".modal-body #idart").val($(this).data('idart'));
                $(".modal-body #userName").val($(this).data('designation'));
                $(".modal-body #userMatricule").val($(this).data('matricule'));
                $(".modal-body #userRoleType").val($(this).data('userrole'));
                //data-matricule="article.getLogin()" data-userrole
                //$(".modal-body #u")
                console.log('user matricule: ' + $(this).data('userMatricule'));
                console.log('user name: ' + $(this).data('userName'));
                $(".modal-body #designation").val($(this).data('designation'));
                $(".modal-body #reference").val($(this).data('reference'));
                $(".modal-body #fabricant").val($(this).data('fabricant'));
                var idtype = $(this).data('type');
                console.log(idtype);
                var seuil = $(this).data('type');
                console.log(idtype);
                //$(".modal-body #typeart select").val(idtype).change();
                $('.modal-body #typeart option[value=' + idtype + ']').attr('selected', 'selected');
                $(".modal-body #etat select").val($(this).data('etat'));
                $(".modal-body #qtealert").val($(this).data('qtealert'));
                $('.modal-body #seuilalert option[value=' + seuil + ']').attr('selected', 'selected');
                $(".modal-body #designation").attr("readonly", true);
                //$(".modal-body #reference").attr("readonly", true);
                $(".modal-body #typeart").attr("readonly", true);
                // console.log($(this).data('listComment'));
                console.log($(this).data('comment'));
                $(".modal-body #commentMessage").val($(this).data('comment'));
                // console.log($(this).data('commentMessage'));
            });

            function formSubmit() {
                document.getElementById("myform").submit();
            }
        </script>
    </body>
</html>
