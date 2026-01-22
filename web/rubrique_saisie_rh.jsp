<%-- 
    Document   : rubrique_saisie_rh
    Created on : 16 janv. 2026, 15:14:19
    Author     : PC
--%>

<%@page import="model.V_rubrique_saisie"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="model.Rubrique_saisie"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>VOLET RH SAISIE</h1>
        <%
            int annee = java.time.Year.now().getValue();

            String json = request.getAttribute("rh_data").toString();
            Gson gson = new Gson();
            V_rubrique_saisie[] rubriques = gson.fromJson(json, V_rubrique_saisie[].class);
            //Rubrique_saisie rub = new Rubrique_saisie();
        %>
        <form action="monServlet" method="post">
            <table border="1">
                <tr>
                    <th>Description</th>
                    <th><% out.println(annee - 3);%></th>
                    <th><% out.println(annee - 2);%></th>
                    <th><% out.println(annee - 1);%></th>
                </tr>
                <%     for (V_rubrique_saisie item : rubriques) {%>
                <tr>
                    <td><input type="text" name="nom" value="<%out.print(item.getDesignation());%>"></td>
                    <td><input type="number" name="age"></td>
                    <td><input type="text" name="ville"></td>
                    <td><input type="text" name="ville"></td>
                </tr>
                <%     }%>
            </table>

            <button type="submit">Mettre à jour</button>
        </form>
    </body>
</html>
