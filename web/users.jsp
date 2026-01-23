<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<%@page import="controller.setConnectionDB"%>--%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.GenericDao"%>
<%--<%@page import="service.ServiceArticle"%>
<%@page import="service.ServiceTypeArticle"%>
<%@page import="model.Article"%>
<%@page import="model.Typearticle"%>--%>
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
        <title>Liste des utilisateurs</title>
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
                        <div class="modal fade" role="dialog" tabindex="-1" id="modal-importxls" >
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Importer un fichier xls des utilisateurs</h4><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body" style="text-align: right;">
                                        <p></p>
                                        <form style="text-align: center;" method="post" action="ImporterArticle" enctype="multipart/form-data" >
                                            <input accept=".xls,.xlsx" id="fileName" class="form-control inputfile" type="file" name="fileName" style="text-align: center;" />
                                            <div class="modal-footer">
                                                <button class="btn btn-light" type="button" data-bs-dismiss="modal">Fermer</button>
                                                <button class="btn btn-primary" type="submit">Importer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" role="dialog" tabindex="-1" id="modal-newart">
                            <div class="modal-dialog big" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><i class="fa fa-user"></i> Ajouter un utilisateur</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="AjouterUtilisateur" method="post" >

                                            <div class="container">
                                                <div class="row-fluid">
                                                    <div class="row">
                                                        <input  hidden="" id="idart" class="form-control" type="number" name="idart">
                                                        <div class="col-md-2 col-lg-2">
                                                            Login
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input required=""  id="loginUser" class="form-control" type="number" name="loginUser">
                                                        </div>
                                                        <div class="col-md-2 col-lg-2">
                                                            Type
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <select class="form-select" style="border-style: solid;border-radius: 5px 5px 5px 5px;width: 100%;height: 100%;" name="userRole" id="userRole">
                                                                <%for (TypeRoleUtilisateur tpart : (List<TypeRoleUtilisateur>) request.getAttribute("listeTypeRole")) { %>
                                                                <option value="<% out.print(tpart.getId()); %>">
                                                                    <% out.print(tpart.getDescription()); %>
                                                                </option>
                                                                <%}%>
                                                            </select>
                                                        </div> 
                                                    </div> </br>
                                                    <div class="row">
                                                        <div class="col-md-2 col-lg-2">
                                                            Mot de passe
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input required  id="passwordUser" class="form-control" type="password" name="passwordUser">
                                                        </div> 
                                                        <div class="col-md-3 col-lg-3">
                                                        </div> 
                                                    </div>
                                                    <!-- <div class="row">
                                                        <div class="col-md-2 col-lg-2">
                                                            Date de Livraison
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input required="" id="datelivraison" class="form-control" type="date"  name="date">
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 offset-1">
                                                            Etat
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <select class="form-select" style="border-style: solid;border-radius: 5px 5px 5px 5px;width: 100%;height: 100%;" name="etat" id="etat">
                                                                <option value="1">Actif</option>
                                                                <option value="0">Inactif</option>
                                                            </select>
                                                        </div> 
                                                    </div> <br></br> -->
                                                    <!-- <div class="row">
                                                        <div class="col-md-2 col-lg-2">
                                                            Quantité d'alerte
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input required="" id="qtealert" class="form-control" type="number"  name="qtealert">
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 offset-1">
                                                            Seuil d'alerte
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <select class="form-select" style="border-style: solid;border-radius: 5px 5px 5px 5px;width: 100%;height: 100%;" name="seuilalert" id="seuilalert">
                                                                <option value="N">Non</option>
                                                                <option value="O">Oui</option>
                                                            </select>
                                                        </div>
                                                    </div> <br></br> -->
                                                    <!-- <div class="row">
                                                        <div class="col-md-2 col-lg-2">
                                                            Reference
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <textarea class="form-control" id="reference" name="reference" rows="2"></textarea>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 offset-1">
                                                            Fabricant
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <textarea class="form-control" id="fabricant" name="fabricant" rows="2"></textarea>
                                                        </div>
                                                    </div><br/><br/> -->
                                                    <!-- <div class="row align-items-start">
                                                        
                                                        <div class="col-md-2 col-lg-2">
                                                            Commentaire
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <textarea class="form-control" id="commentMessage" name="commentMessage" rows="2"></textarea>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3"></div>
                                                    </div> -->
                                                    <br></br>
                                                </div>  
                                                <div class="modal-footer">
                                                    <button class="btn btn-light" type="button" data-bs-dismiss="modal">Fermer</button>
                                                    <button class="btn btn-primary" type="submit">Enregistrer</button>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" role="dialog" tabindex="-1" id="modal-editart">
                            <div class="modal-dialog big" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><i class="fa fa-user"></i> Modifier utilisateur</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ModifierUtilisateur" method="post" style="margin-left:5%;width: 100%;">

                                            <div class="container">
                                                <div class="row-fluid">
                                                    <div class="row">
                                                        <input  hidden="" id="idart" class="form-control" type="number" name="idart">
                                                        <div class="col-md-2 col-lg-2">
                                                            Nom
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input required=""  id="designation" class="form-control" type="text" name="userName">
                                                        </div>
                                                        <div class="col-md-2 col-lg-2">
                                                            Type
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <select class="form-select" style="border-style: solid;border-radius: 5px 5px 5px 5px;width: 100%;height: 100%;" name="userRoleType" id="userRoleType" >
                                                                <%for (TypeRoleUtilisateur tpart : (List<TypeRoleUtilisateur>) request.getAttribute("listeTypeRole")) { %>
                                                                <option value="<% out.print(tpart.getId()); %>">
                                                                    <% out.print(tpart.getDescription()); %>
                                                                </option>
                                                                <%}%>
                                                            </select>
                                                        </div>

                                                    </div> </br>
                                                    </br>
                                                    </br>
                                                    <div class="row">
                                                        <div class="col-md-2 col-lg-2">
                                                            Matricule
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input type="number" class="form-control" id="userMatricule" name="userMatricule" disabled="true" />
                                                        </div>
                                                        <div class="col-md-2 col-lg-2">
                                                            Mot de passe
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <input type="password" class="form-control" id="userPassword" name="userPassword" />
                                                        </div>
                                                    </div> <br/>
                                                </div>  
                                                <div class="modal-footer">
                                                    <button class="btn btn-light" type="button" data-bs-dismiss="modal">Fermer</button>
                                                    <button class="btn btn-primary" type="submit">Modifier</button>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h2 class="text-primary m-0 fw-bold">Liste des utilisateurs</h2>
                        </div>
                        <div class="card-header py-3" style="margin-top: 0%;margin-bottom: 0%;">
                            <form action="users" method="post" id="myform">

                                <div class="table-responsive">
                                    <table class="table">

                                        <tbody>		

                                            <tr>
                                                <%
