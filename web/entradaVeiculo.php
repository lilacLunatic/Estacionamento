<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	echo $_SESSION['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    echo $veiculo['placa'];
    if(!is_null($veiculo)){
    	echo 'foi';
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>