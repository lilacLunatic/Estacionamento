<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    if(!is_null($veiculo)){

    	echo 'foi';
    }else{
    	header('Location: ../view/cadastroVeiculos.html');
    }
 ?>