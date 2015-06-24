
<?php

    require_once("../lib/Template.php");
    use raelgc\view\Template;
    include "../dao/VeiculoDao.php";

    $tpl = new Template("../view/cadastroVeiculos.html");
    $veiculoDap = new VeiculoDao();

    $tipos = $veiculoDao->getTipos();
    foreach($tipos as $t){
        $tpl->OPTION = $t['id'];
        $tpl->OPTION_NAME = $t['nome'];
        $tpl->block("BLOCK_OPTIONS");
    }

    $tpl->show();

?>
