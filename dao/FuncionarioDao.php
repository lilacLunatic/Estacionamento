<?php
include "../lib/conexao.php";
include "../model/Funcionario.php";
class FuncionarioDao{
	public function add($funcionario){
		$query = "insert into (login, senha, admin) values ($1, $2, $3)";
		
		$params = Array($funcionario->getLogin(), $funcionario->getSenha(), $funcionario->isAdmin());

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();
	}

	public function getById($id){
		$query = "select * from funcionario where id = $1";
		$params = Array($id);

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		$result = pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();

		$funcionarioArray = pg_fetch_array($result);

		$funcionario = new Funcionario(
			$funcionarioArray['login'],
			$funcionarioArray['senha'],
			$funcionarioArray['admin'] == 't',
			$funcionarioArray['id']);

		return $funcionario;
	}

	public function getByLogin($login){
		$query = "select * from funcionario where login = $1";
		$params = Array($login);

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		$result = pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();

		$funcionarioArray = pg_fetch_array($result);

		$funcionario = new Funcionario(
			$funcionarioArray['login'],
			$funcionarioArray['senha'],
			$funcionarioArray['admin'] == 't',
			$funcionarioArray['id']);

		return $funcionario;
	}

	public function autentica($login, $senha, $isAdmin){
		$query = "select * from funcionario where login = $1 and senha = $2 and admin = $3";

		$params = Array($login, $senha, $isAdmin ? 't' : 'f');

		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		$result = pg_query_params($conexao, $query, $params);
		$conexao->closeConexao();

		$funcionarioArray = pg_fetch_array($result);

		return !empty($funcionarioArray);
	}
}
/*
$joao = new Funcionario("joao123", "mango", true);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";

(new FuncionarioDao())->add($joao);*/
?>