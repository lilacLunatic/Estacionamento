<?php
include_once "../model/Funcionario.php";
include_once "Dao.php";
class FuncionarioDao extends Dao{
	public function add($funcionario){
		$query = "insert into funcionario (login, senha, admin) values ($1, $2, $3)";
		
		$params = Array($funcionario->getLogin(), $funcionario->getSenha(), $funcionario->isAdmin());
		parent::daoExecuteQuery($connection, $query, $params);
	}

	public function getById($id){
		$query = "select * from funcionario where id = $1";
		$params = Array($id);

		$funcionarioArray = parent::daoFetchArray($query, $params);

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

		$funcionarioArray = parent::daoFetchArray($query, $params);

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
		print_r($params);

		$funcionarioArray = parent::daoFetchArray($query, $params);;
		print_r($funcionarioArray);
		return !empty($funcionarioArray);
	}
}

/*$joao = new Funcionario("joao123", "mango", true);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";

(new FuncionarioDao())->add($joao);*/
?>