<?php 


    function elPerfecto($valor){
        $divisibles = [];
        if(is_array($valor)){
            for ($i=0; $i < count($valor); $i++) { 
                for ($j=1; $j < $valor[$i] ; $j++) { 
                   if($valor[$i] % $j == 0){
                    echo $j."-";
                    array_push($divisibles,$j);
                   }
                }
                $perfecto = array_sum($divisibles);
                $divisibles=[""];
                
                if($perfecto==$valor[$i]){
                    echo " / Perfecto<br>";
                }else{
                    echo " / No Pefecto<br>";
                }
            }
            //fin
        }else if(is_numeric($valor) && !is_array($valor)){
            if($valor > 0){
            for ($i=1; $i < $valor ; $i++) { 
                if($valor % $i == 0){
                    array_push($divisibles,$i);
                }
            }
            $perfecto = array_sum($divisibles);
            if($perfecto == $valor){
                $arr =[];
                $arr = [$divisibles, "Perfecto"];
                return json_encode($arr);
            }else{
                $arr =[];
                $arr = [$divisibles, "No es perfecto"];
                return json_encode($arr);
            }
         }else{
            return "invalido, numero menor que cero!";

         }
        }else{
            return "invalido";
        }
    }
    // Ejecute la funcion aqui
    $arreglo = [6,28,61];
    $numero = "6";
    $necio = "asa";
    echo elPerfecto($arreglo);
