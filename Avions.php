<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des vols</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <h1>Gestion des vols</h1>

    <form method="GET" action="getAvion.php">
        <label for="statut">Choisissez un statut de vol :</label>
        <select name="statut" id="statut" onchange="this.form.submit()">
            <option value="enVol">Les avions qui sont en vol</option>
            <option value="atterri">Les avions qui ont atterri</option>
        </select>
    </form>
    <input type="button" value="retour"/>
</body>
</html>