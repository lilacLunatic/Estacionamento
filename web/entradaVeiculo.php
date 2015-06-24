<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	echo $_SESSION['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    echo $veiculo->getPlaca();
    if(!is_null($veiculo)){

        if($veiculoDao->checkEntrada($_SESSION['placa'])){
            $veiculoDao->saidaVeiculo($veiculo);
        }else{
            //logica do veiculo entrando aqui
        }
    
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>