<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.GenericDao"%>
<%--<%@page import="service.ServiceArticle"%>--%>
<%--<%@page import="service.ServiceTypeArticle"%>--%>
<%--<%@page import="model.Article"%>--%>
<%--<%@page import="model.Stock"%>--%>
<%--<%@page import="model.Typearticle"%>--%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>SpatDashboard</title>
        <link href="assets/img/logo-spat-p.ico" rel="icon" type="image/x-icon" />
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="assets/js/jquery.js"></script>
        <link rel="stylesheet" href="assets/css/auth.css">

    </head>


    <style>
        @media screen and (min-width: 676px) {
            .big {
                max-width: 60%; /* New width for default modal */
            }
        }
        .scrollable {
            max-height: calc(100vh - 200px);
            overflow-y: auto;
        }
        #wrapper{
            background: radial-gradient(ellipse at center, #1c2b5a 1%,#1c2b5a 100%);
            height : 100px;
            color : #fdfefe;
            font-size:1.5em;
            padding-top: 2%;
            font-weight: bold;

        }
        #pied{
            top: 97%;
            position: fixed;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            background-color: #dddddd !important;
            padding: 20px;

        }
        select{
            font-size: 0.9em !important;
            height: 90% !important;
        }
    </style>


    <body id="page-top" style="font-size: 0.8em;">
        <div id="wrapper">
            <span>TABLEAU DE BORD</span>
        </div>  
        <div id="msg" style="text-align: center;margin-top: 2%;font-size: 0.8em;position:relative;z-index: 10;margin-top: 5%;width: 60%;">
            <%
                String msgerror = request.getParameter("msg");
                if (request.getParameter("msg") != null) {
            %>
            <div class="alert alert-danger" role="alert" style="width: 35%;">
                <strong><%=request.getParameter("msg")%></strong>
            </div>
            <% }%>   
        </div>      
        <div class="container">
            <center>
                <div class="logo">
                    <img src="assets/img/logo-spat-p.png" width="160px" height="130px"> 
                    <div class="clearfix"></div>
                </div> <br></br>
                <div class="middle">

                    <div id="login">

                        <form action="homepage" method="post" id="myform">
                            <fieldset class="clearfix">

                                <p><span class="fa fa-user"></span><input type="text" class="form-control" name="login" Placeholder="nom d'utilisateur" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                                <p><span class="fa fa-lock"></span><input type="password" class="form-control" name="password" Placeholder="Mot de passe" required></p> <!-- JS because of IE support; better: placeholder="Password" -->
                                
                                <div>
                                    <span style="width:50%; text-align:right;  display: inline-block;">
                                        <input type="submit" value="Se Connecter" name="seconnecter" id="seconnecter" class="form-control">
                                    </span>
                                </div>

                            </fieldset>
                            <div class="clearfix"></div>
                        </form>

                        <div class="clearfix"></div>

                    </div> <!-- end login -->


                </div>
            </center>
        </div>
        <div>                                      
            <footer class="bg-white sticky-footer" id="pied">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright® SPAT 2023</span></div>
                </div>
            </footer>
            <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>

        </div>         


        <script>

            function formSubmit() {
                document.getElementById("myform").submit();
            }
        </script>
    </body> 
</html>