<?php
    session_start();
?>
<html>
    <head>
        <title>Gestion aéroporturaire - Page login</title>
        <meta charset="utf-8">
        <link href="styles.css" rel="stylesheet">
    </head>
    <body>
        <section id="pageLogin">
            <h1>Connexion</h1>
            <div id="containerLogin">
                <form action="connection.php" method="POST">
                    <input class="inputLogin" type="text" name="nom" id="nom" placeholder="ton nom" required>
                    <input class="inputLogin" type="password" name="mdp" id="mdp" placeholder="Mot de passe" required>
                    <input class="boutonValider" name="boutonValider" type="submit" value="Valider">
                </form>
            </div>
        </section>
        <?php
            if(isset($_GET) && isset($_GET["logfailed"])){
            echo("
                <section id='pageLogin'>
                    <div class='erreurLogin'>
                        <p>Connexion impossible</p>
                        <p>Veuillez réessayer</p>
                    </div>
                </section>
                ");}
        ?>
    </body>
</html>
