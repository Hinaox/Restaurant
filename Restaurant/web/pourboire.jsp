<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-4.3-2.1-dist/css/bootstrap.css">
    <link rel="stylesheet" href="styles/pourboire.css">
    <link rel="stylesheet" href="styles/liste-plat.css">
    <title>Document</title>
</head>

<body>
    <script src="bootstrap-4.3-2.1-dist/js/bootstrap.min.js"></script>

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
            <div class="selecteur">
                <form action="#" method="GET">
                    <p>
                        Serveur : 
                        <select name="serveur" id="serveur">
                            <option value="">all</option>
                            <option value=""></option>
                            <option value=""></option>
                        </select>
                    </p>
                    <p>
                        Date 1:
                            
                            <input type="date" name="date1" id="date1">
                    </p>
                    <p>
                        Date 2:
                            <input type="date" name="date2" id="date2">
    
                    </p>
                    <input type="submit" value="chercher">
                </form>
               
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Serveur</th>
                        <th scope="col">Pourboire</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>430</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>430</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td colspan="2">430</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>