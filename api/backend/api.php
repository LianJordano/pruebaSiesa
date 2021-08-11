<?php
require_once("../config/conexion.php");

$metodo = $_SERVER["REQUEST_METHOD"];

switch ($metodo) {
    case 'POST':
            echo "no solicitado";
        break;

    case 'GET':

        if (!isset($_GET['id'])) {
            //Mostrar un post
            $sql = ("SELECT M.idmascota,M.nombre,P.nombre,TM.descripcion FROM mascota M LEFT JOIN tipo_mascota TM ON M.tipo_mascota=TM.idtipo_mascota LEFT JOIN propietario P ON P.idpropietario=M.propietario");
            $consulta = mysqli_query($conexion,$sql);
         
            echo json_encode(mysqli_fetch_all($consulta));
            exit();
        } else {
            
            $id = $_GET["id"];
            $sql = ("SELECT M.idmascota,M.nombre,P.nombre,TM.descripcion FROM mascota M LEFT JOIN tipo_mascota TM ON M.tipo_mascota=TM.idtipo_mascota LEFT JOIN propietario P ON P.idpropietario=M.propietario WHERE M.propietario=$id" );
            $consulta = mysqli_query($conexion,$sql);
         
            echo json_encode(mysqli_fetch_all($consulta));

            exit();
        }

        break;

    case 'PUT':
        echo "no solicitado";

        break;

    case 'DELETE':
        echo "no solicitado";

        break;


    default:
    echo "no solicitado";

        break;
}
