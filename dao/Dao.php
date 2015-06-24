<?php
include "../lib/conexao.php";
class Dao{
	public function daoFetchArray($query, $params=0){
		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		if($params){
			$result = pg_query_params($connection, $query, $params);
		}else{
			$result = pg_query($connection, $query);
		}
		$conexao->closeConexao();

		return pg_fetch_array($result);
	}

	public function daoFetchAll($query, $params=0){
		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		if($params){
			$result = pg_query_params($connection, $query, $params);
		}else{
			$result = pg_query($connection, $query);
		}
		$conexao->closeConexao();

		return pg_fetch_all($result);
	}

	public function daoExecuteQuery($query, $params=0){
		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		if($params){
			pg_query_params($connection, $query, $params);
		}else{
			pg_query($connection, $query);
		}
	}
}

?>