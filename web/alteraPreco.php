<?php 
	include_once "../dao/VeiculoDao.php";
	$veiculoDao = new VeiculoDao();
	$veiculoDao->alteraPreco($_POST['id'], $_POST['preco']);
	header("Location: templateMenuAdmin.php");
 ?>