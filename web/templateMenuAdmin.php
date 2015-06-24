<?php
	require_once("../lib/Template.php");
	use raelgc\view\Template;

	$tpl = new Template("../view/menuAdmin.html");

	$tabela_precos = Array(
		"moto"=>4.00,
		"carro"=>5.00,
		"utilitario"=>7.00
		"pernoite"=>18.00
		"diaria"=>25.00
		);

	foreach ($tabela_precos as $tipo => $preco){
		$tpl->NOME_VAGA = $tipo;
		$tpl->VALOR_VAGA = $preco;
		$tpl->block("BLOCK_TIPOS_VAGA"); 
	}

?>