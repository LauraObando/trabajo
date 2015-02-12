<?php
//Datos para conexión//
$host="localhost";
$user="root";
$password="";
$db="basedatos";
//Creo una variable conexión//
$con=mysqli_connect($host,$user,$password)or die("problemas al conectar");
//Selecciono la base de datos//
mysqli_select_db($con,$db)or die("probelmas al seleccionar la base de datos");

//include 'connection.php'; en otro archivo que necesite llamarlo//

?>