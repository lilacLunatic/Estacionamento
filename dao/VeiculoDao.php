<?php
include "../lib/conexao.php";
include "../model/Veiculo.php";
class VeiculoDao{
	public function add($veiculo){
		$query = "insert into veiculo(placa, tipo, marca, modelo, cor) values ($1, $2, $3, $4, $5)";
		
		$params = Array($veiculo->getPlaca(), $veiculo->getTipo(), $veiculo->getMarca(), $veiculo->getModelo(), $veiculo->getCor()) ;

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();
	}

	public function getByPlaca($placa){
		$query = "select * from veiculo where placa = $1";
		$params = Array($placa);

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		$result = pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();

		$veiculoArray = pg_fetch_array($result);

		$veiculo = new Veiculo(
			$veiculoArray['placa'],
			$veiculoArray['tipo'],
			$veiculoArray['marca'],
			$veiculoArray['modelo'],
			$veiculoArray['cor']);

		return $veiculo;
	}


	public function getTipos(){
		$query = "select * from tipo";

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		$result = pg_query($connection, $query);
		$conexao->closeConexao();

		return pg_fetch_all($result);
	}

}
/*
$joao = new Funcionario("joao123", "mango", true);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";

(new FuncionarioDao())->add($joao);*/
?>