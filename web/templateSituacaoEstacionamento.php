<?php 

	require_once("../lib/Template.php");
    use raelgc\view\Template;
    include "../dao/VeiculoDao.php";

    $tpl = new Template("../view/situacaoEstacionamento.html");
    $veiculoDao = new VeiculoDao();
    
    $vagas = $veiculoDao->getVagasLivres();
    foreach($vagas as $vaga){
        $tpl->ANDAR_VAGA= $vaga['andar'];
        $tpl->NUMERO_VAGA = $vaga['numero'];
        $tpl->TIPO_VAGA = $vaga['tipo_vaga'];
        $tpl->block("BLOCK_VAGAS");
    }

    $entradas = $veiculoDao->getEntradas();
    foreach($entradas as $entrada){
        $tpl->PLACA= $entrada['placa_veiculo'];
        $tpl->ANDAR_VAGA = $entrada['andar_vaga'];
        $tpl->NUMERO_VAGA = $entrada['numero_vaga'];
        $tpl->HORA = $entrada['hora_entrada'];
        $tpl->TIPO_VEICULO = $entrada['tipo'];
        $tpl->block("BLOCK_ESTACIONAMENTO");
    }



    $tpl->show();

?>