<?php
function connectDB() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "aeroport";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

$statut = $_GET['statut'] ?? '';

if ($statut === 'enVol') {
    $filtre = "WHERE libelStatut = false";
} elseif ($statut === 'atterri') {
    $filtre = "WHERE libelStatut = true";
} else {
    $filtre = "";
}

$conn = connectDB();
$sql = "SELECT * FROM avions $filtre";
$result = $conn->query($sql);
