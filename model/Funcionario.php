<?php
class Funcionario{
	private $login, $senha, $is_admin;
	public function __construct($login, $senha, $is_admin){
		$this->setLogin($login);
		$this->setSenha($senha);
		$this->is_admin = $is_admin;
	}

	public function getLogin(){
		return $this->login;
	}

	public function getSenha(){
		return $this->senha;
	}

	public function setLogin($login){
		$this->login = (string)$login;
	}

	public function setSenha($senha){
		$this->senha = (string)$senha;
	}

	public function isAdmin(){
		return $this->is_admin;
	}
}


/*$joao = new Funcionario("joao123", "mango", false);

echo $joao->getLogin() . " " . $joao->getSenha() . " " . ($joao->isAdmin() ? 1 : 0) . "\n";*/
?>