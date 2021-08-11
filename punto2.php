<?php 

    // Ejercicio Numero 2

    function division($numero1,$numero2){
        if(is_numeric($numero1) && is_numeric($numero2) ){
            if($numero2 > 0){
                $resultado = $numero1 / $numero2;
                return $resultado;
            }else{
                return "No se puede dividir entre cero!";
            }
        }else{
            return "Por favor ingrese valores validos!";
        }
    }

    // Inserte valores para la funcion aquí!!
    
    $num1=10;
    $num2=10;
    $res = division($num1,$num2);
    echo $res;



?>