<%@page import="model.Photo"%>
<%@page import="model.Ingredient"%>
<%@page import="model.Plat"%>
<%@page import="java.util.Vector"%>
<%
    Vector<Plat> plat = (Vector<Plat>) request.getAttribute("plat");
    Vector<Ingredient> listeIngredient = (Vector<Ingredient>) request.getAttribute("listeIngredient");
    Photo photo = (Photo) request.getAttribute("photo");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/liste-plat.css">
    <link rel="stylesheet" href="styles/fichePlat.css">
    
    <!-- <link rel="stylesheet" href="bootstrap-4.3-2.1-dist/css/bootstrap.css"> -->
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
           <h1 class="titrePlat"><%=plat.get(0).getNom()%></h1>
           <hr>
           <div class="metadata">
               <div class="imgContainer">
                   <img src="images/img/<%= photo.getNom() %>" height="620" alt="">
               </div>
               <div class="composant">
                   <h2 class="titreComposant"> Ingredients:</h2>
                   <div class="listeComposant">
                       <%
                           for(int i=0; i<listeIngredient.size(); i++){
                                if(i>0) out.print(",");
                                out.print(listeIngredient.get(i).getNom()+" ("+listeIngredient.get(i).getQte()+"g)");
                           }
                       %>
                       
                    </div>
                    <h2 class="titreComposant"> Prix:</h2>
                    <div class="listeComposant">
                        <%=plat.get(0).getPrix()%> Ar
                    </div>
               </div>
           </div>
        </div>
    </div>

</body>

</html>