<?php
    session_start();

    function tentativeLogin(){
      
        $identifiant = $_GET["identifiant"];
        $motDePasse = hash("sha256", $_GET["motDePasse"]);

        
        $liaison = mysqli_connect("localhost", "root", "", "Aeroport") or exit(mysqli_error());

        
        $requete = "SELECT * FROM employe WHERE mail = '$identifiant' AND mdpHache = '$motDePasse'";
        $resultat = mysqli_query($liaison, $requete);
        $resultat = mysqli_fetch_assoc($resultat);

        if ($resultat["idEmploye"] != false){
            header("location:"."http://localhost/SiteAeroport/index.php");
        } else {
            header("Location:"."http://localhost/SiteAeroport/login.php"."?logfailed=true");
        }
    }
   ?>