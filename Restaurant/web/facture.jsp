<%@page import="model.Tables"%>
<%@page import="model.Plat"%>
<%@page import="model.DetailsCommande"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.AdditionParTable"%>
<%@page import="model.Commande"%>
<%@page import="java.util.Vector"%>
<%
    Vector<AdditionParTable> listeCommande = (Vector<AdditionParTable>) request.getAttribute("listeAddition");
    HashMap<String, Vector<DetailsCommande>> listeDetailsCommande = (HashMap<String, Vector<DetailsCommande>>) request.getAttribute("listeDetailsCommande");
    HashMap<String, Plat> listePlat = (HashMap<String, Plat>) request.getAttribute("listePlat");
    Vector<Tables> listeTables = (Vector<Tables>) request.getAttribute("listeTables");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/liste-plat.css">
    <link rel="stylesheet" href="styles/facture.css">
    
    <link rel="stylesheet" href="bootstrap-4.3-2.1-dist/css/bootstrap.css">
    <title>Document</title>
</head>

<body>
    <div class="main">
        <div class="navBar">
            <div class="TitleNav">
                <img src="images/fourchette.png" width="50" alt="">
                <span class="navTitle">Foodies</span>
            </div>
            <div class="listeBar">
                <ul>
                    <li class="li-nav"> <img src="images/daily-specials-board.png" height="30" alt=""> Carte</li>
                    <li class="li-nav"> <img src="images/credit.png" height="30" alt=""> Payement</li>
                    <li class="li-nav"> <img src="images/delivery-man.png" height="30" alt=""> Livraison</li>
                </ul>
            </div>
           
        </div>
        <div class="mainContainer">
            <div class="filtre">
               
                <h2>Filtre</h2>
                <div class="formulaire">
                    <form action="Addition">
                        <p>
                            <label for="table">Table:</label>
                            <select name="numTable" id="table">
                                <option value="all">all</option>
                                <% for(Tables t: listeTables) { %>
                                <option value="<%=t.getId()%>"><%=t.getNom()%></option>
                                <% } %>
                            </select>
                        </p>
                        <p>
                            <input type="submit" value="Voir Addition">
                        </p>
                    </form>

                </div>
            </div>
            <% for(AdditionParTable c: listeCommande) { %>
                <div class="facture">
                    <h2>Facture <%=c.getIdCommande()%></h2>
                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Plat</th>
                                <th scope="col">Prix Unitaire</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% Vector<DetailsCommande> plats = listeDetailsCommande.get(c.getIdCommande()); %>
                            <% for(DetailsCommande plat: plats) { %>
                                <tr>
                                    <th scope="row"><%=listePlat.get(plat.getIdPlat()).getNom()%></th>
                                    <td><%=plat.getPrix()%></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <div class="total-adition">
                        <span>
                            Total:
                        </span>
                        <span>
                            <%=c.getTotal()%> Ar
                        </span>
                    </div>
                </div>
            <% } %>

        </div>
    </div>

</body>

</html>