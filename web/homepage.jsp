<%-- 
    Document   : homepage
    Created on : 28 janv. 2026, 10:48:42
    Author     : PC
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.V_PercentBudget_actuel"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="service.Service_annee"%>
<%@page import="model.Annee"%>
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
        <title>Homepage</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu-user.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <jsp:include page="header.jsp"/>

                    <div class="container-fluid">
                        <h3 style="text-align: center;margin-bottom: 2%;">Tableau de bord - <%
                            String monthName = LocalDate.now().getMonth().getDisplayName(TextStyle.FULL, Locale.FRENCH);
                            int an = LocalDate.now().getYear();
                            out.println(monthName + " " + an);
                            %>
                        </h3>
                        <div class="row">
                            <%
                                Annee taona = Service_annee.findAnnee("annee5");//java.time.Year.now().getValue();
                                int annee = taona.getValeur();

                                String json = request.getAttribute("data_percent").toString();
                                Gson gson = new Gson();
                                V_PercentBudget_actuel[] datas = gson.fromJson(json, V_PercentBudget_actuel[].class);
                                DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.FRANCE);
                                DecimalFormat df = new DecimalFormat("#,##0.00", symbols);

                            %>

                            <% //check user type  
                                if (session.getAttribute("userType") != null) {
                                    final String USER_TYPE = session.getAttribute("userType").toString().toLowerCase();
                                    if (USER_TYPE.equals("dg") || USER_TYPE.equals("admin")) {
                            %>
                            <div class="card bg-light mb-3 col-lg col-md" style="width: flex 0 0 28%; margin-right: 1%;">
                                <h5 class="card-header">FINANCES</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_FIN")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>
                            <div class="card bg-light mb-3 col-lg  col-md " style="width: flex 0 0 28%;margin-right: 1%;">
                                <h5 class="card-header">OPERATIONS</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_OP")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>  
                            <div class="card bg-light mb-3  col-lg col-md " style="width: flex 0 0 28%;margin-right: 1%;">
                                <h5 class="card-header">RESSOURCES HUMAINES</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_RH")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>  

                            <%
                            } else if (USER_TYPE.equals("rh") || USER_TYPE.equals("voletrh")) {
                                //rh data
                            %>
                            <div class="card bg-light mb-3  col-lg col-md " style="width: flex 0 0 28%;margin-right: 1%;">
                                <h5 class="card-header">RESSOURCES HUMAINES</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_RH")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>
                            <%
                            } else if (USER_TYPE.equals("fin")) {
//fin data
                            %> 
                            <div class="card bg-light mb-3 col-lg col-md" style="width: flex 0 0 28%; margin-right: 1%;">
                                <h5 class="card-header">FINANCES</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_FIN")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>
                            <%
                            } else if (USER_TYPE.equals("op")) {
//op data
                            %> 
                            <div class="card bg-light mb-3 col-lg  col-md " style="width: flex 0 0 28%;margin-right: 1%;">
                                <h5 class="card-header">OPERATIONS</h5>
                                <div class="card-body" style="padding: 0px;">
                                    <table border="1" style="width:100%;border:0px;line-height: 2.5;margin-top: 7.5%;font-size: 0.95em;">
                                        <tr>
                                            <th></th>
                                            <th>En cours</th>
                                            <th>%Budget</th>
                                            <th>%N-1</th>
                                        </tr>
                                        <%     for (V_PercentBudget_actuel item : datas) {
                                                if (item.getActivite_lib().equals("ACT_OP")) {
                                        %>
                                        <tr>
                                            <td><%out.print(item.getGroupe_rub_lib());%></td>
                                            <td><%out.print(df.format(item.getRealisation()));%></td>
                                            <td><%out.print(item.getPourcentage_budget());%></td>
                                            <td><%out.print(item.getPourcentage_anterieur());%></td>
                                        </tr>
                                        <%         }
                                            }%>
                                    </table>


                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>            
                    </div>
                </div> 
            </div> 
        </div>    
    </body>
</html>
