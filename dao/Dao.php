<?php
class Dao{
	public function dao_fetch_array($query, $params=0){
		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		if($params){
			$result = pg_query_params($conexao, $query, $params);
		}else{
			$result = pg_query($conexao, $query);
		}
		$conexao->closeConexao();

		return pg_fetch_array($result);
	}

	public function dao_fetch_all($query, $params=0){
		$conexao = new Conexao();
		$connection = $conexao->getConexao();
		if($params){
			$result = pg_query_params($conexao, $query, $params);
		}else{
			$result = pg_query($conexao, $query);
		}
		$conexao->closeConexao();

		return pg_fetch_all($result);
	}
}

?>