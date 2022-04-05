<%-- 
    Document   : liste-plat
    Created on : 22 mars 2022, 10:27:41
    Author     : TiavinaJoy
--%>

<%@page import="model.Serveur"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.DetailsCommande"%>
<%@page import="model.Plat"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HashMap<String, Plat> listePlat = (HashMap<String, Plat>) request.getAttribute("listePlat");
    String[] keys = listePlat.keySet().toArray(new String[listePlat.size()]);
    ServletContext context = request.getServletContext();
    Vector<DetailsCommande> listeDetailsCommande = (Vector<DetailsCommande>) context.getAttribute("listeDetailsCommande");
    Vector<Serveur> listeServeur = (Vector<Serveur>) request.getAttribute("listeServeur");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/liste-plat.css">
    <link rel="stylesheet" href="styles/panier.css">
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
            <div class="panier">
                <div class="titra">Vos Commandes </div>
                <div class="contenu-panier">
                    <div class="element-contenu-panier">
                        <% if(listeDetailsCommande != null) { %>
                            <% for(DetailsCommande dt: listeDetailsCommande) { %>
                            <p>
                                <span class="nomPlat"><%=listePlat.get(dt.getIdPlat()).getNom()%></span>
                                <span class="actions"> 
                                    <button class="ajout">supprimer</button>
                                </span>
                            </p>
                            <% } %>
                        <% } %>
                    </div>
                    <hr>
                    <a href="ValiderCommande">
                        <button class="ajout">Valider Commande</button>
                    </a>
                  
                    <a href="NewCommande?numTable=Table1&idServeur=serveur1">
                        <button class="ajout">Nouvelle Commande</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="mainContainer">
            <div class="filtre">
                 <!-- //////////////////////////////////////////////**********************/////////////// -->
            <!-- SERVEUR -->
            <table>
                <tr>
                    <td><label for="serveur">Serveur:</label></td>
                    <td>
                        <select name="serveur" id="serveur">
                            <option value="">-</option>
                            <% for(Serveur s: listeServeur) { %>
                                <option value="<%=s.getId()%>"><%=s.getNom()%></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
            </table>
            <!-- SERVEUR -->
                <h1>Filtre</h1>
                <div class="formulaire">
                    <form action="">
                        <table>
                            <tr>
                                <td><label for="categorie">Categorie:</label></td>
                                <td>
                                    <select name="" id="">
                                        <option value="">-</option>
                                        <option value=""> <img src="images/ice-cream.png" width="20" alt="">    Dessert</option>
                                        <!-- <option value=""></option> -->
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>

                </div>
            </div>
            <div class="listePlat">
                <% for(String key: keys) { %>
                <div class="cardPlat">
                    <div class="photo">
                        <img src="images/img/huitre.jpg" height="300" alt="">
                    </div>
                    <div class="nom"><%= listePlat.get(key).getNom() %></div>
                    <div class="metadata">
                        <div class="categorie">
                            <img src="images/ice-cream.png" width="20" alt=""> categorie
                        </div>
                        <div class="prix"><%= listePlat.get(key).getPrix() %>Ar</div>
                    </div>
                    <div class="buttons">
                        <a href="AjoutCommande?idPlat=<%=listePlat.get(key).getId()%>&prix=<%=listePlat.get(key).getPrix()%>"><button class="ajout">Commander</button></a>
                    </div>
                </div>
                <% } %>

            </div>

        </div>
    </div>

</body>

</html>