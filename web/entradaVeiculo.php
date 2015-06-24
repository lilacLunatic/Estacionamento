<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	echo $_SESSION['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    if(!is_null($veiculo)){

        if($veiculoDao->checaEntrada($_SESSION['placa'])){
            $veiculoDao->saidaVeiculo($veiculo);
        }else{
            $veiculoDao->entradaVeiculo($veiculo);
        }
    
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>