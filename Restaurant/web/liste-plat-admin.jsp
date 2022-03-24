<%@page import="java.util.HashMap"%>
<%@page import="model.Plat"%>
<%@page import="model.Plat"%>
<%@page import="model.PrixRevient"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<%
    Vector<PrixRevient> listePrixRevient = (Vector<PrixRevient>) request.getAttribute("listePrixRevient");
    HashMap<String, Plat> listePlatParId = (HashMap<String, Plat>) request.getAttribute("listePlatParId");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Restaurant/styles/liste-plat.css">
    <link rel="stylesheet" href="/Restaurant/bootstrap-4.3-2.1-dist/css/bootstrap.css">
    <title>Document</title>
</head>

<body>
    <div class="main">
        <div class="navBar">
            <div class="Title">
                <img src="/Restaurant/images/fourchette.png" width="50" alt="">
                <span class="nav">Foodies</span>
            </div>
            <div class="listeBar">
                <ul>
                    <li class="li-nav"> <img src="/Restaurant/images/daily-specials-board.png" height="30" alt=""> Carte</li>
                    <li class="li-nav"> <img src="/Restaurant/images/credit.png" height="30" alt=""> Payement</li>
                    <li class="li-nav"> <img src="/Restaurant/images/delivery-man.png" height="30" alt=""> Livraison</li>
                </ul>
            </div>
        </div>
        <div class="mainContainer">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Plat</th>
                        <th scope="col">Prix de vente</th>
                        <th scope="col">Prix de revient</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(PrixRevient p: listePrixRevient) { %>
                        <tr>
                            <td><%=listePlatParId.get(p.getIdPlat()).getNom()%></td>
                            <td><%=listePlatParId.get(p.getIdPlat()).getPrix()%></td>
                            <td><%=p.getRevient()+" Ar"%></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
<script src="/Restaurant/bootstrap-4.3-2.1-dist/js/bootstrap.min.js"></script>
</body>

</html>