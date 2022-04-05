<%@page import="java.util.HashMap"%>
<%@page import="model.Plat"%>
<%@page import="model.Plat"%>
<%@page import="model.DetailsCommande"%>
<%
    DetailsCommande[] livraisonInterne = (DetailsCommande[]) request.getAttribute("livraisonInterne");
    DetailsCommande[] livraisonExterne = (DetailsCommande[]) request.getAttribute("livraisonExterne");
    HashMap<String, Plat> listePlatParId = (HashMap<String, Plat>) request.getAttribute("listePlatParId");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/regis-cuisine.css">
    <title>Document</title>
</head>

<body>
    <div class="main">
       
        <div class="mainContainer">
            <h1 class="mainTitre">
                Livraison
            </h1>
            <h2 class="sectionTitre">
                Livraison sur place (Table)
            </h2>
            <!-- PLAT MBOLA TSY NORAISIN'NY SERVEUR -->
            <div class="listePlat">
                <% for(DetailsCommande d: livraisonInterne) { %>
                    <div class="cardPlat">
                        <div class="photo">
                            <img src="images/img/huitre.jpg" height="300" alt="">
                        </div>
                        <div class="nom"><%=listePlatParId.get(d.getIdPlat()).getNom()%></div>
                        <div class="metadata">
                            <div class="categorie">
                               Table
                            </div>
                            <div class="prix">T12</div>
                        </div>

                        <div class="buttons">
                            <button class="ajout">Livrer</button>
                        </div>
                    </div>
                <% } %>
            </div>
            <h2 class="sectionTitre">
                Livraison externe 
            </h2>
            <!-- PLAT MBOLA TSY NORAISIN'NY SERVEUR -->
            <div class="listePlat">
                <div class="cardPlat">
                    <div class="photo">
                        <img src="images/img/huitre.jpg" height="300" alt="">
                    </div>
                    <div class="nom">Nom plat</div>
                    <!-- SI  LIVRAISON A DOMICILE -->
                    <div class="metadata">
                        <div class="categorie">
                           Adresse
                        </div>
                        <div class="prix">Analakely</div>
                    </div>
                    <div class="buttons">
                        <button class="ajout">Livrer</button>
                    </div>
                </div>
            </div>
           
        </div>
    </div>

</body>

</html>