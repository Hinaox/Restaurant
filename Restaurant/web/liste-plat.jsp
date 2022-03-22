<%-- 
    Document   : liste-plat
    Created on : 22 mars 2022, 10:27:41
    Author     : TiavinaJoy
--%>

<%@page import="model.Plat"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Vector<Plat> listePlat = (Vector<Plat>) request.getAttribute("listePlat");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/liste-plat.css">
    <title>Document</title>
</head>
   <body>
    <div class="mainContainer">
        <% for(int i=0; i<listePlat.size(); i++) { %>
            <div class="listePlat">
            <div class="cardPlat">
                <div class="nom"><%= listePlat.get(i).getNom() %></div>
            <div class="metadata">
                <div class="prix"><%= listePlat.get(i).getPrix() %>$</div>
            </div>
        </div>
        <% } %>
    </div>
    </div>
</body>
</html>
