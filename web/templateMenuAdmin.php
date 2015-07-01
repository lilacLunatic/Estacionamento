<?php
	require_once("../lib/Template.php");
	use raelgc\view\Template;
	include "../dao/VeiculoDao.php";

	$tpl = new Template("../view/menuAdmin.html");
    $veiculoDao = new VeiculoDao();
	
	$tabela_precos = $veiculoDao->getPrecos();

	foreach ($tabela_precos as $item){
		$tpl->NOME_VAGA = $item['nome'];
		$tpl->VALOR_VAGA = $item['valor'];
		$tpl->ID_PRECO = $item['id'];
		$tpl->block("BLOCK_PRECOS"); 
	}

	$vagas = $veiculoDao->getVagasLivres();

    foreach($vagas as $vaga){
        $tpl->ANDAR_VAGA= $vaga['andar'];
        $tpl->NUMERO_VAGA = $vaga['numero'];
        $tpl->TIPO_VAGA = $vaga['nome'];
        $tpl->block("BLOCK_VAGAS");
    }

	$tpl->show();
?>