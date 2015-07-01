<?php 
    session_start();
	$placa = $_POST['placa'];
	include "../dao/VeiculoDao.php";
    $veiculoDao = new VeiculoDao();
    $veiculo = $veiculoDao->getByPlaca($placa);
    $_SESSION['placa'] = $placa;    


    if(!is_null($veiculo)){

        if($veiculoDao->checaEntrada($placa)) {
            $veiculoDao->saidaVeiculo($veiculo);
        }else{
            if($veiculoDao->entradaVeiculo($veiculo)){
                header('Location: templateEntrada.php');
            }else{
                header('Location: ../view/semVagas.html');
            }
        }
    
    }else{
    	header('Location: templateCadastroVeiculo.php');
    }
 ?>