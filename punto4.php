<style>
    .rojo{
        color:red;
    }
    .azul{
        color: blue;
    }
</style>

<?php 

    for ($i=1; $i <= 100; $i++) { 
        
        if($i % 3 == 0 && $i % 5 == 0){
            echo "<span class='azul'>Fizz<span><span class='rojo'>Buzz<span><br>";

        }else if($i % 5 == 0 && $i % 3 != 0){
            echo "<span class='rojo'>Buzz<span><br>";
        }else if($i % 3 == 0 && $i % 5 != 0){
            echo "<span class='azul'>Fizz<span><br>";

        }else{
            echo $i."<br>";
        }

    }




?>