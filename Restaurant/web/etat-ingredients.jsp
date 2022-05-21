<%@page import="java.util.List"%>
<%@page import="model.EtatIngredient"%>
<%
    List<EtatIngredient> listeIngredients = (List<EtatIngredient>) request.getAttribute("listeEtat");
    double prix = (double) request.getAttribute("totalPrix");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/liste-plat.css">
        <link rel="stylesheet" href="styles/ingredient-utilise.css">
        <!-- <link rel="stylesheet" href="styles/panier.css"> -->

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
                <div class="containerIngredient">
                    <h2 class="sectionTitle">Ingredients utilisés;</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Ingredient</th>
                                <th scope="col">Quantite restant</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (EtatIngredient utilisation : listeIngredients) {%>
                            <tr>
                                <th scope="row"><%=utilisation.getNom()%></th>
                                <td><%=utilisation.getQuantite()%> g</td>
                            </tr>
                            <% }%>
                            <tr>
                                <th></th>
                                <th></th>
                                <th scope="row">Total</th>
                                <th><%= prix%> Ar</th>

                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

    </body>

</html>