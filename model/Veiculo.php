<?php 
//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO
//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO//TODO
//O VEICULO DEVE POSSUIR REFERENCIA A UMA CLASSE TIPO COM NOME E ID, E NAO SIMPLESMENTE UMA FK NA CLASSE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!9ELEVEN

	class Veiculo{
	private $placa, $tipo, $marca, $modelo, $cor;

	public function __construct($placa, $tipo, $marca, $modelo, $cor){
		$this->setPlaca($placa);
		$this->setTipo($tipo);
		$this->setMarca($marca);
		$this->setModelo($modelo);
		$this->setCor($cor);
	}

	public function getPlaca(){
		return $this->placa;
	}

	public function getTipo(){
		return $this->tipo;
	}

	public function getMarca(){
		return $this->marca;
	}

	public function getModelo(){
		return $this->modelo;
	}

	public function getCor(){
		return $this->cor;
	}

	public function setPlaca($placa){
		$this->placa = (string)$placa;
	}

	public function setTipo($tipo){
		$this->tipo = (string)$tipo;
	}

	public function setMarca($marca){
		$this->marca = (string)$marca;
	}

	public function setModelo($modelo){
		$this->modelo = (string)$modelo;
	}

	public function setCor($cor){
		$this->cor = (string)$cor;
	}

}
?>