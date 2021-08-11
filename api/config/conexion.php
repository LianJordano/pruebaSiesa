<?php 
    $parametros =["HOST"=>"localhost","USER"=>"root","PASS"=>"","DBNAME"=>"bd_mascotas"];
    try {
        $conexion = mysqli_connect($parametros["HOST"],$parametros["USER"],$parametros["PASS"],$parametros["DBNAME"]);
    } catch (Exception $e) {
        echo $e->getMessage();
    }
?>