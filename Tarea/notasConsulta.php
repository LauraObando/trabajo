<?php

include "includes/connection.php";
$idMateria=$_POST['materia'];
$idEstudiante=$_POST['estudiantes'];

//echo $idMateria;//eco es para imprimir en pantalla en la pantalla que necesito//
$query= "SELECT * FROM estudiantes 
			INNER JOIN notaestudiante ON estudiantes.idEstudiantes = notaestudiante.idEstudiante_dos
			INNER JOIN nota            ON nota.idNota             = notaestudiante.idNota
			INNER JOIN materia          ON materia.idMateria      = notaestudiante.idMateria_dos WHERE materia.idMateria=$idMateria AND estudiantes.idEstudiantes=$idEstudiante";

$resultQuery= mysqli_query($con,$query);

//e.nombre,e.codigoEstudiante, e.idEstudiantes,en.idEstudiante_dos, n.idNota,en.idNota,c.idMateria,en.idMateria_dos//

?>

<!DOCTYPE html>
<html>
	<head>
		<title> Consulta Notas</title>
	</head>

	<body>

	<table border="1">

	<tr>
		<td>Nombre de la nota</td> 
		<td>Nota</td>
		<td>porcentajeNota</td>
		<td>calculo</td>

		</tr>

	<?php
	$aumento=0;
	$nombreEstudiante;
	
	while($row=mysqli_fetch_array($resultQuery)){

		$nombre=$row[ "nombre"];
		$nombreCurso=$row["nombreMateria"];
		echo"

		<tr>
		<td>".$row["nombreMateria"]."</td>
       <td>".$row["valor"]."</td>
       <td>".$row["porcentaje"]."</td>
       <td>".$row["valor"]*$row['porcentaje']."</td>

		</tr>
		";
		$aumento++;
		$notasCantidad[$aumento]=$row["valor"]*$row["porcentaje"];

	}
	?>

	
		</table>


<?php
           echo $nombreCurso.":";
          if($idMateria==2){
          	echo $notasCantidad[1]+$notasCantidad[2];
          } else{
          	echo $notasCantidad[1]+$notasCantidad[2]+$notasCantidad[3];
          }
          echo "<br>";
          echo $nombre;
      

       ?>

	</select>
	
	</body>
	</html>

