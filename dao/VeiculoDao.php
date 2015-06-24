<?php
include_once "../model/Veiculo.php";
include_once "Dao.php";
class VeiculoDao extends Dao{
	public function add($veiculo){
		$query = "insert into veiculo(placa, tipo, marca, modelo, cor) values ($1, $2, $3, $4, $5)";
		
		$params = Array($veiculo->getPlaca(), $veiculo->getTipo(), $veiculo->getMarca(), $veiculo->getModelo(), $veiculo->getCor()) ;

		parent::daoExecuteQuery($query, $params);
	}

	public function getByPlaca($placa){
		$query = "select * from veiculo where placa = $1";
		$params = Array($placa);

		$veiculoArray = parent::daoFetchArray($query, $params);
		print_r($veiculoArray);
		if(empty($veiculoArray)){
			return null;
		}else{
			$veiculo = new Veiculo(
				$veiculoArray['placa'],
				$veiculoArray['tipo'],
				$veiculoArray['marca'],
				$veiculoArray['modelo'],
				$veiculoArray['cor']);

			return $veiculo;
		}
	}


	public function getTipos(){
		$query = "select * from tipo";

		return parent::daoFetchAll($query);
	}

	public function checaEntrada($placa){
		$query = "select * from entrada where placa_veiculo = ? and hora_saida is null";
		//$now = date('d/m/Y H:i:s');
		$params = Array($placa);
		$result = parent::daoFetchAll($query, $params);
		if(is_null($result)){
			return false;
		}else{
			return true;
		}
	}

}
/*
$joao = new Funcionario("joao123", "mango", true);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";

(new FuncionarioDao())->add($joao);*/
?>