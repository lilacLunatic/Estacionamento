<?php
class Conexao {
	
	private $conexao;
	public function getConexao() {
		try {
			$connection_string = "host=localhost ".
								"port=5433 ".
								"dbname=postgres ".
								"user=postgres ".
								"password=postgres";
			
			$this->conexao = pg_connect($connection_string);
			
			return $this->conexao;		
		} catch (Exception $e) {
			echo $e->getMessage();
		}
	}
	
	public function closeConexao() {
		$this->conexao = null;
	}
}
?>