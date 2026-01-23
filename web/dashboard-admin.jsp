<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.GenericDao"%> 
<%@page import="java.util.List"%>
<%@page import="service.ServiceRoleUtilisateur"%>
<%@page import="model.TypeRoleUtilisateur"%>
<%@page import="model.Utilisateur"%>
<%@page import="service.ServiceUtilisateur"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Admin dashboard</title>
        <link href="assets/img/logo-spat-p.ico" rel="icon" type="image/x-icon" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
    </head> 
    <body id="page-top" style="font-size: 0.9em;">
        <div id="wrapper">

            <jsp:include page="menu-admin.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid">
                            <form action="Auth" method="post" style="width: 100%;">
                                <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                                <button class="btn btn-danger float-right" id="logout" name="logout" type="submit" style="font-size:0.7em !important;margin-left: 90%"><i class="fas fa-power-off"></i> Deconnexion</button>
                            </form>     
                        </div>
                    </nav>

                    <div class="container-fluid">
                        <h2>Tableau de bord</h2>
                        <p>Bienvenue admin</p>
                        <div style="display:flex;gap:45px;justify-content:space-between;">
                            <div  ><canvas id="myChart" width="400" height="400"></canvas>
                            </div>
                            <div  ><canvas id="monthChart" width="400" height="400"></canvas> </div>
                            <div  ><canvas id="pieChart" width="400" height="400"></canvas> </div>
                        </div>
                        <div style="display:flex;gap:25px;margin-top:45px;justify-content:space-between;">
                            <div  ><canvas id="horizontalBarChart" width="400" height="400"></canvas>
                            </div> 
                        </div>
                    </div>
                </div>                                 
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
            try {
                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['RH', 'Finances', 'Environnement', 'Capitainerie', 'Environnement', 'Facturation'],
                        datasets: [{
                                label: '# of Votes',
                                data: [12, 19, 3, 5, 2, 3],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            } catch (e) {
                console.log("chart error exception:" + e);
            }
        </script>

        <script>
            try {
                const labels = [
                    'Janvier',
                    'Fevrier',
                    'Mars',
                    'Avril',
                    'Mai',
                    'Juin',
                ];

                const data = {
                    labels: labels,
                    datasets: [{
                            label: 'My First dataset',
                            backgroundColor: 'rgb(255, 99, 132)',
                            borderColor: 'rgb(255, 99, 132)',
                            data: [0, 10, 5, 2, 20, 30, 45],
                        }]
                };

                const config = {
                    type: 'line',
                    data: data,
                    options: {}
                };
                const myChart = new Chart(
                        document.getElementById('monthChart'),
                        config
                        );
            } catch (e) {
                console.log('Error chart date:' + e);
            }
        </script>

        <script>
            try {
                const data = {
                    labels: [
                        'Red',
                        'Blue',
                        'Yellow'
                    ],
                    datasets: [{
                            label: 'Pie dataset',
                            data: [300, 50, 100],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)'
                            ],
                            hoverOffset: 4
                        }]
                };

                const config = {
                    type: 'pie',
                    data: data,
                };

                const myChart = new Chart(
                        document.getElementById('pieChart'),
                        config
                        );
            } catch (e) {
                console.log("pie chart error: " + e);
            }
        </script>
        <script>
            try {
                const labels = [
                    'Janvier',
                    'Fevrier',
                    'Mars',
                    'Avril',
                    'Mai',
                    'Juin',
                    'Juillet'
                ];
                const data = {
                    labels: labels,
                    datasets: [{
                            axis: 'y',
                            label: 'Mois',
                            data: [65, 59, 80, 81, 56, 55, 40],
                            fill: false,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(201, 203, 207, 0.2)'
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)',
                                'rgb(201, 203, 207)'
                            ],
                            borderWidth: 1
                        }]
                };

                const config = {
                    type: 'bar',
                    data,
                    options: {
                        indexAxis: 'y',
                    }
                };
                
                //create chart here
                const myChart = new Chart(
                        document.getElementById('horizontalBarChart'),
                        config
                );
            } catch (e) {
                console.log('horizontal bar chart error:' + e)
            }
        </script>

        <script src="assets/js/menu-switch.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="assets/js/jquery.js"></script>
        <script src = "assets/js/jquery.dataTables.min.js"></script> 
    </body>
</html>
