<?php 
	session_start();
	
    require_once("../lib/Template.php");
    use raelgc\view\Template;
    include "../dao/VeiculoDao.php";
    
    $tpl = new Template("../view/saidaVeiculo.html");
    $veiculoDao = new VeiculoDao();
    $entrada = $veiculoDao->getEntrada($_SESSION['placa']);
 
    
        $tpl->PLACA = $entrada[0]['placa_veiculo'];
        $tpl->HORARIO_ENTRADA = $entrada[0]['hora_entrada'];
        $tpl->HORARIO_SAIDA = $entrada[0]['hora_saida'];
        $tpl->VALOR = $entrada[0]['valor'];       
    $tpl->show();
    
    


 ?>