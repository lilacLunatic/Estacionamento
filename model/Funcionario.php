<?php
class Funcionario{
	private $login, $senha, $is_admin, $id;

	public function __construct($login, $senha, $is_admin, $id=0){
		$this->setLogin($login);
		$this->setSenha($senha);
		$this->setId($id);
		$this->is_admin = $is_admin;
	}

	public function getLogin(){
		return $this->login;
	}

	public function getSenha(){
		return $this->senha;
	}

	public function getId(){
		return $this->senha;
	}

	public function setId($id){
		$this->id = (int)$id;
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