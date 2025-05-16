<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Liste des vols</title>
</head>
<body>
<?php
include_once("fonctionPhp.php");



if ($result->num_rows > 0) {
    echo "<table border='1'>";
    echo "<tr><th>Num Vol</th><th>Départ</th><th>Arrivée</th><th>Avion</th><th>Compagnie</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
       <td>{$row['numVol']}</td>
       <td>{$row['heureDepart']}</td>
        <td>{$row['heureArrivee']}</td>
        <td>{$row['idAvion']}</td>
        <td>{$row['idCompagnie']}</td>
        </tr>";
    }
    echo "</table>";
} else {
    echo "Aucun avion trouvé pour ce statut.";
}

$conn->close();
echo '<br><button onclick="history.back()">Retour</button>';
?>