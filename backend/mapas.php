<?php

$servername="localhost";
$username="root";
$password="";
$dbname="incidencia";

$conn=new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error){
	die("Connection Failed".$conn->connect_error);
}else{
	
}
//tbala de base de datos de prueba, cambiar campos al cambiar de base
$query = "SELECT * FROM establecimientos;";
$result = mysqli_query($conn,$query);

if (!$result) {
    die('Invalidproyecto query: ' . mysqli_error());
}

header("Content-type: text/xml");

echo "<?xml version='1.0' ?>";
echo '<markers>';

$ind=0;

while ($row = @mysqli_fetch_assoc($result)){
//obtencion de marcadores con los datos de la base de dato para ser insertados en el mapa
  echo '<marker ';
  echo 'idmapa="' . $row['id'] . '" ';
  //echo 'ubicacion="' . $row['ubicacion'] . '" ';
  echo 'lat="' . $row['latitud'] . '" ';
  echo 'lng="' . $row['longitud'] . '" ';
  echo '/>';
  $ind = $ind + 1;
}

echo '</markers>';
?>