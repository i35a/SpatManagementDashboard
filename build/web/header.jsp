<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
    <div class="container-fluid">
        <form action="Auth" method="post" style="width: 100%;display:flex;justify-content:space-between;align-items:flex-end;">
            <div><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            </div>
            <div>
                <% //check user type  
                    if (session.getAttribute("userType") != null) {
                        final String USER_TYPE = session.getAttribute("userType").toString().toLowerCase();
                %> 
                <span><i class="fa fa-user"></i>&nbsp;<%=USER_TYPE%>&nbsp;</span>
                <%
                    }
                %>
                <button class="btn btn-danger " id="logout" name="logout" type="submit" style="font-size:0.7em !important;"><i class="fas fa-power-off"></i> Deconnexion</button>
            </div>
        </form>     
    </div>
</nav>