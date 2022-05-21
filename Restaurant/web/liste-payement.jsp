<%@page import="java.util.Set"%>
<%@page import="model.PayementCommande"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap<String, List<PayementCommande>> listePayement = (HashMap<String, List<PayementCommande>>) request.getAttribute("listePayement");
    HashMap<String, Double> listeTotal = (HashMap<String, Double>) request.getAttribute("listeTotal");
    String[] keys = listePayement.keySet().toArray(new String[listePayement.size()]);   
    String dateDebut = (String) request.getAttribute("dateDebut");
    String dateFin = (String) request.getAttribute("dateFin");
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
                    <form action="">
                        <!-- <p>
                            <label for="type">Mode de payement:</label>
                            <select name="type" id="type">
                                <option value="">Espece</option>
                                <option value="">Mobile money</option>
                                <option value="">Carte bancaire</option>
                            </select>
                        </p> -->
                        <p>
                            <label for="dateDebut">Date debut:</label>
                            <input type="date" name="dateDebut" id="dateDebut">
                        </p>
                        <p>
                            <label for="dateDebut">Date fin:</label>
                            <input type="date" name="dateFin" id="dateDebut">
                        </p>
                        <p>
                            <input type="submit" value="Voir les payements">
                        </p>
                    </form>
                </div>
            </div>
            <div class="facture">
                <h2>
                    Liste des payements :<span class="daty"> <%= dateDebut.replace('-', '/') %> </span> -
                     <span class="daty"> <%= dateFin.replace('-', '/') %> </span>
                </h2>
                <% for(String key: keys) { %>
                <h3><%= listePayement.get(key).get(0).getNomType() %></h3>
                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Table</th>
                                <th scope="col">Date de payement</th>
                                <th scope="col">Montant</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(PayementCommande p: listePayement.get(key)) { %>
                                <tr>
                                    <th scope="row"><%= p.getNumTable() %></th>
                                    <td><%= p.getDatePayement().toGMTString() %></td>
                                    <td><%= p.getMontant() %> Ar</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <div class="total-adition">
                        <span>
                            Total:
                        </span>
                        <span>
                            <%= listeTotal.get(key) %> Ar
                        </span>
                    </div>
                <% } %>
                    
            </div>

        </div>
    </div>

</body>

</html>