<?php

if (!empty($_POST)){

        $txt_id = utf8_decode($_POST["txt_id"]);    
        $txt_codigo = utf8_decode($_POST["txt_codigo"]);
        $txt_nombres = utf8_decode($_POST["txt_nombres"]);
        $txt_apellidos = utf8_decode($_POST["txt_apellidos"]);
        $txt_direccion = utf8_decode($_POST["txt_direccion"]);
        $txt_telefono = utf8_decode($_POST["txt_telefono"]);
        $txt_fn = utf8_decode($_POST["txt_fn"]);
        $drop_puesto = utf8_decode($_POST["drop_puesto"]);

        $sql = "";

        if(ISSET($_POST["btn_agregar"])){
            $sql = "INSERT INTO empleados(codigo, nombres, apellidos, direccion, telefono, fecha_nacimiento, id_puesto)
                    VALUES ('". $txt_codigo ."', '". $txt_nombres ."', '". $txt_apellidos ."', '". $txt_direccion ."', '". $txt_telefono ."', '". $txt_fn ."', ". $drop_puesto .")";
        }

        if(ISSET($_POST["btn_modificar"])){
            $sql = "UPDATE empleados SET
                    codigo = '". $txt_codigo ."',
                    nombres = '". $txt_nombres ."',
                    apellidos = '". $txt_apellidos ."',
                    direccion = '". $txt_direccion ."',
                    telefono = '". $txt_telefono ."',
                    fecha_nacimiento = '". $txt_fn ."',
                    id_puesto = ". $drop_puesto ."
                    WHERE id_empleado = ". $txt_id ."";
        }

        if(ISSET($_POST["btn_eliminar"])){
            $sql = "DELETE FROM empleados WHERE id_empleado = ". $txt_id .";";
        }

        include ("datos_conexion.php");
        $db_conexion = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
    
        if ($db_conexion -> query($sql) === TRUE) {
            $db_conexion -> close();
            header("Location: /empresa_php");
        }else{
            echo "Error al agregar los datos: " . $sql ."<br>" . $db_conexion -> close();
        }
    }

?>