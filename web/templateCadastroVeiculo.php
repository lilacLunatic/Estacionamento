
<?php

    require_once("../lib/Template.php");
    use raelgc\view\Template;
    include "../dao/VeiculoDao.php";

    $tpl = new Template("../view/cadastroVeiculos.html");
    $veiculo = new VeiculoDao();

    $tipos = $veiculo->getTipos();
    foreach($tipos as $t){
        $tpl->OPTION = $t['id'];
        $tpl->OPTION_NAME = $t['nome'];
        $tpl->block("BLOCK_OPTIONS");
    }

    $tpl->show();

?>
