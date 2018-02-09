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
 
$sql =  "UPDATE notas SET Nota = '$nota' WHERE Alumno = '$nombre' AND Asignatura = '$asig' AND Trimestre = '$trim';";

if ($conn->query($sql) === TRUE) {
    echo "Nota modificada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
