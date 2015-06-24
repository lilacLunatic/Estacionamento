<?php
	require_once("../lib/Template.php");
	use raelgc\view\Template;

	$tpl = new Template("../view/menuAdmin.html");

	//TODO: chamar o DAO
	$tabela_precos = Array(
		Array('nome'=>"moto", "valor"=>4.00),
		Array('nome'=>"carro", "valor"=>5.00),
		Array('nome'=>"utilitario", "valor"=>7.00),
		Array('nome'=>"pernoite", "valor"=>18.00),
		Array('nome'=>"diaria", "valor"=>25.00),
		);

	foreach ($tabela_precos as $item){
		$tpl->NOME_VAGA = $item['nome'];
		$tpl->VALOR_VAGA = $item['valor'];
		$tpl->block("BLOCK_TIPOS_VAGA"); 
	}

	$tpl->show();
?>