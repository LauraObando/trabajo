<?php 
		include "includes/connection.php";
		$idMateria=$_POST['materia'];
        $query= "SELECT ec.idEstudiantes, e.nombre, e.codigoEstudiante FROM estudiantesmateria AS ec, estudiantes AS e WHERE ec.idEstudiantes=e.idEstudiantes AND ec.idMateria=".$idMateria;
        $resultQuery= mysqli_query($con,$query);

		while ($row = mysqli_fetch_array($resultQuery)) {
			echo "  
				<form action='notasConsulta.php' method='post'>
					<select name='estudiantes'>
						<option value='".$row['idEstudiantes']."'>".$row['nombre'] ."</option>
					</select>"

					." ".
					$row["codigoEstudiante"]
					." ".

				
					"<select name='materia'>
						<option value='".$idMateria."'></option>
					</select>"
					
					." ".
					
					"<input type='submit' value='Ver notas'>
				</form>
			"
			;
 		}
			
 ?>