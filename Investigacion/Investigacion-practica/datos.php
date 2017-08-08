<?php
	// ================ Variables que Recibo por el metodo GET ===================
	$nUsuarioAux = $_GET['nomUsuario'];
	// ==================== Fin de variables de Metodo GET =======================

	// ================= Respuestas P/ Dispunibilidad de nombre ==================
	$res['si'] = '<div style="text-align:center;" class="text-error">El nombre de usuario ya existe en la BBDD</div>';
	$res['no'] = '<div style="text-align:center;" class="text-success">El nombre de usuario esta disponible</div>';
	// ================================== Fin ====================================

	// ================================= Datos ===================================
	$usuarios = array();
	$usuarios = [
		['alias' => 'sansa', 'nombre' => 'Sansa', 'apellido' => 'Stark', 'email' => 'sstark@ejemplo.com', 'dni' => '12345678'],
		['alias' => 'astark', 'nombre' => 'Arya', 'apellido' => 'Stark', 'email' => 'noname@ejemplo.com', 'dni' => '23456789'],
		['alias' => 'DAW', 'nombre' => 'Diseño y Aplicaciones en la Web', 'apellido' => 'Ninguno', 'email' => 'daw@ejemplo.com', 'dni' => '345678912'],
		['alias' => 'ynnjs', 'nombre' => 'John', 'apellido' => 'Snow', 'email' => 'ynnjs@ejemplo.com', 'dni' => '456789123']];
	// =============================== Fin Datos =================================

	foreach ($usuarios as $key => $value) {
		$existe = ($nUsuarioAux == $usuarios[$key]['alias']);
		if ($existe) {
			break;
		}
	}
	// sleep(3);
	if ($existe) {
		echo $res['si'];
	} else {
		echo $res['no'];
	}
?>
