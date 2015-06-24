<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../dao/FuncionarioDao.php";
$login = $_POST['login'];
$senha = $_POST['senha'];
$admin = isset($_POST['admin']) ? true : false;

$fDao = new FuncionarioDao();
if($fDao->autentica($login, $senha, $admin)){
	session_start();
	$_SESSION['login'] = $login;
	$_SESSION['admin'] = $admin;
	if($_SESSION['admin']){
		//header('location: menuAdmin.php');
	}else{
		header('location: ../view/menu.html');
	}

}else{
	header('location: ../view/index.html');
}


?>