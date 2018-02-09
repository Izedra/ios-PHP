<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
	
	
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ios";

$nombre = $_POST["nomalu"];
$asig = $_POST["asig"];
$nota = $_POST["nota"];
$trim = $_POST["trim"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Conexion fallida: " . $conn->connect_error);
}
 
$sql =  "INSERT INTO notas VALUES ('$nombre', '$asig', '$nota', '$trim');";

if ($conn->query($sql) === TRUE) {
    echo "Nota registrada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