//                                                    Article artrecherche = new Article();
//                                                    Typearticle typerecherche = new Typearticle();
                                                    //TypeRoleUtilisateur tpa = new TypeRoleUtilisateur();
                                                    //tpa = ServiceRoleUtilisateur.getTypeById(article.getIdRole(), con);

//                                                    if (request.getAttribute("artrecherche") != null) {
//                                                        artrecherche = (Article) request.getAttribute("artrecherche");
//
//                                                    }
                                                %>
                                                <td>
                                                    <input value="<% //if (artrecherche.getDesignation() != null) {
                                                        //out.print(artrecherche.getDesignation());
                                                        //} %>" placeholder="Recherche nom,login.." onchange="formSubmit()" class="form-control" type="text" style="border-radius: 5px 5px 5px 5px;border-style: solid;width: 100%;height: 100%;" name="userNameSearch"> 
                                                </td>


                                                <td>

                                                    <select onchange="formSubmit()" class="form-select" style="border-style: solid;border-radius: 5px 5px 5px 5px;width: 100%;height: 100%;" name="userRoleSearch">
                                                        <option value="">Tout</option>
                                                        <%for (TypeRoleUtilisateur tp : (List<TypeRoleUtilisateur>) request.getAttribute("listeTypeRole")) { %>
                                                        <option value="<% out.print(tp.getId()); %>" 
                                                                <%
                                                                    if (request.getAttribute("userSearchRole") != null
                                                                            && request.getAttribute("userSearchRole") != null
                                                                            && request.getAttribute("userSearchRole") == tp.getId()) {
                                                                        out.print("selected=selected");
                                                                    } %>>
                                                            <!--                                                                <%/*if (artrecherche.getIdtypeart() != null && artrecherche.getIdtypeart().equals(tp.getIdtypeart())) {
                                                                                                                                                                out.print("selected=\"\"");
                                                                                                                                                            }*/%>>-->
                                                            <% out.print(tp.getDescription()); %>
                                                        </option>
                                                        <%}%>
                                                    </select>
                                                </td>


                                                <td> </td>                       
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                        <div><button  data-bs-target="#modal-newart" data-bs-toggle="modal" class="btn btn-primary" type="button" style="background: rgb(250,250,250);border-style: solid; border-color: #c3c3c3;height: 100%;color:#000000;"><i class="fa fa-add"></i> Ajouter</button></div>
                                                                               
                        <div class="card-body">

                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="tableart">
                                    <thead>
                                        <tr>
                                            <th width="25%">Nom</th>
                                            <th width="10%">Login</th> 
                                            <th width="10%">Role</th>
                                            <!--                                                    <th width="15%">Fabricant</th>
                                                                                                <th width="10%">Etat</th>
                                                                                                <th width="10%">Date</th>
                                                                                                <th width="10%">Commentaire</th>-->
                                            <th width="20%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>            
                                        <!-- liste -->
                                        <%
                                            String login = (String) session.getAttribute("login");
                                            String pwdSaisie = (String) session.getAttribute("password");
                                            String DirectionSaisie = (String) session.getAttribute("direction");
