<?php
include_once "../model/Veiculo.php";
include_once "Dao.php";
class VeiculoDao extends Dao{
	public function add($veiculo){
		$query = "insert into veiculo(placa, tipo, marca, modelo, cor) values ($1, $2, $3, $4, $5)";
		echo 'dowdowp';
		
		$params = Array($veiculo->getPlaca(), $veiculo->getTipo(), $veiculo->getMarca(), $veiculo->getModelo(), $veiculo->getCor()) ;

		parent::daoExecuteQuery($query, $params);
	}

	public function getByPlaca($placa){
		$query = "select * from veiculo where placa = $1";
		$params = Array($placa);

		$veiculoArray = parent::daoFetchArray($query, $params);
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
		$query = "select * from entrada where placa_veiculo = $1 and hora_saida is null";
		//$now = date('d/m/Y H:i:s');
		$params = Array($placa);
		$result = parent::daoFetchAll($query, $params);
		if(is_null($result) || empty($result)){
			return false;
		}else{
			return true;
		}
	}

	public function getEntradasAtuais(){
		$query = "select entrada.*, veiculo.tipo from entrada
					join veiculo on veiculo.placa = entrada.placa_veiculo
				 	where hora_saida is null";
		return parent::daoFetchAll($query);
	}

	public function saidaVeiculo($veiculo){
		$query = "update entrada set hora_saida = $1 where placa_veiculo = $2 and hora_saida is null";
		$now = date('d-m-Y H:i:s');
		$params = Array($now, $veiculo->getPlaca());
		parent::daoExecuteQuery($query, $params);
		
	}

	public function entradaVeiculo($veiculo){
		$query = "insert into entrada(hora_entrada,placa_veiculo,andar_vaga,numero_vaga) values($1,$2,$3,$4)";
		$now = date('d-m-Y H:i:s');
		$vagas = $this->getVagasLivresPorTipo($veiculo);
		if(empty($vagas) || is_null($vagas)){
			return false;
		}
		$randomKey = array_rand($vagas);
		$params = Array($now, $veiculo->getPlaca(), $vagas[$randomKey]['andar'], $vagas[$randomKey]['numero']);
		parent::daoExecuteQuery($query, $params);
		return true;
	}

	public function getEntrada($placa){
		$query = "select * from entrada where placa_veiculo = $1 and hora_saida is null";
		$params = Array($placa);
		return parent::daoFetchAll($query, $params);
	}

	public function getUltimaSaida($placa){
		$query = "select * from entrada where placa_veiculo = $1 order by hora_saida desc limit 1";
		$params = Array($placa);
		return parent::daoFetchAll($query, $params);
	}

	public function getVagasLivresPorTipo($veiculo){
		$query = "select * from vaga
				where andar not in (select andar_vaga from entrada where hora_saida is null) and numero not in (select numero_vaga from entrada where hora_saida is null)
				and tipo_vaga = $1";
		$params = Array($veiculo->getTipo()//->getId()
			);
		return parent::daoFetchAll($query, $params);
	}
	public function getVagasLivres(){
		$query = "select * from vaga
				where cast(andar as varchar) || cast(numero as varchar) not in (select cast(andar_vaga as varchar) || cast(numero_vaga as varchar) from entrada where hora_saida is null) ";	
		return parent::daoFetchAll($query);
	}

}
/*
$joao = new Funcionario("joao123", "mango", true);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";

(new FuncionarioDao())->add($joao);*/
?>