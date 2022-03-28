<%-- Document : liste-plat Created on : 22 mars 2022, 10:27:41 Author : TiavinaJoy --%>

    <%@page import="model.Plat" %>
        <%@page import="java.util.Vector" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <% Vector<Plat> listePlat = (Vector<Plat>) request.getAttribute("listePlat");
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
                                        <h1>
                                            Filtre
                                        </h1>
                                        <div class="formulaire">
                                            <form action="" method="">
                                                <table>
                                                    <tr>
                                                        <td><label for="categorie">Categorie:</label></td>
                                                        <td>
                                                            <select name="" id="">
                                                                <option value="">-</option>
                                                                <option value="">Dessert</option>
                                                                <!-- <option value=""></option> -->
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>

                                        </div>
                                    </div>
                                    <div class="listePlat">
                                            <% for(Plat p: listePlat) { %>
                                            <div class="cardPlat">
                                                <div class="photo">
                                                    <img src="images/img/huitre.jpg" height="300" alt="">
                                                </div>
                                                <div class="nom">
                                                    <%= p.getNom() %>
                                                </div>
                                                <div class="metadata">
                                                    <div class="categorie">
                                                        <img src="images/ice-cream.png" width="20" alt=""> categorie
                                                    </div>
                                                    <div class="prix">
                                                        <%= p.getPrix() %>$
                                                    </div>
                                                </div>
                                                <div class="buttons">
                                                    <button class="ajout">Commander</button>
                                                </div>
                                            </div>
                                            <% } %>
                                    </div>
                                    
                                </div>
                            </div>
                        </body>

                        </html>