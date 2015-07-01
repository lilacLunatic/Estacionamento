<?php 
	include_once "../dao/VeiculoDao.php";
	include_once "../model/Veiculo.php";
	$marca = $_POST['marca'];
	$placa = $_POST['placa'];
	$modelo = $_POST['modelo'];
	$cor = $_POST['cor'];
	$tipo = $_POST['tipo'];


	$veiculo = new Veiculo($placa, $tipo, $marca, $modelo, $cor);
	$veiculoDao = new VeiculoDao();

	$veiculoDao->add($veiculo);

?>