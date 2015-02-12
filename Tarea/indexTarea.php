<?php 
	include_once 'includes/connection.php'; //INCLUYO ARCHIVO DE CONEXIÓN
	$query = "SELECT * FROM materia ORDER BY idMateria ASC";
	$resultQuery = mysqli_query($con,$query);
?>

<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
	<form action="consulta_materias.php" method ="post">
	<select name="materia">
	<?php
	while ($row= mysqli_fetch_array($resultQuery)){
		
		echo"<option value=' ".$row['idMateria']."'>".$row['nombreMateria']."</option>";


		}
	
		?>

	</select>
	<input type="submit" value="Enviar">
	</form>
	</body>
	</html>

	