//                                            setConnectionDB sc = new setConnectionDB();

                                            Connection con = utils.DBConnection.getConnection();//sc.connect2(request);
                                        %>
                                        <% for (Utilisateur article : (List<Utilisateur>

                                            ) request.getAttribute (
                                                     
                                                "listeUsers")) {%>
                                        <% TypeRoleUtilisateur tpa = new TypeRoleUtilisateur();
                                            tpa = ServiceRoleUtilisateur.getTypeById(article.getIdRole(), con);
                                        %>
                                        <tr>
                                            <td><input value="<%=article.getFullname()%>" hidden="" name="listDesignation"><%=article.getFullname()%></td>  
                                            <td><input value="<%=article.getLogin()%>" hidden="" name="listDesignation"><%=article.getLogin()%></td>                               
                                            <td><input value="<%=article.getId()%>" hidden="" name="listType"><%=tpa.getDescription()%></td>

                                            <td>
                                                <div class="btn-group" role="group">
                                                    <button class="editarticle btn btn-primary" type="button" style="border-radius:5px;margin-right: 2%;border-style: none;background: #e9820a;width: 100%;height: 100%;text-align: center;" data-bs-toggle="modal" data-idart="<%=article.getId()%>" data-designation="<%=article.getFullname()%>" data-reference="<%=article.getFullname()%>" data-matricule="<%=article.getLogin()%>" data-userrole="<%=article.getIdRole()%>" data-bs-target="#modal-editart" ><img src="assets/img/icons8-edit-24.png">Modifier</button>
                                                    <button class="deletearticle btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-4" type="button" style="display:none;margin-right: 2%;border-style: none;background: rgb(255,89,66);width: 0%;height: 100%;text-align: center;" data-idart="<%=article.getId()%>" ><img src="assets/img/icons8-delete-24.png">Supprimer</button>
                                                </div>
                                            </td>
                                        </tr>

                                        <% } %>                                  
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div> 
                </div>  <% con.close ();%>                                 
                <footer class="bg-white sticky-footer">
                    <div class="container my-auto">
                        <div class="text-center my-auto copyright"><span>Copyright® SPAT 2023</span></div>
                    </div>
                </footer>
                <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
            </div>
        </div> 
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
