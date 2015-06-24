<?php 
	session_start();
	$_SESSION['placa'] = $_POST['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($_SESSION['placa']);
    if(!is_null($veiculo)){

        if($veiculoDao->checaEntrada($_SESSION['placa'])){
            $veiculoDao->saidaVeiculo($veiculo);
        }else{
<<<<<<< HEAD
            
            //$veiculoDao->entradaVeiculo($veiculo);

=======
            $veiculoDao->entradaVeiculo($veiculo);
>>>>>>> 6dd2627a2cc8fe8bb7faf9bebfa5b1aef5d0bd10
        }
    
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>