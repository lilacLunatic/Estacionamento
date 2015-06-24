<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	echo $_SESSION['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    echo $veiculo['placa'];
    if(!is_null($veiculo)){

        if($veiculoDao->checkEntrada($_SESSION['placa'])){
            //logica do carro saindo aqui
        }else{
            //logica do carro entrando aqui
        }
    
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>