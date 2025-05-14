<?php
    session_start();

    function tentativeLogin(){
      
        $identifiant = $_POST["nom"];
        $motDePasse = hash("sha256", $_POST["mdp"]);
                
        $liaison = mysqli_connect("localhost", "root", "", "Aeroport") or exit(mysqli_error());

        
        $requete = "SELECT * FROM employer WHERE first_name = '$identifiant' AND mdp = '$motDePasse'";
        $resultat = mysqli_query($liaison, $requete);
        $resultat = mysqli_fetch_assoc($resultat);

        if ($resultat["id"] != false){
            header("location:"."./index.php");
        } else {
            header("Location:"."./login.php"."?logfailed=true");
        }

    }
   ?>