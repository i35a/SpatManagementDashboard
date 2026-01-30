<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0 sidebar-stock">
    <div class="container-fluid d-flex flex-column p-0">
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
            <img src="assets/img/Logo.png" style="margin-top: 11%;">
            <div class="sidebar-brand-icon rotate-n-15"></div>
            <div class="sidebar-brand-text mx-3" style="margin-top: 20%;">
                <span>DASHBOARD</span> 
            </div>
        </a>
        <hr class="sidebar-divider my-0">
        <hr id="sep">
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item"></li>
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="homepage">
                    <i class="fas fa-user"></i><span> Tableau de bord</span>
                </a></li>
                <% //check user type  
                    if (session.getAttribute("userType") != null) {
                        final String USER_TYPE = session.getAttribute("userType").toString().toLowerCase();
                        if (USER_TYPE.equals("dg")) {
//menu dg             
                %>
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_rh">
                    <i class="fas fa-user"></i><span> Ressources Humaines</span>
                </a></li>
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_op">
                    <i class="fas fa-user"></i><span> Opérations</span>
                </a></li> <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_fin">
                    <i class="fas fa-user"></i><span> Finances</span>
                </a></li>
                <% } else if (USER_TYPE.equals("rh") || USER_TYPE.equals("voletrh")) {
//menu rh only
                %>
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_rh">
                    <i class="fas fa-user"></i><span> Ressources Humaines</span>
                </a></li>
                <%
                } else if (USER_TYPE.equals("op")) {
                    //menu op only
                %>
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_op">
                    <i class="fas fa-user"></i><span> Opérations</span>
                </a></li>
                <%
                } else if (USER_TYPE.equals("fin")) {
                    //menu fin only
                %> 
            <li class="nav-item menu"><a class="nav-link" id="chatBot" href="rubrique_fin">
                    <i class="fas fa-user"></i><span> Finances</span>
                </a></li>
                <%
                        }
                    }
                %> 

            <li class="nav-item menu">
                <!--                
                <a class="nav-link" id="chatBot" href="ControllerChatBot">
                                    <i class="fas fa-robot"></i><span> ChatBot</span>
                                </a>
                -->

            </li> 
        </ul>
    </div>
</nav>
