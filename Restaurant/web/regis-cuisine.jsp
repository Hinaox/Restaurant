<%@page import="java.util.HashMap"%>
<%@page import="model.Plat"%>
<%@page import="java.util.List"%>
<%@page import="model.DetailsCommande"%>
<%
    List<DetailsCommande> listeEnAttente = (List<DetailsCommande>) request.getAttribute("listeEnAttente");
    List<DetailsCommande> listeEnCours = (List<DetailsCommande>) request.getAttribute("listeEnCours");
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
                Régis cuisine
            </h1>
            <h2 class="sectionTitre">
                Libre
            </h2>
            <!-- PLAT MBOLA TSY NORAISIN'NY CUISINIER -->
            <div class="listePlat">
                <% for(DetailsCommande d: listeEnAttente) { %>
                    <div class="cardPlat">
                        <div class="photo">
                            <img src="images/img/huitre.jpg" height="300" alt="">
                        </div>
                        <div class="nom"><%=listePlatParId.get(d.getIdPlat()).getNom()%></div>
                        <div class="buttons">
                            <button class="ajout">Fabriquer</button>
                        </div>
                    </div>
                <% } %>
              
                

            </div>
            <!-- ******************************** -->
            <h2 class="sectionTitre">
                Plat en cous de fabrication
            </h2>
            <!-- PLAT EFA NORAISIN'CUISINIER ===>    MIANDRY COCHENA HOE EFA MASAKA -->
            <div class="listePlat">
                <% for(DetailsCommande d: listeEnCours) { %>
                    <div class="cardPlat">
                        <div class="photo">
                            <img src="images/img/macaron.jpg" width="300" alt="">
                        </div>
                        <div class="nom"><%=listePlatParId.get(d.getIdPlat()).getNom()%></div>

                        <div class="buttons">
                            <button class="ajout">Prêt</button>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </div>

</body>

</html>